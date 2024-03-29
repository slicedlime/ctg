scoreboard players add L7E10Check _ctg_main 1

# No rabbit?
execute positioned 1024 11 1024 unless entity @e[type=rabbit,distance=..1] run function ctg:text/lesson7/exercise10_failed_no_rabbit
execute positioned 1024 11 1024 unless entity @e[type=rabbit,distance=..1] run function ctg:lesson7/exercise10_end_check

# Move rabbit back
execute positioned 1024 11 1024 as @e[type=rabbit,distance=..1,limit=1,tag=_ctg_l7e10_test_rabbit] run scoreboard players add L7E10Score _ctg_main 1
execute positioned 1024 11 1024 as @e[type=rabbit,distance=..1,limit=1] run teleport @s 1024 20 1024

# Still a rabbit?
execute positioned 1024 11 1024 if entity @e[type=rabbit,distance=..1,limit=1] run function ctg:text/lesson7/exercise10_failed_too_many
execute positioned 1024 11 1024 if entity @e[type=rabbit,distance=..1,limit=1] run function ctg:lesson7/exercise10_end_check
