# Package map files
from operator import le
import os
from distutils import dir_util
import shutil
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

def make_datapack(folder, lesson):
    print('Making datapack for lesson ' + str(lesson))
    # Copy folder
    dir_util.copy_tree('datapacks/ctg', folder + '/ctg')

    # Rewrite mcmeta
    if lesson == 0:
        range_description = '(Intro)'
    elif lesson == 1:
        range_description = '(Lesson 1)'
    else:
        range_description = '(Lessons 1-' + str(lesson) + ')'
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

def mirror_dir(name, folder):
    dir_util.copy_tree(name,  folder + '/' + name)

def mirror_file(name, folder):
    shutil.copyfile(name, folder + '/' + name)

def make_world(folder, pack_path, output_path, lesson):
    print('Packaging world for lesson ' + str(lesson))
    os.makedirs(folder, exist_ok=True)
    # World data
    mirror_dir('entities',  folder)
    mirror_dir('poi',  folder)
    mirror_dir('region',  folder)
    # Metadata
    os.makedirs(folder + '/data', exist_ok=True)
    mirror_file('data/scoreboard.dat', folder)
    # Datapack
    os.makedirs(folder + '/datapacks', exist_ok=True)
    shutil.copy(pack_path, folder + '/datapacks/ctg.zip')
    # Top-level files
    mirror_file('icon.png', folder)
    mirror_file('level.dat', folder)
    # Create level zip
    zip_path = output_path + '/CommandTrainingGrounds.zip'
    zip(zip_path, folder)
    return zip_path

def package_lesson(end_lesson):
    lesson_folder = BUILD_PREFIX + 'Lesson%02d' % end_lesson
    pack_folder = lesson_folder + '/Pack'
    pack_path = make_datapack(pack_folder, end_lesson)

    world_folder = lesson_folder + '/CommandTrainingGrounds'
    world_zip_path = make_world(world_folder, pack_path, lesson_folder, end_lesson)

    output_path = OUTPUT_PREFIX + 'Lesson%02d' % end_lesson
    os.makedirs(output_path)
    shutil.copyfile(pack_path, output_path + '/ctg.zip')
    shutil.copyfile(world_zip_path, output_path + '/CommandTrainingGrounds.zip')

lesson_count = 2
for end_lesson in range(lesson_count + 1):
    package_lesson(end_lesson)
