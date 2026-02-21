## PURPOSE:
#      Runs a "target" function mutliple times in a row, [TODO Summary]


## HOW TO USE:
#    AS: Any (current single executor is passed onto reciever)
#    AT: Any (position is passed onto reciever)
#       
#       [TODO Overview]


## MACRO KEYS               TYPE(S)         DESCRIPTION
#   start_index             integer         The starting index.
#   end_index               integer         The highest index allowed before the
#                                           loop stops itself. Must be higher than the start index.
#   target_function_path    string          A path to the function that will be called
#                                           repeatively. Example: "namespace:path/to/function"
#   index_path              string          The data at this path will be replaced with an integer
#                                           representing the index of the loop before the target
#                                           function is called.
#                                           Example: "storage namespace:storage_name path/to/data" or "entity
#                                           @s Pos[1]"
#   macro_path              string          The compound at this path will be passed to the
#                                           target function as a macro.
#                                           Example: "storage namespace:storage_name path/to/data"


## RETURN CODES
#   1: Loop ended normally 
#   0: Loop ended early because function esefy:util/loop/break was called


#-------------------------------------------------------------------------------#

## TEMPORARY STORAGE (CLEARED ON CLEANUP)
#  - esefy:tmp.loop

## STORAGE PATHS USED (PERSISTENT)
#  - (none)

## TEMPORARY SCOREBOARD (CLEARED ON CLEANUP)
#  - (none)

## SCOREBOARDS USED (PERSISTENT)
#  - esefy.util.loop


## Functions outside folder called: 0

## Functions outside namespace called: 0
 
#-------------------------------------------------------------------------------#

## KNOWN BUGS
#  - [STORAGE/SCOREBOARD LEAK]
#    If a loop is interrupted--most likely by an error or by a gamerule command
#    limit during intense nesting, leftover storage and scores are not cleared.
#    NOTE: If this happens, it can be fixed with a /reload
#        Possible fixes: 
#           - Isolation of error-prone macros
#           - Detecting when the last loop did not finish, then throw an error
#             and emergency clean up before the next loop starts 
#           - Somehow try to continue the broken loop the next tick? (HARD) 

#-------------------------------------------------------------------------------#

## Add macros to storage esefy:util loop
$data merge storage esefy:util {loop:{end_index:$(end_index),target_function_path:"$(target_function_path)",index_path:"$(index_path)",macro_path:"$(macro_path)"}}


## Generate loop id and set initial index

# Increment loop layer counter
scoreboard players add #loop_id_creator esefy.util.loop 1

# Store the new loop id to loop.id
execute store result storage esefy:util loop.id int 1 run scoreboard players get #loop_id_creator esefy.util.loop

# Set the initial loop index
data modify storage esefy:util loop.tmp.id set from storage esefy:util loop.id
$data modify storage esefy:util loop.tmp.start_index set value $(start_index)
function esefy:util/loop/steps/01_set_initial_index with storage esefy:util loop.tmp
data remove storage esefy:util loop.tmp


## Begin looping and pass on it's return code
return run function esefy:util/loop/steps/02_repeating with storage esefy:util loop