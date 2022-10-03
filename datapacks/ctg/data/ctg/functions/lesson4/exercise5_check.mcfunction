# Check if you did the right thing
tag @a add _ctg_l4e5_check
fill 1024 15 1024 1024 16 1025 air
clone -28 113 41 -28 113 42 1024 16 1024
data modify block 1024 16 1025 auto set value 0
data modify block 1024 16 1025 powered set value 0
data modify block 1024 16 1025 auto set value 1
clear @a diamond_shovel
