#macros: id, namespace
## temporary storage eseframe:tmp perform_custom_recipe_entity
## Temporary scoreboard used: eseframe.tmp.perform_custom_recipe

## TODO: Also return if there are multiple recipes with an identical id?
# Return fail if recipe does not exist, or if ingredients field is empty
$execute unless data storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}] run say recipe not found!
$execute unless data storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredients[] run say recipe has no ingredients!
$execute unless data storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredients[] run return fail


# Set up scoreboard
scoreboard objectives add eseframe.tmp.perform_custom_recipe dummy

# Check if all the ingredients are present
# TODO: Split this off into it's own function
$execute store result storage eseframe:tmp perform_custom_recipe_entity.ingredient_check_result byte 1 run function eseframe:utils/list_loop/start {function_path:"eseframe:content/recipe/crafting/steps/01_check_ingredient",list_path:'storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredients'}

# Return fail if ingredient check failed
execute if data storage eseframe:tmp {perform_custom_recipe_entity:{ingredient_check_result:0b}} if function eseframe:content/recipe/crafting/steps/03_cleanup run return fail

## Clear items
$function eseframe:utils/list_loop/start {function_path:"eseframe:content/recipe/crafting/steps/02_clear_ingredient",list_path:'storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredients'}

# Give results
$loot give @s loot $(namespace):eseframe/recipe/$(id)

## TODO scoreboard and data Cleanup
function eseframe:content/recipe/crafting/steps/03_cleanup
return 1