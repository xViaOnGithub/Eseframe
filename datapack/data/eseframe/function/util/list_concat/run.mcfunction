# Keys: list_path

## ALL ENTRIES IN THE LIST MUST BE VALUES, LISTS AND COMPOUNDS WILL NOT WORK HERE


# Overwrite any leftover data and:
# - Set CombinedString to an empty string to prevent a missing key error when the first entry is combined
# - Set ListPath from macro
$data modify storage eseframe:cache tick.util.list_concat set value {CombinedString:"",ListPath:"$(list_path)"}


## Combine each entry of the list into one string

# Set starting index (0) and function for loop util
data modify storage eseframe:cache tick.util.list_concat.LoopMacro set value {index:0,function:"eseframe:util/list_concat/steps/01"}

# Store the length of the list
$execute store result storage eseframe:cache tick.util.list_concat.LoopMacro.max_index int 1 run function eseframe:util/get_list_highest_index/run {list_path:"$(list_path)"}

# Begin the loop
function eseframe:util/loop/start with storage eseframe:cache tick.util.list_concat.LoopMacro


## Overwrite the list with the final combined string

$data modify $(list_path) set from storage eseframe:cache tick.util.list_concat.CombinedString