# Marco keys: function, index, max_index

# storage path: eseframe:cache tick.util.loop.function_success
# scoreboard:   eseframe.util.loop


# Run function with index, store success
$execute store success storage eseframe:cache tick.util.loop.function_success byte 1 run function $(function) {index:$(index)}

# Break loop and return 0 if function failed
execute if data storage eseframe:cache {tick:{util:{loop:{function_success:0b}}}} run return 0

# Store current index in scoreboard
$scoreboard players set #index eseframe.util.loop $(index)

# Return 1 if stored index is at least max_index
$execute if score #index eseframe.util.loop matches $(max_index).. run return 1

# Copy keys "function" and "max_index" to storage for looping
$data modify storage eseframe:cache tick.util.loop.macro set value {function:"$(function)",max_index:$(max_index)}

# Add 1 to index to set new "index" in storage
execute store result storage eseframe:cache tick.util.loop.macro.index int 1 run scoreboard players add #index eseframe.util.loop 1

# Repeat
return run function eseframe:util/loop/start with storage eseframe:cache tick.util.loop.macro

# EXIT CODES:
#   0:  loop was broken due to function fail
#   1:  loop finished

# FIXME: if run with a higher index than end_index, it runs once with the index and then stops instead of doing nothing