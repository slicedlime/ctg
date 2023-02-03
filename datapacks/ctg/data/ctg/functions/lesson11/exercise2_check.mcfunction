# Check if you did the right thing
tag @a add _ctg_l11e2_check

fill 1024 10 1024 1026 100 1026 air
setblock 1024 11 1024 oak_log[axis=y]
setblock 1024 10 1024 command_block
setblock 1024 30 1024 command_block
setblock 1024 51 1024 oak_log[axis=z]
setblock 1024 50 1024 command_block
data modify block 1024 10 1024 Command set from block -77 100 -18 Command
data modify block 1024 10 1024 auto set value 1
data modify block 1024 30 1024 Command set from block -77 100 -18 Command
data modify block 1024 30 1024 auto set value 1
data modify block 1024 50 1024 Command set from block -77 100 -18 Command
data modify block 1024 50 1024 auto set value 1
