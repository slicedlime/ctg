# Player state
function ctg:gamemode/creative
execute if score Tick _ctg_main matches 1 run clear @a

scoreboard objectives remove _ctg_stick_used

setblock 48 134 69 emerald_block
setblock 48 134 66 diamond_block
execute if score Tick _ctg_main matches 1 run setblock 48 135 66 polished_blackstone_button[face=floor,facing=east,powered=false]
scoreboard players reset DisplayCooldown _ctg_main

execute unless entity @p[tag=_ctg_l5e10_check] unless block 47 135 72 minecraft:lectern[facing=east,has_book=true,powered=false]{Book:{Count:1b,id:"minecraft:written_book",tag:{pages:['{"text":"Oh mighty Shor-Warr, Ruler of the Darkness and Lord of the Pain!\\n\\nYour Minion has come to bring glory to Shor-Warr all over the lands of man!\\n\\nYour priests will rule in your name.\\n\\nErin, 1st High Priest of Shor-Warr"}','{"text":"Oh mighty Shor-Warr, Ruler of the Darkness and Lord of the Pain, praise to you and your Minion!\\n\\nForgive us the errors of the old man Erin.\\n\\nPlease send your powers to your dutifull servants.\\n\\nGoril, High Priest of Shor-Warr"}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":"Oh mighty and mercifull Shor-Warr, we thank you for showing us our faults!\\n\\nThe darkness sings your praise and all man will join them.\\n\\nMBak, High Priest of Shorr-Warr"}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":"Oh Shor-Warr,\\n\\nplease give your last priest the mercy of a quick death.\\n\\nEnorr"}'],title:"The Last Priest's Lament",author:GB}},Page:0} run setblock 47 135 72 minecraft:lectern[facing=east,has_book=true,powered=false]{Book:{Count:1b,id:"minecraft:written_book",tag:{pages:['{"text":"Oh mighty Shor-Warr, Ruler of the Darkness and Lord of the Pain!\\n\\nYour Minion has come to bring glory to Shor-Warr all over the lands of man!\\n\\nYour priests will rule in your name.\\n\\nErin, 1st High Priest of Shor-Warr"}','{"text":"Oh mighty Shor-Warr, Ruler of the Darkness and Lord of the Pain, praise to you and your Minion!\\n\\nForgive us the errors of the old man Erin.\\n\\nPlease send your powers to your dutifull servants.\\n\\nGoril, High Priest of Shor-Warr"}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":"Oh mighty and mercifull Shor-Warr, we thank you for showing us our faults!\\n\\nThe darkness sings your praise and all man will join them.\\n\\nMBak, High Priest of Shorr-Warr"}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":"Oh Shor-Warr,\\n\\nplease give your last priest the mercy of a quick death.\\n\\nEnorr"}'],title:"The Last Priest's Lament",author:GB}},Page:0}

# Description
execute if score Tick _ctg_main matches 1 run function ctg:text/lesson5/exercise10_l1
execute if score Tick _ctg_main matches 80 run function ctg:text/lesson5/exercise10_l2
execute if score Tick _ctg_main matches 160 run function ctg:text/lesson5/exercise10_l3
function ctg:text/lesson5/exercise10_objective

# Win condition
execute if block 48 135 69 command_block store success score CommandExecuted _ctg_scratch run setblock 48 135 66 polished_blackstone_button[face=floor,facing=east,powered=false]

scoreboard players set Completed _ctg_scratch 0
execute if score Lesson _ctg_main matches 5 if score Exercise _ctg_main matches 10 if entity @a[tag=_ctg_l5e10_check] if block 47 135 72 minecraft:lectern[facing=east,has_book=true,powered=false]{Book:{Count:1b,id:"minecraft:written_book",tag:{pages:['{"text":"Oh mighty Shor-Warr, Ruler of the Darkness and Lord of the Pain!\\n\\nYour Minion has come to bring glory to Shor-Warr all over the lands of man!\\n\\nYour priests will rule in your name.\\n\\nErin, 1st High Priest of Shor-Warr"}','{"text":"Oh mighty Shor-Warr, Ruler of the Darkness and Lord of the Pain, praise to you and your Minion!\\n\\nForgive us the errors of the old man Erin.\\n\\nPlease send your powers to your dutifull servants.\\n\\nGoril, High Priest of Shor-Warr"}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":"Oh mighty and mercifull Shor-Warr, we thank you for showing us our faults!\\n\\nThe darkness sings your praise and all man will join them.\\n\\nMBak, High Priest of Shorr-Warr"}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":""}','{"text":"Oh Shor-Warr,\\n\\nplease give your last priest the mercy of a quick death.\\n\\nEnorr"}'],title:"The Last Priest's Lament",author:GB}},Page:0} run scoreboard players set Completed _ctg_scratch 1

tag @a remove _ctg_l5e10_check

execute if score CommandExecuted _ctg_scratch matches 1 run function ctg:lesson5/exercise10_check

execute if score Completed _ctg_scratch matches 1 run function ctg:lesson5/continue
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Lesson _ctg_scratch 6
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Exercise _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run scoreboard players set Tick _ctg_scratch 0
execute if score Completed _ctg_scratch matches 1 run function ctg:store
