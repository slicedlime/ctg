function ctg:adventure_mode

execute if score Tick _ctg_main matches 10 run function ctg:text/lesson1/intro_title
execute if score Tick _ctg_main matches 100 run function ctg:text/lesson1/intro_l1
execute if score Tick _ctg_main matches 180 run function ctg:text/lesson1/intro_link
execute if score Tick _ctg_main matches 270 run function ctg:lesson1/intro_end