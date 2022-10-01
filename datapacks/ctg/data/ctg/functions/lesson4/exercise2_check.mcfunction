# Check if you did the right thing
tag @a add _ctg_l4e2_check
fill 1024 16 1024 1026 32 1026 air
setblock 1024 16 1026 command_block
data modify block 1024 16 1026 Command set from block -19 113 35 Command
data modify block 1024 16 1026 auto set value 1
