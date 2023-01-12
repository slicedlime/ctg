# Generate [RandomBits _ctg_scratch] bits of randomness into Random

scoreboard players set 2 _ctg_scratch 2
scoreboard players set Random _ctg_scratch 0

function ctg:util/random_r

scoreboard players reset 2 _ctg_scratch
scoreboard players reset RandomBits _ctg_scratch
