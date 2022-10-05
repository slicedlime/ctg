# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson2/exercise4_l1
function ctg:text/lesson2/exercise4_objective

# Win condition
execute if score ExpectedCookies _ctg_main matches 2.. run scoreboard players add ExpectedCookies _ctg_main 1

execute store result score Cookies _ctg_scratch run clear @a cookie 0
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 4 if score Cookies _ctg_scratch matches 2 run scoreboard players set ExpectedCookies _ctg_main 2

execute if score ExpectedCookies _ctg_main matches 2.. unless score Cookies _ctg_scratch = ExpectedCookies _ctg_main run scoreboard players reset ExpectedCookies _ctg_main

execute if score ExpectedCookies _ctg_main matches 64 run function ctg:text/lesson2/exercise4_l2
execute if score ExpectedCookies _ctg_main matches 160 run function ctg:text/lesson2/exercise4_l3
execute if score ExpectedCookies _ctg_main matches 320 run function ctg:text/lesson2/exercise4_l4

scoreboard players set Complete _ctg_scratch 0
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 4 if score ExpectedCookies _ctg_main matches 350 run scoreboard players set Complete _ctg_scratch 1

execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 4 if score ExpectedCookies _ctg_main matches 350 run function ctg:lesson2/continue
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 4 if score ExpectedCookies _ctg_main matches 350 run scoreboard players set Lesson _ctg_scratch 3
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 4 if score ExpectedCookies _ctg_main matches 350 run scoreboard players set Exercise _ctg_scratch 0
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 4 if score ExpectedCookies _ctg_main matches 350 run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 4 if score ExpectedCookies _ctg_main matches 350 run function ctg:store

execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 0 if score ExpectedCookies _ctg_main matches 350 run fill 14 100 -50 50 120 -15 air replace repeating_command_block
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 0 if score ExpectedCookies _ctg_main matches 350 run fill 14 121 -50 50 140 -15 air replace repeating_command_block

execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 0 if score ExpectedCookies _ctg_main matches 350 run scoreboard players reset ExpectedCookies _ctg_main
