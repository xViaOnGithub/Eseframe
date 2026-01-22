# Macros used: id, end_index, target_function_path, index_path, macro_path

# Store index to index path
$execute store result $(index_path) int 1 run scoreboard players get $(id) esefy.util.loop

# Call the target function with macro path
$function $(target_function_path) with $(macro_path)

## TODO: Dedicated "break" and "break_all" functions that can be called and detected here

# If index matches end_index, cleanup and end the loop.
$execute if score $(id) esefy.util.loop matches $(end_index) run return run function esefy:util/loop/steps/03_cleanup {id:"$(id)"}

# Increment loop
$scoreboard players add $(id) esefy.util.loop 1

# Run this function again with the same macros
$function esefy:util/loop/steps/02_repeating {id:"$(id)",end_index:$(end_index),target_function_path:"$(target_function_path)",index_path:"$(index_path)",macro_path:"$(macro_path)"}