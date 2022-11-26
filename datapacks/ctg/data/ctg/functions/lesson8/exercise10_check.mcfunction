# Check if you did the right thing
tag @a add _ctg_l8e10_check
tp @e[type=axolotl,tag=_ctg_l8_e10] ~ -300 ~
kill @e[type=axolotl,tag=_ctg_l8_e10]

fill 1024 10 1024 1026 30 1026 air
setblock 1024 10 1024 command_block
data modify block 1024 10 1024 Command set from block 38 92 -106 Command
data modify block 1024 10 1024 auto set value 1
