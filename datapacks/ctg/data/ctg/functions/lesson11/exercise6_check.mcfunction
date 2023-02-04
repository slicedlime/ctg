# Check if you did the right thing
fill 1024 10 1024 1032 100 1032 air
setblock 1024 10 1024 command_block
data modify block 1024 10 1024 Command set from block -79 100 -23 Command
data modify block 1024 10 1024 auto set value 1
clear @p diamond
