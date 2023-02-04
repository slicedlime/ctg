# Check if you did the right thing
tag @a add _ctg_l11e5_check

fill 1024 10 1024 1032 100 1032 air
setblock 1024 10 1024 command_block
place template ctg:lesson6/plushie_void 1024 11 1024
# Set blocks just outside to verify that their area isn't too large
setblock 1027 31 1024 stone
setblock 1024 31 1026 stone
setblock 1024 35 1024 stone
setblock 1024 30 1024 command_block
place template ctg:lesson11/plushie_wrong 1024 31 1024
setblock 1024 50 1024 command_block
place template ctg:lesson11/plushie_wrong2 1024 51 1024

data modify block 1024 10 1024 Command set from block -75 101 -14 Command
data modify block 1024 10 1024 auto set value 1
data modify block 1024 30 1024 Command set from block -75 101 -14 Command
data modify block 1024 30 1024 auto set value 1
data modify block 1024 50 1024 Command set from block -75 101 -14 Command
data modify block 1024 50 1024 auto set value 1
