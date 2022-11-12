# Check if you did the right thing
tag @a add _ctg_l6e12_check
fill 1024 10 1024 1026 30 1026 air
setblock 1024 10 1024 command_block
data modify block 1024 10 1024 Command set from block 98 130 29 Command
data modify block 1024 10 1024 auto set value 1
