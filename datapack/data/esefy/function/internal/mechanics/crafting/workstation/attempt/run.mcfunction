## PURPOSE:
#      Attempts to craft every custom recipe for a given crafting station using
#      a list of recipes from storage.


## HOW TO USE:
#    AS: The (player) entity attempting to craft.
#    AT: The block entity to check for recipe input.
#      Run this function when the player "activates" a custom crafting station
#      whose type is specified in $(crafting_station) to attempt crafting.


## MACRO KEY            TYPE(S)         DESCRIPTION
#   workstation         string          Path to an array of recipes in storage
#                                       esefy:recipes. 


## RETURN CODES
#    0 (fail):
#      No recipes found for given crafting station.

#-------------------------------------------------------------------------------#

## TEMPORARY STORAGE (CLEARED ON CLEANUP)
#  - esefy:tmp.recipe_performer

## STORAGE PATHS USED (PERSISTENT)
#  - esefy:recipe.$(crafting_station)   (read-only)

## TEMPORARY SCOREBOARD (CLEARED ON CLEANUP)
#  - esefy.temporary.workstation_crafting

## SCOREBOARDS USED (PERSISTENT)
#  - (none)


## Functions outside folder called: 1
#  - esefy:path/to/function/function_name_here LOOP FUNCTION HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

## Functions outside namespace called: 0
 
#-------------------------------------------------------------------------------#



# Return fail if an invalid crafting station is called
$execute unless data storage esefy:recipes $(workstation)[] run return fail

# Create temporary scoreboard
scoreboard objectives add esefy.temporary.workstation_crafting dummy

# Create temporary storage & store crafting station key
$data modify storage esefy:tmp recipe_performer.crafting_station set value "$(workstation)"

# Store the highest index recipe of this crafting station 
$execute store result score #highest_recipe_index esefy.temporary.workstation_crafting if data storage esefy:recipes $(workstation)[]
execute store result storage esefy:tmp recipe_performer.recipe_count_minus_one int 1 run scoreboard players remove #highest_recipe_index esefy.temporary.workstation_crafting 1

# Macro the stored data into the next function to begin a loop
function esefy:internal/mechanics/crafting/workstation/attempt/steps/01_setup_loop with storage esefy:tmp recipe_performer

# Cleanup, remove temporary storage and scoreboard
data remove storage esefy:tmp recipe_performer
scoreboard objectives remove esefy.temporary.workstation_crafting