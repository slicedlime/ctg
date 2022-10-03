# Check if you did the right thing
tag @a add _ctg_l4e6_check
fill 1024 10 1024 1024 319 1024 air
setblock 1024 319 1024 command_block
data modify block 1024 319 1024 Command set from block -27 113 45 Command
data modify block 1024 319 1024 auto set value 1
