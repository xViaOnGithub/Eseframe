## PURPOSE:
#      Runs a "reciever" function mutliple times in a row, macroing in the inputted
#      data as well as an incrementing index of numbers within a specified range.


## HOW TO USE:
#    AS: Any (current single executor is passed onto reciever)
#    AT: Any (position is passed onto reciever)
#       
#       Call this function with the function you wish to loop as the "reciever"
#       macro. For example, if you are trying to run a function that you would
#       normally call with "function esefy:path/to/function/run", you would set
#       "reciever" to "esefy:path/to/function/run".
#       
#       
#       Set "min" and "max" to the respective indexes you wish to start and end at
#       (inclusive):
#       "min": 0
#       "max": 5
#       indexes used: 0,1,2,3,4,5
#       
#       Notice how the reciever is called 6 times-- it starts with "min", which
#       means in the case it starts with 0. This can be a good thing if you are
#       working with an array (whose first item has an index of 0), for example.
#       
#       
#       When the reciever function is called by the loop, the data storage path
#       esefy:tmp.loop is macro'd in. Here are the keys that are sent to the
#       reciever:
#       - $(data): A copy of the "data" key that was input into this function.
#       - $(index): The current index.
#       - $(start_index): A copy of the "min" key.
#       - $(end_index): A copy of the "max" key.
#       
#       EXAMPLE:
#       One good use for this is using the reciever function to macro multiple
#       entries from an array into another function:
#       "$function esefy:run/this/with/array/entries with storage esefy:example path[$(index)]"
#       
#       You could even use the $(input) to chose a path: 
#       "$function esefy:run/this/with/array/entries with storage esefy:example $(input)[$(index)]"
#       
#       
#       
#       If a reciever returns 1, the loop will stop immeadiately.


## MACRO KEYS               TYPE(S)         DESCRIPTION
#   min                     integer         The starting index.
#   max                     integer         The highest index allowed before the
#                                           loop stops itself.
#   reciever                string          The function that will be called
#                                           repeatively.
#   data                    any             Data that can be accessed by the
#                                           reciever function using a macro.


## RETURN CODES

#-------------------------------------------------------------------------------#

## TEMPORARY STORAGE (CLEARED ON CLEANUP)
#  - esefy:tmp.loop

## STORAGE PATHS USED (PERSISTENT)
#  - (none)

## TEMPORARY SCOREBOARD (CLEARED ON CLEANUP)
#  - esefy.temporary.loop_util

## SCOREBOARDS USED (PERSISTENT)
#  - (none)


## Functions outside folder called: 0

## Functions outside namespace called: 0
 
#-------------------------------------------------------------------------------#

## KNOWN BUGS
#  - Calling this function while another loop is running will probaby break
#    everything, since it is not currently implemented with nesting in mind.

#-------------------------------------------------------------------------------#



# Create temporary storage and store data intput, 
$data modify storage esefy:tmp loop.data set value $(data)
$data modify storage esefy:tmp loop.start_index set value $(min)
$data modify storage esefy:tmp loop.end_index set value $(max)

# Set up scoreboard
scoreboard objectives add esefy.temporary.loop_util dummy

# Start the index at $(min)
$scoreboard players set #index esefy.temporary.loop_util $(min)

# Set the length of the loop with the max macro'd in
$scoreboard players set #length esefy.temporary.loop_util $(max)

# Call a repeating function that repeatively macros loop data into the reciever 
$function esefy:util/loop/steps/repeating {reciever_function:"$(reciever)"}

# Clean up
data remove storage esefy:tmp loop
scoreboard objectives remove esefy.temporary.loop_util