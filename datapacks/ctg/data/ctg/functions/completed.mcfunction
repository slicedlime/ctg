# Bling for completing an exercise goes here
function ctg:text/exercise_completed
execute as @a at @s run playsound minecraft:ctg.complete master @s ~ ~ ~
execute at @a run summon marker ~ ~ ~ {Tags:["_ctg_complete_effect"]}
