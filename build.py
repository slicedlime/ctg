import pathlib
import re
import json

TELLRAW_PATTERN = re.compile('tellraw \@[aeprs](\[.*?\])? (.*)')

def decode(json, strings, allow_non_translate = False) -> str:
    if 'translate' in json or 'lookup' in json:
        if 'lookup' in json:
            key = json['lookup']
        else:
            key = json['translate']

        if 'with' in json:
            sub_object = json['with']
            if isinstance(sub_object, list):
                if len(sub_object) > 1:
                    raise Exception("Can't handle list of > 1 item as sub-object")
                sub_object = sub_object[0]
            sub_key = decode(sub_object, strings)
            if not sub_key in key:
                raise Exception("with clause doesn't index into top-level string")
            strings[key] = key.replace(sub_key, '%s')
        else:
            strings[key] = key
        return key
    elif not allow_non_translate:
        raise Exception("Can't handle non-translate sub-key without lookup")

# Find all text strings, move them to languages

strings = dict()
for path in pathlib.Path('datapacks/ctg/data/ctg/functions').rglob('*.mcfunction'):
    with open(path.absolute(), 'r') as file:
        try:
            lines = file.readlines()
            for line in lines:
                match = TELLRAW_PATTERN.match(line)
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
