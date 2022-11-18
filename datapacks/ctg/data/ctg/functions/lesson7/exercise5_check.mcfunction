# Check if you wrote the right command

fill 1024 10 1024 1034 40 1034 air
scoreboard players set L7E5Check _ctg_main 1
tp @e[type=rabbit] ~ -100 ~
kill @e[type=rabbit]

setblock 1024 10 1024 repeating_command_block[facing=east]{auto:1b}
data modify block 1024 10 1024 Command set from block 104 115 -50 Command
setblock 1025 10 1024 chain_command_block{auto:1b,Command:"function ctg:lesson7/exercise5_tick_check"}

summon rabbit 1024 20 1024 {NoAI:1,Tags:["_ctg_l7e5_test_rabbit"]}
summon rabbit 1024 20 1024 {NoAI:1}
summon rabbit 1024 20 1024 {NoAI:1}
summon rabbit 1024 20 1024 {NoAI:1}
summon rabbit 1024 20 1024 {NoAI:1}
summon rabbit 1024 20 1024 {NoAI:1}
summon rabbit 1024 20 1024 {NoAI:1}
summon rabbit 1024 20 1024 {NoAI:1}
