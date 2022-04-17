# Package map files
from operator import le
import os
from distutils import dir_util
import shutil
from struct import pack
from sys import prefix
from zipfile import ZipFile

BUILD_PREFIX = 'build/'
OUTPUT_PREFIX = 'output/'

def zip(zip_filename, folder, excludes = []):
    with ZipFile(zip_filename, 'w') as zip:
        # Iterate over all the files in directory
        for folder_name, subfolders, filenames in os.walk(folder):
            for filename in filenames:
                # create complete filepath of file in directory
                file_path = os.path.join(folder_name, filename)
                if os.path.basename(file_path) in excludes:
                    continue

                relative = os.path.relpath(file_path, folder)
                # Add file to zip
                zip.write(file_path, relative)

def process_file(filename, mapping):
    with open(filename, 'r') as file:
        lines = file.readlines()
    with open(filename, 'w') as file:
        for line in lines:
            for pattern in mapping.keys():
                if pattern in line:
                    line = line.replace(pattern, mapping[pattern])
            file.write(line)

def strip_lesson_folders(parent_folder, lesson):
    lesson_folders = [ f.name for f in os.scandir(parent_folder) if f.is_dir() and f.name[:6] == 'lesson' ]
    for sfolder in lesson_folders:
        folder_lesson = int(sfolder[6:])
        if folder_lesson > lesson:
            shutil.rmtree(parent_folder + '/' + sfolder)

def mirror_dir(name, folder):
    dir_util.copy_tree(name,  folder + '/' + name)

def mirror_file(name, folder):
    shutil.copyfile(name, folder + '/' + name)

def get_lesson_desc(lesson):
    if lesson == 0:
        return '(Intro)'
    elif lesson == 1:
        return'(Lesson 1)'
    else:
        return '(Lessons 1-' + str(lesson) + ')'

def make_datapack(folder, lesson):
    print('Making datapack for lesson ' + str(lesson))
    # Copy folder
    dir_util.copy_tree('datapacks/ctg', folder + '/ctg')

    # Rewrite mcmeta
    range_description = get_lesson_desc(lesson)
    process_file(folder + '/ctg/pack.mcmeta', {
        '$DESCRIPTION': 'Commang Training Grounds datapack ' + range_description
    })

    # Strip lesson folders for future lessons
    strip_lesson_folders(folder + '/ctg/data/ctg/functions', lesson)
    strip_lesson_folders(folder + '/ctg/data/ctg/functions/text', lesson)

    # Rewrite dispatch
    dispatch_file = folder + '/ctg/data/ctg/functions/dispatch.mcfunction'
    with open(dispatch_file, 'r') as file:
        lines = file.readlines()
    lesson_prefix = 'execute if score Lesson _ctg_main matches '
    prefix_len = len(lesson_prefix)
    with open(dispatch_file, 'w') as file:
        for line in lines:
            if line[:prefix_len] == lesson_prefix:
                line_lesson = int(line[prefix_len:prefix_len+2].rstrip())
                if line_lesson > lesson:
                    continue
            file.write(line)
        file.write('execute if score Lesson _ctg_main matches ' + str(lesson + 1) + ' if score Exercise _ctg_main matches 0 run function ctg:next_episode/intro\n')

    # Create pack zip
    pack_file = folder + '/ctg.zip'
    zip(pack_file, folder + '/ctg', ['ctg.zip'])
    return pack_file

def make_resourcepack(folder, lesson):
    print('Making datapack for lesson ' + str(lesson))
    # Copy folder
    dir_util.copy_tree('resourcepacks/ctg', folder + '/ctg')

    # Rewrite mcmeta
    range_description = get_lesson_desc(lesson)
    process_file(folder + '/ctg/pack.mcmeta', {
        '$DESCRIPTION': 'Commang Training Grounds resources ' + range_description
    })

    # Strip strings
    lang_folder = folder + '/ctg/assets/minecraft/lang'
    lang_files = [f for f in os.listdir(lang_folder) if os.path.isfile(os.path.join(lang_folder, f))]
    for lang_name in lang_files:
        lang_file = os.path.join(lang_folder, lang_name)
        with open(lang_file, 'r') as file:
            lines = file.readlines()
        section_prefix = '    "--------- '
        prefix_len = len(section_prefix)
        in_stripped_section = False
        with open(lang_file, 'w') as file:
            for line in lines:
                if line[:prefix_len] == section_prefix:
                    # New section
                    in_stripped_section = False
                    header = line[prefix_len:]
                    if header[:7] == 'Lesson ':
                        header_for = int(header[7:9].rstrip())
                        in_stripped_section = header_for > lesson
                if not in_stripped_section:
                    file.write(line)

    # Create pack zip
    pack_file = folder + '/resources.zip'
    zip(pack_file, folder + '/ctg', ['resources.zip'])
    return pack_file

def copy_packs(folder, pack_path, resource_zip_path):
    # Datapack
    os.makedirs(folder + '/datapacks', exist_ok=True)
    shutil.copy(pack_path, folder + '/datapacks/ctg.zip')
    # Resource pack
    shutil.copy(resource_zip_path, folder + '/resources.zip')

def make_world(folder, pack_path, resource_zip_path, output_path, lesson):
    print('Packaging world for lesson ' + str(lesson))
    os.makedirs(folder, exist_ok=True)
    # World data
    mirror_dir('entities',  folder)
    mirror_dir('poi',  folder)
    mirror_dir('region',  folder)
    # Metadata
    os.makedirs(folder + '/data', exist_ok=True)
    mirror_file('data/scoreboard.dat', folder)
    # Packs
    copy_packs(folder, pack_path, resource_zip_path)
    # Top-level files
    mirror_file('icon.png', folder)
    mirror_file('level.dat', folder)
    # Create level zip
    zip_path = output_path + '/CommandTrainingGrounds.zip'
    zip(zip_path, folder)
    return zip_path

def make_upgrade_zip(folder, pack_path, resource_zip_path, output_path):
    os.makedirs(folder, exist_ok=True)
    copy_packs(folder, pack_path, resource_zip_path)
    # Create level zip
    zip_path = output_path + '/Upgrade.zip'
    zip(zip_path, folder)
    return zip_path

def package_lesson(end_lesson):
    lesson_folder = BUILD_PREFIX + 'Lesson%02d' % end_lesson
    shutil.rmtree(lesson_folder)
    pack_folder = lesson_folder + '/Pack'
    pack_path = make_datapack(pack_folder, end_lesson)

    resource_folder = lesson_folder + '/Resources'
    resource_zip_path = make_resourcepack(resource_folder, end_lesson)

    world_folder = lesson_folder + '/CommandTrainingGrounds'
    upgrade_zip_path = make_upgrade_zip(world_folder, pack_path, resource_zip_path, lesson_folder)
    world_zip_path = make_world(world_folder, pack_path, resource_zip_path, lesson_folder, end_lesson)

    output_path = OUTPUT_PREFIX + 'Lesson%02d' % end_lesson
    os.makedirs(output_path, exist_ok=True)
    shutil.copyfile(pack_path, output_path + '/ctg.zip')
    shutil.copyfile(resource_zip_path, output_path + '/resources.zip')
    shutil.copyfile(upgrade_zip_path, output_path + '/Upgrade.zip')
    shutil.copyfile(world_zip_path, output_path + '/CommandTrainingGrounds.zip')

lesson_count = 2
for end_lesson in range(lesson_count + 1):
    package_lesson(end_lesson)
