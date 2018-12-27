function ctg:adventure_mode

execute if score Tick _ctg_main matches 10 run function ctg:text/intro/intro_l0
execute if score Tick _ctg_main matches 100 run function ctg:text/intro/intro_l1
execute if score Tick _ctg_main matches 180 run function ctg:text/intro/intro_l2
execute if score Tick _ctg_main matches 320 run function ctg:text/intro/intro_l3
execute if score Tick _ctg_main matches 450 run function ctg:text/intro/intro_l4
execute if score Tick _ctg_main matches 600 run function ctg:text/intro/intro_l5
execute if score Tick _ctg_main matches 720 run function ctg:text/intro/intro_l6
execute if score Tick _ctg_main matches 860 run function ctg:text/intro/intro_l7
execute if score Tick _ctg_main matches 1080 run function ctg:text/intro/intro_l8
execute if score Tick _ctg_main matches 1100 run function ctg:text/intro/intro_link
execute if score Tick _ctg_main matches 1100.. run function ctg:text/intro/intro_objective