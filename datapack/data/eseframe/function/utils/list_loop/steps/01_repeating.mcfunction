# Run function with list entry, store success
$execute store success storage eseframe:tmp list_loop.success byte 1 run function $(function) with $(list)[$(index)]

# Break loop and return 0 if function failed
execute if data storage eseframe:tmp {list_loop:{success:0b}} run return 0

$scoreboard players set #index eseframe.util.list_loop $(index)

# Return 1 if loop is complete
$execute if score #index eseframe.util.list_loop matches $(max_index).. run return 1


$data modify storage eseframe:tmp list_loop.macro set value {function:"$(function)",list:'$(list)',max_index:$(max_index)}
execute store result storage eseframe:tmp list_loop.macro.index int 1 run scoreboard players add #index eseframe.util.list_loop 1


return run function eseframe:utils/list_loop/steps/01_repeating with storage eseframe:tmp list_loop.macro

# EXIT CODES:
#   0:  loop was broken due to function fail
#   1:  loop finished