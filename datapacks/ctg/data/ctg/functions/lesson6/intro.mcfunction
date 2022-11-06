function ctg:gamemode/spectator
execute if entity @a[tag=_ctg_need_transition] run function ctg:lesson6/transition_setup
function ctg:transition
execute as @a[scores={_ctg_intro=0..}] run function ctg:lesson6/transition_spline

execute if score Tick _ctg_main matches 110 run function ctg:text/lesson6/intro_title
execute if score Tick _ctg_main matches 200 run function ctg:text/lesson6/intro_l1
execute if score Tick _ctg_main matches 280 run function ctg:text/lesson6/intro_link
execute if score Tick _ctg_main matches 370.. if entity @a[tag=_ctg_transition_done] run function ctg:lesson6/intro_end
