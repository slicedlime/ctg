# Check if you did the right thing
fill 1024 10 1024 1032 100 1032 air
setblock 1024 10 1024 command_block
data modify block 1024 10 1024 Command set from block -84 101 -20 Command
data modify block 1024 10 1024 auto set value 1
clear @a emerald