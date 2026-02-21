# Macros used: id, end_index, target_function_path, index_path, macro_path

## Exit codes:
#   1: loop completed without issue
#   0: loop was broken out of


$say $(index_path)

# Store index to index path
$execute store result $(index_path) int 1 run scoreboard players get $(id) esefy.util.loop

# Reset the return flag
scoreboard players reset break esefy.util.loop

# Call the target function with macro path
$function $(target_function_path) with $(macro_path)

# If index matches end_index OR break flag is present, cleanup and end the loop.
$execute if score $(id) esefy.util.loop matches $(end_index) run return run function esefy:util/loop/steps/03_cleanup {id:"$(id)"}
$execute if score break esefy.util.loop matches 1 run return run function esefy:util/loop/steps/03_cleanup {id:"$(id)"}

# Increment loop
$scoreboard players add $(id) esefy.util.loop 1

# Run this function again with the same macros
# (Using return run will pass the exit code all the way back up to the start script)
$return run function esefy:util/loop/steps/02_repeating {id:"$(id)",end_index:$(end_index),target_function_path:"$(target_function_path)",index_path:"$(index_path)",macro_path:"$(macro_path)"}