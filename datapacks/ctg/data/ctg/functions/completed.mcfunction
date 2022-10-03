# Bling for completing an exercise goes here
function ctg:text/exercise_completed
playsound minecraft:ctg.complete master @a
execute at @a run summon marker ~ ~ ~ {Tags:["_ctg_complete_effect"]}
