# End the loop if index exceeds loop length. 
execute if score #index esefy.temporary.loop_util > #length esefy.temporary.loop_util run return 1

# Store index in esefy:tmp.loop
execute store result storage esefy:tmp loop.index int 1 run scoreboard players get #index esefy.temporary.loop_util

# Macro esefy:tmp.loop into the reciever and store what it returns
$execute store result storage esefy:tmp loop.break byte 1 run function $(reciever_function) with storage esefy:tmp loop

# If the reciever returns 1, end the loop immeadiately.
execute if data storage esefy:tmp {loop:{break:1b}} run return 2

# Increment loop
scoreboard players add #index esefy.temporary.loop_util 1

# Run this function again with the same macro
$function esefy:util/loop/steps/repeating {reciever_function:"$(reciever_function)"}