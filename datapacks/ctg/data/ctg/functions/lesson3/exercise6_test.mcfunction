# Set up a test to see if the player's chain does the right thing
setblock -21 125 -39 minecraft:polished_blackstone_button[face=floor,facing=west]

# Remove template statue for this tick
fill -27 125 -34 -26 128 -32 air

# Blank out player space
fill -27 125 -39 -26 128 -37 air

# Trigger block
data merge block -22 125 -32 {auto:0}
data merge block -22 125 -32 {auto:1}

# Check next tick
scoreboard players set L3E6Test _ctg_main 1
