say index

# Run function with list entry, store success
$execute store success storage esefy:tmp list_loop.success byte 1 run function $(function) with $(list)[$(index)]

# Break loop and return 0 if function failed
execute if data storage esefy:tmp {list_loop:{success:0b}} run return 0

$scoreboard players set #index esefy.util.list_loop $(index)

# Return 1 if loop is complete
$say score #index esefy.util.list_loop matches $(max_index)
$execute if score #index esefy.util.list_loop matches $(max_index).. run return 1


$data modify storage esefy:tmp list_loop.macro set value {function:"$(function)",list:"$(list)",max_index:$(max_index)}
execute store result storage esefy:tmp list_loop.macro.index int 1 run scoreboard players add #index esefy.util.list_loop 1


return run function esefy:util/list_loop/steps/01_repeating with storage esefy:tmp list_loop.macro

# EXIT CODES:
#   0:  loop was broken due to function fail
#   1:  loop finished