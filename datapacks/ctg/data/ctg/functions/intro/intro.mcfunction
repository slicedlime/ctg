function ctg:gamemode/adventure

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

teleport @a[x=0,y=0,z=0,distance=..90] 0 102 0
effect give @a resistance 1 100 true
effect give @a instant_health 1 100 true
effect give @a saturation 1 100 true
