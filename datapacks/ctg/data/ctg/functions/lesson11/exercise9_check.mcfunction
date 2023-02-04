# Check if you did the right thing
tag @a add _ctg_l11e9_check

fill 1024 10 1024 1026 100 1026 air
setblock 1024 10 1024 command_block
setblock 1024 30 1024 command_block
setblock 1024 50 1024 command_block
summon pig 1024 31 1024 {NoAI:1,Tags:["_ctg_l11e9p1"]}
data modify block 1024 10 1024 Command set from block -83 101 -25 Command
data modify block 1024 10 1024 auto set value 1
data modify block 1024 30 1024 Command set from block -83 101 -25 Command
data modify block 1024 30 1024 auto set value 1
data modify block 1024 50 1024 Command set from block -83 101 -25 Command
data modify block 1024 50 1024 auto set value 1
