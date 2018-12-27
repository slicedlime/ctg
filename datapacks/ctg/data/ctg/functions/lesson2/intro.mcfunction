# Stall

function ctg:text/next_episode/next_episode_objective

execute if score Tick _ctg_main matches 1 run function ctg:text/next_episode/next_episode_title
execute if score Tick _ctg_main matches 1 run function ctg:text/next_episode/next_episode_l1
execute if score Tick _ctg_main matches 100 run function ctg:text/next_episode/next_episode_l2
