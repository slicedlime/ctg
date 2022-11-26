fill 1024 10 1024 1032 30 1032 air
execute unless entity @e[type=spider,tag=_ctg_l8_e8_missed] run summon spider 1024 20 1024 {NoAI:1b,Tags:["_ctg_l8_e8_missed"], PersistenceRequired: 1b}
execute unless entity @e[type=spider,tag=_ctg_l8_e8_target] run summon spider 1024 30 1024 {NoAI:1b,Tags:["_ctg_l8_e8_target", "jumpy"], PersistenceRequired: 1b}
