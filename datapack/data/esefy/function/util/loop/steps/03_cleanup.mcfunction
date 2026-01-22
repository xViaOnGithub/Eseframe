# Macros: id
# Storage used: esefy:util loop.tmp03, esefy:util loop (persistant*)

$data modify storage esefy:util loop.tmp03.id set value "$(id)"

# If this is the root layer of the loop, reset the scoreboard (including the counter used to generate ids), storage, and  
execute if data storage esefy:util {loop:{tmp03:{id:"1"}}} run scoreboard players reset * esefy.util.loop
execute if data storage esefy:util {loop:{tmp03:{id:"1"}}} run data remove storage esefy:util loop
execute if data storage esefy:util {loop:{tmp03:{id:"1"}}} run return 1
execute if data storage esefy:util {loop:{tmp03:{id:"1"}}} run say id 1 ended, scoreboard and storage cleared

# If not, just reset this id's score and remove this function's storage
$scoreboard players reset $(id) esefy.util.loop
data remove storage esefy:util loop.tmp03