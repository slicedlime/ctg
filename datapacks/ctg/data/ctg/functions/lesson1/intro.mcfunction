function ctg:spectator_mode
function ctg:transition

execute if score Tick _ctg_main matches 110 run function ctg:text/lesson1/intro_title
execute if score Tick _ctg_main matches 200 run function ctg:text/lesson1/intro_l1
execute if score Tick _ctg_main matches 280 run function ctg:text/lesson1/intro_link
execute if score Tick _ctg_main matches 370.. unless entity @e[tag=_ctg_body] run function ctg:lesson1/intro_end
