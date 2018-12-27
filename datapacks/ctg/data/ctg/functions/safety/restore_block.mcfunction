# Someone tampered with our backup block!

function ctg:text/block_error

setblock 1024 0 1024 minecraft:end_gateway{"ExitPortal":{"X":0,"Y":0,"Z":0}}
data merge block 1024 0 1024 {"ExitPortal":{"X":0,"Y":0,"Z":0}}
