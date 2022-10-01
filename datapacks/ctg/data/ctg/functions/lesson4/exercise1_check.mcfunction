# Check if you did the right thing
tag @a add _ctg_l4e1_check
fill 1024 16 1024 1024 32 1024 air
setblock 1024 16 1024 command_block
data modify block 1024 16 1024 Command set from block -15 113 36 Command
data modify block 1024 16 1024 auto set value 1
