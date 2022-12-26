setblock ~ ~-1 ~ air
data modify block -5 98 -110 auto set value 0
tellraw @a [{"translate":"Whoops - that was the wrong selector! I've turned your command block off for now.", "color": "red"}]
