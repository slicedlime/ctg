# Dispatch correct lesson script depending on lesson scores
execute if score Lesson _ctg_main matches 0 if score Exercise _ctg_main matches 0 run function ctg:intro/intro

execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 0 run function ctg:lesson1/intro
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 1 run function ctg:lesson1/exercise1
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 2 run function ctg:lesson1/exercise2
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 3 run function ctg:lesson1/exercise3
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 4 run function ctg:lesson1/exercise4
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 5 run function ctg:lesson1/exercise5
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 6 run function ctg:lesson1/exercise6

execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 0 run function ctg:lesson2/intro
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 1 run function ctg:lesson2/exercise1
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 2 run function ctg:lesson2/exercise2
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 3 run function ctg:lesson2/exercise3
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 4 run function ctg:lesson2/exercise4

execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 0 run function ctg:lesson3/intro
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 1 run function ctg:lesson3/exercise1
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 2 run function ctg:lesson3/exercise2
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 3 run function ctg:lesson3/exercise3
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 4 run function ctg:lesson3/exercise4
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 5 run function ctg:lesson3/exercise5
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 6 run function ctg:lesson3/exercise6

execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 0 run function ctg:lesson4/intro
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 1 run function ctg:lesson4/exercise1
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 2 run function ctg:lesson4/exercise2
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 3 run function ctg:lesson4/exercise3
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 4 run function ctg:lesson4/exercise4
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 5 run function ctg:lesson4/exercise5
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 6 run function ctg:lesson4/exercise6
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 7 run function ctg:lesson4/exercise7
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 8 run function ctg:lesson4/exercise8

execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 0 run function ctg:next_episode/intro
