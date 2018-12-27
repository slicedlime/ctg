# Dispatch correct lesson script depending on lesson scores
execute if score Lesson _ctg_main matches 0 if score Exercise _ctg_main matches 0 run function ctg:intro/intro