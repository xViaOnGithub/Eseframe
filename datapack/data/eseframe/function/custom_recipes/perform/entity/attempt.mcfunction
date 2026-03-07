#macros: id, slot_type
## temporary storage eseframe:tmp perform_custom_recipe_entity
## Temporary scoreboard used: eseframe.tmp.perform_custom_recipe


# Return fail if recipe does not exist, or if ingredients field is empty
$execute unless data storage eseframe:recipes recipes[{id:"$(id)"}].ingredients[] run say recipe not found or has no ingredients!
$execute unless data storage eseframe:recipes recipes[{id:"$(id)"}].ingredients[] run return fail


# Set up scoreboard
scoreboard objectives add eseframe.tmp.perform_custom_recipe dummy

# Check if all the ingredients are present
$execute store result storage eseframe:tmp perform_custom_recipe_entity.ingredient_check_result byte 1 run function eseframe:utils/list_loop/start {function_path:"eseframe:custom_recipes/perform/entity/steps/01_check_ingredient",list_path:'storage eseframe:recipes recipes[{id:"$(id)"}].ingredients'}

# TODO: cleanup needs to be ran here inline if it's gonna return
# Return fail if ingredient check failed
execute if data storage eseframe:tmp {perform_custom_recipe_entity:{ingredient_check_result:0b}} if function eseframe:custom_recipes/perform/entity/steps/99_inline_cleanup run return fail

## Clear items
$function eseframe:utils/list_loop/start {function_path:"eseframe:custom_recipes/perform/entity/steps/02_clear_ingredients",list_path:'storage eseframe:recipes recipes[{id:"$(id)"}].ingredients'}

# Give results (as separate functions to prevent parsing errors)
$execute if data storage eseframe:recipes recipes[{id:"$(id)"}].results.advancement run function eseframe:custom_recipes/perform/entity/steps/03_result_advancement with storage eseframe:recipes recipes[{id:"$(id)"}].results
$execute if data storage eseframe:recipes recipes[{id:"$(id)"}].results.loot run function eseframe:custom_recipes/perform/entity/steps/04_result_loot with storage eseframe:recipes recipes[{id:"$(id)"}].results
$execute if data storage eseframe:recipes recipes[{id:"$(id)"}].results.function run function eseframe:custom_recipes/perform/entity/steps/05_result_function with storage eseframe:recipes recipes[{id:"$(id)"}].results

## TODO scoreboard and data Cleanup
function eseframe:custom_recipes/perform/entity/steps/99_inline_cleanup
return 1