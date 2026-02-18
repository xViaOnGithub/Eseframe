#macros: id, slot_type
# (maybe have a check_only/dry_run?)

# Get how many ingredients there are, and use that to check every ingredient in a loop
#execute store result storage esefy:tmp perform_custom_recipe int 1 if data entity

## return fail if recipe does not exist
## set storage to match recipe



#start: sets the recipe id, stores ingredient list size
#01: starts loop with ingredient list size                      Can't help but notice I'm doing this alot. Maybe I should make a loop function that accepts a path for the index amount?
#02: (loop target, per ingredient) fix data by setting default data and merging in the existing recipe data (and with 03) and then loop 04
#03: fix data (special cases)
#04: run a predicate that checks if the ingredient is present

## storage esefy:tmp perform_custom_recipe_entity

## UPDATE THIS!! TODO
#       id (string)                                     Recipe id, set from macro id in start
#       ingredient_data (compound)                      Set from storage in 0#???
#       ingredient_index (integer)                      Which ingredient is being checked when checking       
#       ingredient_count (integer)                      How many ingredients total there are
#       ingredient_check_success (byte)                 Whether the last ingredient check succeeded
#       any_ingredient_missing (byte)                   Starts at 0b, set to 1b if any predicate check fails.

## Temporary scoreboard used: esefy.tmp.perform_custom_recipe


# Return 0 if recipe does not exist, or if ingredients field is empty
$execute unless data storage esefy:recipes recipes[{id:"$(id)"}].ingredients[] run say invalid recipe
$execute unless data storage esefy:recipes recipes[{id:"$(id)"}].ingredients[] run return 0


## Set up data storage
# Set default and macro values
$data modify storage esefy:tmp perform_custom_recipe_entity set value {id:"$(id)",any_ingredient_missing:0b}

# Set up scoreboard
scoreboard objectives add esefy.tmp.perform_custom_recipe dummy


## SET ingredient_count
execute store result storage esefy:tmp perform_custom_recipe_entity.ingredient_count int 1 run data get storage esefy:tmp recipes[{id:"$(id)"}].ingredients[]


# As a placeholder for the loop, check ingredient manually
# If every ingredient succeeds, storage esefy:tmp perform_custom_recipe_entity.any_ingredient_missing will be 0b.
function esefy:internal/custom_recipes/perform/entity/steps/01_loop_through_all_ingredients with storage esefy:tmp perform_custom_recipe_entity

# Return if any ingredient was missing.
# TODO: cleanup needs to be ran here
execute if data storage esefy:tmp {perform_custom_recipe_entity:{any_ingredient_missing:1b}} run return fail


## From this point on, we can assume all ingredients are present.


## Clear items
function esefy:internal/custom_recipes/perform/entity/steps/04_loop_ingredients_for_clear with storage esefy:tmp perform_custom_recipe_entity


# Clean up here?


## Give results (seprate functions incase any fail to parse)
# Loot
$execute if data storage esefy:recipes recipes[{id:"$(id)"}].results.advancement run function esefy:internal/custom_recipes/perform/entity/steps/07_result_advancement with storage esefy:recipes recipes[{id:"$(id)"}].results
$execute if data storage esefy:recipes recipes[{id:"$(id)"}].results.loot run function esefy:internal/custom_recipes/perform/entity/steps/08_result_loot with storage esefy:recipes recipes[{id:"$(id)"}].results
$execute if data storage esefy:recipes recipes[{id:"$(id)"}].results.function run function esefy:internal/custom_recipes/perform/entity/steps/09_result_function with storage esefy:recipes recipes[{id:"$(id)"}].results



## TODO Cleanup
# Remove scoreboard
#scoreboard objectives remove esefy.tmp.perform_custom_recipe
# TODO: remove data