# Check if you did the right thing
tag @a add _ctg_l5e10_check
fill 1024 10 1024 1026 20 1026 air
setblock 47 135 72 air
setblock 48 126 65 air
setblock 1024 10 1024 command_block
data modify block 1024 10 1024 Command set from block 48 135 69 Command
data modify block 1024 10 1024 auto set value 1
