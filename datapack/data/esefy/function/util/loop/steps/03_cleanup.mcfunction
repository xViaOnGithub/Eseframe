# Macros: id
# Storage used: esefy:util loop.tmp03, esefy:util loop (persistant*)

say loop ended

$data modify storage esefy:util loop.tmp.id set value "$(id)"


# If this is the root layer of the loop, clean up scoreboards and data and return 0 if the the break flag is set, or 1 if it's not
execute if data storage esefy:util {loop:{tmp:{id:"1"}}} if score break esefy.util.loop matches 1 if function esefy:util/loop/steps/04_cleanup_inline run return 0
execute if data storage esefy:util {loop:{tmp:{id:"1"}}} if function esefy:util/loop/steps/04_cleanup_inline run return 1

# If not, just reset this id's score and remove this function's storage
$scoreboard players reset $(id) esefy.util.loop
data remove storage esefy:util loop.tmp

# Return 0 if loop was broken, otherwise return 1
return run execute unless score break esefy.util.loop matches 1