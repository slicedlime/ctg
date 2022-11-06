function ctg:gamemode/spectator
execute if entity @a[tag=_ctg_need_transition] run function ctg:lesson2/transition_setup
function ctg:transition

execute if score Tick _ctg_main matches 110 run function ctg:text/lesson2/intro_title
execute if score Tick _ctg_main matches 200 run function ctg:text/lesson2/intro_l1
execute if score Tick _ctg_main matches 280 run function ctg:text/lesson2/intro_link
execute if score Tick _ctg_main matches 370.. unless entity @e[tag=_ctg_body] unless entity @a[tag=_ctg_need_transition] if entity @a run function ctg:lesson2/intro_end
