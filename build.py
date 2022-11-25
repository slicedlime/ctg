import json
import os.path
import pathlib
import re

TELLRAW_PATTERN = re.compile('.*tellraw \@[aeprs](\[.*?\])? (.*)')
TITLE_PATTERN = re.compile('.*title \@[aeprs](\[.*?\])? \w+ (.*)')

FUNCTIONS_DIR = 'datapacks/ctg/data/ctg/functions'

def set_string(strings: dict, key: str, value: str):
    if key in strings:
        if strings[key] != value:
            raise Exception('Duplicate key with different values: ' + key)
    strings[key] = value

def decode(json, strings, allow_non_translate = False) -> str:
    if 'translate' in json or 'lookup' in json:
        if 'lookup' in json:
            key = json['lookup']
        else:
            key = json['translate']

        if 'with' in json:
            sub_objects = json['with']
            value = key
            if not isinstance(sub_objects, list):
                raise Exception("Expected a list for with clause")
            for sub_object in sub_objects:
                sub_key = decode(sub_object, strings)
                if not sub_key in key:
                    raise Exception("with clause doesn't index into top-level string")
                value = value.replace(sub_key, '%s')
            set_string(strings, key, value)
        else:
            set_string(strings, key, key)
        return key
    elif not allow_non_translate:
        raise Exception("Can't handle non-translate sub-key without lookup")

# Find all text strings, move them to languages

strings = dict()
for path in pathlib.Path(FUNCTIONS_DIR).rglob('*.mcfunction'):
    with open(path.absolute(), 'r') as file:
        try:
            lines = file.readlines()
            for line in lines:
                match = TELLRAW_PATTERN.match(line)
                if not match:
                    match = TITLE_PATTERN.match(line)
                if match:
                    json_string = match.group(2)
                    data = json.loads(json_string)
                    if isinstance(data, list):
                        for object in data:
                            decode(object, strings, True)
                    else:
                        decode(data, strings, True)
        except Exception as e:
            print(f'Error in {path}: ' + str(e))

with open('resourcepacks/ctg/assets/minecraft/lang/en_us.json', 'w') as en_us_file:
    en_us_file.write(json.dumps(strings, sort_keys=True, indent=4))

# Write dispatch
dispatch = []

dispatch.append('execute if score Lesson _ctg_main matches 0 if score Exercise _ctg_main matches 0 run function ctg:intro/intro')
dispatch.append('')

lesson = 1
while os.path.isdir(f'{FUNCTIONS_DIR}/lesson{lesson}'):
    dispatch.append(f'execute if score Lesson _ctg_main matches {lesson} if score Exercise _ctg_main matches 0 run function ctg:lesson{lesson}/intro')
    exercise = 1
    while os.path.exists(f'{FUNCTIONS_DIR}/lesson{lesson}/exercise{exercise}.mcfunction'):
        dispatch.append(f'execute if score Lesson _ctg_main matches {lesson} if score Exercise _ctg_main matches {exercise} run function ctg:lesson{lesson}/exercise{exercise}')
        exercise += 1
    dispatch.append('')
    lesson += 1

dispatch.append(f'execute if score Lesson _ctg_main matches {lesson} if score Exercise _ctg_main matches 0 run function ctg:next_episode/intro')
dispatch.append('# Dispatch correct lesson script depending on lesson scores')

with open(f'{FUNCTIONS_DIR}/dispatch.mcfunction', 'w') as dispatch_file:
    dispatch.reverse()
    for line in dispatch:
        dispatch_file.write(f'{line}\n')
