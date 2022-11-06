# Switch to next transition node

execute as @a run spectate
kill @e[tag=_ctg_target]
kill @e[tag=_ctg_eye_target]
kill @e[tag=_ctg_view]
scoreboard objectives add _ctg_intro dummy
scoreboard players set @a _ctg_intro 0
