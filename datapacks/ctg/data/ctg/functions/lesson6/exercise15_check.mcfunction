# Check if you did the right thing
tag @a add _ctg_l6e15_check
fill 1024 20 1024 1026 30 1026 air
setblock 1024 20 1024 command_block
place template ctg:lesson6/diamonds_test 109 131 24
data modify block 1024 20 1024 Command set from block 111 132 19 Command
data modify block 1024 20 1024 auto set value 1
