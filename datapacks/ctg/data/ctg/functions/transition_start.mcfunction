# Set up transition
kill @e[tag=_ctg_view]
tag @a add _ctg_need_transition
execute at @p run summon armor_stand ~ ~ ~ {Tags:["_ctg_view"], NoGravity:1b, Invisible:1b}
execute as @a run spectate @e[tag=_ctg_view,limit=1]
