# For safety, run a bunch of backup functionality in case the player accidentally deletes scoreboards
function ctg:safety/check

# Tick up and dispatch correct lesson script
execute unless score ErrorMode _ctg_main matches 0.. run function ctg:tick
execute unless score ErrorMode _ctg_main matches 0.. run function ctg:dispatch

# Clear scratch space
function ctg:safety/clear
