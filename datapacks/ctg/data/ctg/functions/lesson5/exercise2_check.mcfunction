# Check if you did the right thing
tag @a add _ctg_l5e2_check
fill 1024 10 1024 1026 20 1026 air
setblock 1025 10 1024 command_block
setblock 1026 10 1024 command_block
setblock 1024 12 1024 stone
data modify block 1025 10 1024 Command set from block 49 135 76 Command
data modify block 1025 10 1024 auto set value 1
data modify block 1026 10 1024 Command set from block 49 135 76 Command
data modify block 1026 10 1024 auto set value 1
