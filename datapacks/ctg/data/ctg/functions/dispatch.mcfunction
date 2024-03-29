# Dispatch correct lesson script depending on lesson scores
execute if score Lesson _ctg_main matches 12 if score Exercise _ctg_main matches 0 run function ctg:next_episode/intro

execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 12 run function ctg:lesson11/exercise12
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 11 run function ctg:lesson11/exercise11
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 10 run function ctg:lesson11/exercise10
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 9 run function ctg:lesson11/exercise9
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 8 run function ctg:lesson11/exercise8
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 7 run function ctg:lesson11/exercise7
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 6 run function ctg:lesson11/exercise6
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 5 run function ctg:lesson11/exercise5
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 4 run function ctg:lesson11/exercise4
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 3 run function ctg:lesson11/exercise3
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 2 run function ctg:lesson11/exercise2
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 1 run function ctg:lesson11/exercise1
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 0 run function ctg:lesson11/intro

execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 11 run function ctg:lesson10/exercise11
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 10 run function ctg:lesson10/exercise10
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 9 run function ctg:lesson10/exercise9
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 8 run function ctg:lesson10/exercise8
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 7 run function ctg:lesson10/exercise7
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 6 run function ctg:lesson10/exercise6
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 5 run function ctg:lesson10/exercise5
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 4 run function ctg:lesson10/exercise4
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 3 run function ctg:lesson10/exercise3
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 2 run function ctg:lesson10/exercise2
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 1 run function ctg:lesson10/exercise1
execute if score Lesson _ctg_main matches 10 if score Exercise _ctg_main matches 0 run function ctg:lesson10/intro

execute if score Lesson _ctg_main matches 9 if score Exercise _ctg_main matches 5 run function ctg:lesson9/exercise5
execute if score Lesson _ctg_main matches 9 if score Exercise _ctg_main matches 4 run function ctg:lesson9/exercise4
execute if score Lesson _ctg_main matches 9 if score Exercise _ctg_main matches 3 run function ctg:lesson9/exercise3
execute if score Lesson _ctg_main matches 9 if score Exercise _ctg_main matches 2 run function ctg:lesson9/exercise2
execute if score Lesson _ctg_main matches 9 if score Exercise _ctg_main matches 1 run function ctg:lesson9/exercise1
execute if score Lesson _ctg_main matches 9 if score Exercise _ctg_main matches 0 run function ctg:lesson9/intro

execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 10 run function ctg:lesson8/exercise10
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 9 run function ctg:lesson8/exercise9
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 8 run function ctg:lesson8/exercise8
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 7 run function ctg:lesson8/exercise7
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 6 run function ctg:lesson8/exercise6
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 5 run function ctg:lesson8/exercise5
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 4 run function ctg:lesson8/exercise4
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 3 run function ctg:lesson8/exercise3
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 2 run function ctg:lesson8/exercise2
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 1 run function ctg:lesson8/exercise1
execute if score Lesson _ctg_main matches 8 if score Exercise _ctg_main matches 0 run function ctg:lesson8/intro

execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 10 run function ctg:lesson7/exercise10
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 9 run function ctg:lesson7/exercise9
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 8 run function ctg:lesson7/exercise8
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 7 run function ctg:lesson7/exercise7
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 6 run function ctg:lesson7/exercise6
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 5 run function ctg:lesson7/exercise5
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 4 run function ctg:lesson7/exercise4
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 3 run function ctg:lesson7/exercise3
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 2 run function ctg:lesson7/exercise2
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 1 run function ctg:lesson7/exercise1
execute if score Lesson _ctg_main matches 7 if score Exercise _ctg_main matches 0 run function ctg:lesson7/intro

execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 15 run function ctg:lesson6/exercise15
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 14 run function ctg:lesson6/exercise14
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 13 run function ctg:lesson6/exercise13
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 12 run function ctg:lesson6/exercise12
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 11 run function ctg:lesson6/exercise11
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 10 run function ctg:lesson6/exercise10
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 9 run function ctg:lesson6/exercise9
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 8 run function ctg:lesson6/exercise8
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 7 run function ctg:lesson6/exercise7
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 6 run function ctg:lesson6/exercise6
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 5 run function ctg:lesson6/exercise5
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 4 run function ctg:lesson6/exercise4
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 3 run function ctg:lesson6/exercise3
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 2 run function ctg:lesson6/exercise2
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 1 run function ctg:lesson6/exercise1
execute if score Lesson _ctg_main matches 6 if score Exercise _ctg_main matches 0 run function ctg:lesson6/intro

execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 10 run function ctg:lesson5/exercise10
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 9 run function ctg:lesson5/exercise9
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 8 run function ctg:lesson5/exercise8
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 7 run function ctg:lesson5/exercise7
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 6 run function ctg:lesson5/exercise6
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 5 run function ctg:lesson5/exercise5
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 4 run function ctg:lesson5/exercise4
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 3 run function ctg:lesson5/exercise3
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 2 run function ctg:lesson5/exercise2
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 1 run function ctg:lesson5/exercise1
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 0 run function ctg:lesson5/intro

execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 8 run function ctg:lesson4/exercise8
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 7 run function ctg:lesson4/exercise7
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 6 run function ctg:lesson4/exercise6
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 5 run function ctg:lesson4/exercise5
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 4 run function ctg:lesson4/exercise4
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 3 run function ctg:lesson4/exercise3
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 2 run function ctg:lesson4/exercise2
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 1 run function ctg:lesson4/exercise1
execute if score Lesson _ctg_main matches 4 if score Exercise _ctg_main matches 0 run function ctg:lesson4/intro

execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 6 run function ctg:lesson3/exercise6
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 5 run function ctg:lesson3/exercise5
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 4 run function ctg:lesson3/exercise4
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 3 run function ctg:lesson3/exercise3
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 2 run function ctg:lesson3/exercise2
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 1 run function ctg:lesson3/exercise1
execute if score Lesson _ctg_main matches 3 if score Exercise _ctg_main matches 0 run function ctg:lesson3/intro

execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 4 run function ctg:lesson2/exercise4
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 3 run function ctg:lesson2/exercise3
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 2 run function ctg:lesson2/exercise2
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 1 run function ctg:lesson2/exercise1
execute if score Lesson _ctg_main matches 2 if score Exercise _ctg_main matches 0 run function ctg:lesson2/intro

execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 6 run function ctg:lesson1/exercise6
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 5 run function ctg:lesson1/exercise5
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 4 run function ctg:lesson1/exercise4
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 3 run function ctg:lesson1/exercise3
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 2 run function ctg:lesson1/exercise2
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 1 run function ctg:lesson1/exercise1
execute if score Lesson _ctg_main matches 1 if score Exercise _ctg_main matches 0 run function ctg:lesson1/intro

execute if score Lesson _ctg_main matches 0 if score Exercise _ctg_main matches 0 run function ctg:intro/intro
