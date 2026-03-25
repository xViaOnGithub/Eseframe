#macros: id, namespace
## temporary storage eseframe:tmp perform_custom_recipe_entity
## Temporary scoreboard used: eseframe.tmp.perform_custom_recipe


# Return fail if recipe does not exist, or if ingredients field is empty
$execute unless data storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}] run say recipe not found!
$execute unless data storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredients[] run say recipe has no ingredients!
$execute unless data storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredients[] run return fail


# Set up scoreboard
scoreboard objectives add eseframe.tmp.perform_custom_recipe dummy

# Check if all the ingredients are present
$execute store result storage eseframe:tmp perform_custom_recipe_entity.ingredient_check_result byte 1 run function eseframe:utils/list_loop/start {function_path:"eseframe:custom_recipes/perform/entity/steps/01_check_ingredient",list_path:'storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredients'}

# TODO: cleanup needs to be ran here inline if it's gonna return
# Return fail if ingredient check failed
execute if data storage eseframe:tmp {perform_custom_recipe_entity:{ingredient_check_result:0b}} if function eseframe:custom_recipes/perform/entity/steps/99_inline_cleanup run return fail

## Clear items
$function eseframe:utils/list_loop/start {function_path:"eseframe:custom_recipes/perform/entity/steps/02_clear_ingredients",list_path:'storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredients'}

# Give results
$loot give @s loot $(namespace):eseframe/recipe/$(id)

## TODO scoreboard and data Cleanup
function eseframe:custom_recipes/perform/entity/steps/99_inline_cleanup
return 1