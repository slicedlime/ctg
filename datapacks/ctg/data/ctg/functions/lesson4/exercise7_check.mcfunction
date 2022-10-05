# Check if you did the right thing
tag @a add _ctg_l4e7_check
fill 1024 10 1024 1024 319 1026 air
clone -22 113 46 -22 113 48 1024 16 1024
data modify block 1024 16 1024 auto set value 0
data modify block 1024 16 1024 powered set value 0
data modify block 1024 16 1024 auto set value 1
