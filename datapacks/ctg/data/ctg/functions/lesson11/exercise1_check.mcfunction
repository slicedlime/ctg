# Check if you did the right thing
tag @a add _ctg_l11e1_check

fill 1024 10 1024 1026 100 1026 air
setblock 1024 9 1024 deepslate
setblock 1024 10 1024 command_block
setblock 1024 30 1024 command_block
setblock 1024 49 1024 deepslate
setblock 1024 50 1024 command_block
data modify block 1024 10 1024 Command set from block -82 101 -14 Command
data modify block 1024 10 1024 auto set value 1
data modify block 1024 30 1024 Command set from block -82 101 -14 Command
data modify block 1024 30 1024 auto set value 1
data modify block 1024 50 1024 Command set from block -82 101 -14 Command
data modify block 1024 50 1024 auto set value 1
