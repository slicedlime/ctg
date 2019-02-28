# Stall

function ctg:text/next_episode/next_episode_objective

execute if score Tick _ctg_main matches 10 run function ctg:text/next_episode/next_episode_title
execute if score Tick _ctg_main matches 10 run function ctg:text/next_episode/next_episode_l1
execute if score Tick _ctg_main matches 100 run function ctg:text/next_episode/next_episode_l2
execute if score Tick _ctg_main matches 180 run function ctg:text/next_episode/next_episode_l3
execute if score Tick _ctg_main matches 260 run function ctg:text/next_episode/next_episode_l4
execute if score Tick _ctg_main matches 300 run function ctg:text/next_episode/next_episode_objective
