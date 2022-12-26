setblock ~ ~-1 ~ air
execute align y run tp @s ~ ~-1 ~
tellraw @s [{"translate":"Whoops! You probably shouldn't jump with that thing active!", "color": "red"}]
