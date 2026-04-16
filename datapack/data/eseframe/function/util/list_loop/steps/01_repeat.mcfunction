# storage path: eseframe:cache tick.util.list_loop.Step01
# scoreboard:   eseframe.util.list_loop


# RETURN CODES:
#   0: loop was exited by return code fail or -2
#   1: loop completed


# ----------------------------------------------------------------------------------------------------------


## Insert the index into a copy of an entry of the list

# Get a copy of the current list entry
$data modify storage eseframe:cache tick.util.list_loop.Step01.ListEntryWithIndex set from $(list_path)[$(index)]

# Overwrite the entry copy's "index" key with the list index if $(pass_index) is true
$execute if predicate {condition:"minecraft:value_check",value:$(pass_index),range:1} run data modify storage eseframe:cache tick.util.list_loop.Step01.ListEntryWithIndex.index set value $(index)


## Run the given function with the modified entry copy from the list, stop early and/or delete index if requested.

# Run the function with the modified copy of the list entry, store success and return code
$execute store success storage eseframe:cache tick.util.list_loop.Step01.Success byte 1 store result storage eseframe:cache tick.util.list_loop.Step01.Result int 1 run function $(function) with storage eseframe:cache tick.util.list_loop.Step01.ListEntryWithIndex

# If return code matches -1 or -2 (can be checked with predicate), delete the index
$execute if predicate {condition:"minecraft:value_check",value:{type:"minecraft:storage",storage:"eseframe:cache",path:"tick.util.list_loop.Step01.Result"},range:{min:-2,max:-1}} run data remove $(list_path)[$(index)]

# If return code was fail or -2, return 0
execute if predicate {condition:"minecraft:any_of",terms:[{condition:"minecraft:value_check",value:{type:"minecraft:storage",storage:"eseframe:cache",path:"tick.util.list_loop.Step01.Success"},range:0},{condition:"minecraft:value_check",value:{type:"minecraft:storage",storage:"eseframe:cache",path:"tick.util.list_loop.Step01.Result"},range:-2}]} run return 0



## Increase index (unless it was deleted) and stop if it exceeds the length of the list

# Store list $(list_path)[] length as score #max_index
$execute store result score #max_index eseframe.util.list_loop run function eseframe:util/get_list_highest_index/run {list_path:'$(list_path)'}

# Set score #index to $(index)
$scoreboard players set #index eseframe.util.list_loop $(index)

# Increase #index score by 1, unless this index was deleted, in which case it is already on the next entry
execute unless predicate {condition:"minecraft:value_check",value:{type:"minecraft:storage",storage:"eseframe:cache",path:"tick.util.list_loop.Step01.Result"},range:-1} run scoreboard players add #index eseframe.util.list_loop 1

# If the index is outside the list, the loop is complete. Send return code 1.
execute if score #index eseframe.util.list_loop > #max_index eseframe.util.list_loop run return 1



## Repeat this function

# Set up a macro with the same function, list_path, and pass_index
$data modify storage eseframe:cache tick.util.list_loop.Step01.RepeatMacro set value {function:"$(function)",list_path:'$(list_path)',pass_index:"$(pass_index)"}

# Insert the updated index into the new macro
execute store result storage eseframe:cache tick.util.list_loop.Step01.RepeatMacro.index int 1 run scoreboard players get #index eseframe.util.list_loop


# Run this function again with the macro
function eseframe:util/list_loop/steps/01_repeat with storage eseframe:cache tick.util.list_loop.Step01.RepeatMacro