# Marco keys for starting:                      function, list_path, pass_index
# Macro keys for internal repeating function:   function, list_path, index


# How each return code will be interpreted by the function:
#   fail: stop the loop
#   -2: delete index and stop loop
#   -1: delete index

## MAKE SURE TO GIVE YOUR FUNCTION A RETURN CODE! A MISSING RETURN CODE SOMETIMES READS AS A FAIL

# NOTE:
# You can have new items APPENEDED to the list during the loop, but other
#       mid-loop modifications might result in skipped or repeated entries!


# storage path: eseframe:cache tick.util.list_loop
# scoreboard:   eseframe.util.list_loop



# Fail immeadiately if $(list_path) isn't a list with any amount of entries
$execute unless data $(list_path)[] run return fail

# Set the initial index to 0, copy $(function) and $(list_path) to the loop macro
$data modify storage eseframe:cache tick.util.list_loop.StartMacro set value {function:"$(function)",list_path:'$(list_path)',pass_index:"$(pass_index)",index:0}


# Run the main loop and pass on the return code
return run function eseframe:util/list_loop/steps/01_repeat with storage eseframe:cache tick.util.list_loop.StartMacro