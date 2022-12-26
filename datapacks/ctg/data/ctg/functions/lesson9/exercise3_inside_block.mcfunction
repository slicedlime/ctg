setblock ~ ~ ~ air
data modify block -5 98 -110 auto set value 0
tellraw @s [{"translate":"Oh no, you ended up inside a gold block! I've turned your command block off for now.", "color": "red"}]
