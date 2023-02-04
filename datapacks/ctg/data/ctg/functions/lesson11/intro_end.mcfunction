# End the intro, move to exercise 1

# Only do stuff if we're in the right lesson
execute unless score Lesson _ctg_main matches 11 unless score Exercise _ctg_main matches 0 run function ctg:text/cheater

execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 0 run setblock -86 103 -19 minecraft:mangrove_wall_sign[facing=east,waterlogged=false]{Text4:'{"text":"start over"}',Text3:'{"clickEvent":{"action":"run_command","value":"/function ctg:restart_exercise"},"text":"Click here to"}',Text2:'{"text":"Octojen!"}',Text1:'{"text":"Island by"}',GlowingText:1b}

execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 0 run kill @e[type=armor_stand,tag=_ctg_view]

# Continue to exercise 1
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 0 run scoreboard players set Lesson _ctg_scratch 11
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 0 run scoreboard players set Exercise _ctg_scratch 1
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 0 run scoreboard players set Tick _ctg_scratch 0
execute if score Lesson _ctg_main matches 11 if score Exercise _ctg_main matches 0 run function ctg:store

tag @a[tag=_ctg_transition_done] remove _ctg_transition_done

# Until MC-102223 is fixed
execute positioned -92 102 -20 run kill @e[type=painting,distance=..32]
summon minecraft:painting -94.97 103.00 -20.00 {Motion: [0.0d, 0.0d, 0.0d], facing: 3b, Invulnerable: 0b, Air: 300s, OnGround: 0b, PortalCooldown: 0, Rotation: [270.0f, 0.0f], FallDistance: 0.0f, Fire: -1s, variant: "minecraft:bust", TileY: 103, TileX: -95, TileZ: -20}
summon minecraft:painting -88.03 108.00 -19.00 {Motion: [0.0d, 0.0d, 0.0d], facing: 1b, Invulnerable: 0b, Air: 300s, OnGround: 0b, PortalCooldown: 0, Rotation: [90.0f, 0.0f], FallDistance: 0.0f, Fire: -1s, variant: "minecraft:void", TileY: 108, TileX: -89, TileZ: -20}
summon minecraft:painting -93.97 108.00 -20.00 {Motion: [0.0d, 0.0d, 0.0d], facing: 3b, Invulnerable: 0b, Air: 300s, OnGround: 0b, PortalCooldown: 0, Rotation: [270.0f, 0.0f], FallDistance: 0.0f, Fire: -1s, variant: "minecraft:skull_and_roses", TileY: 108, TileX: -94, TileZ: -20}
