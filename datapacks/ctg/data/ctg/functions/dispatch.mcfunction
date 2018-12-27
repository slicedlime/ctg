# Dispatch correct lesson script depending on lesson scores
execute if score Lesson _ctg_main matches 0 if score Exercise _ctg_main matches 0 run function ctg:intro/intro

execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 0 run function ctg:lesson1/intro
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 1 run function ctg:lesson1/exercise1
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 2 run function ctg:lesson1/exercise2
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 3 run function ctg:lesson1/exercise3
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 4 run function ctg:lesson1/exercise4
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 5 run function ctg:lesson1/exercise5
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 6 run function ctg:lesson1/exercise6

execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 0 run function ctg:next_episode/intro
