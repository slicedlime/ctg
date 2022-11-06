# Set up transition
kill @e[tag=_ctg_view]
tag @a add _ctg_need_transition
tag @a remove _ctg_transition_done
execute at @p run summon armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Tags:["_ctg_view"], CustomName:'"CTG View"'}
execute as @p at @s run summon marker ^ ^ ^10 {Tags:["_ctg_eye_interpolation"]}
execute as @a run spectate @e[tag=_ctg_view,limit=1]
