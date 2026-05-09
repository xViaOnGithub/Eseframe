#macros: id, namespace
## temporary storage eseframe:tmp perform_custom_recipe_entity
## Temporary scoreboard used: eseframe.tmp.perform_custom_recipe


# Return fail if recipe does not exist, or if there are no ingredients
$execute unless data storage eseframe:registry recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredient_item_predicates[] run return fail


# Set up scoreboard
scoreboard objectives add eseframe.tmp.perform_custom_recipe dummy

# Check if all the ingredients are present
$execute store result storage eseframe:tmp perform_custom_recipe_entity.ingredient_check_result byte 1 run function eseframe:util/list_loop/run {pass_index:false,function:"eseframe:registry/recipe/crafting/steps/01_check_ingredient",list_path:'storage eseframe:registry recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredient_item_predicates'}

# Return fail if ingredient check failed
execute if data storage eseframe:tmp {perform_custom_recipe_entity:{ingredient_check_result:0b}} if function eseframe:registry/recipe/crafting/steps/03_cleanup run return fail

# Clear items
$function eseframe:util/list_loop/run {pass_index:false,function:"eseframe:registry/recipe/crafting/steps/02_clear_ingredient",list_path:'storage eseframe:registry recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredient_item_predicates'}

# Give results
$loot give @s loot $(namespace):eseframe_api/recipe/$(id)

## TODO scoreboard and data Cleanup
function eseframe:registry/recipe/crafting/steps/03_cleanup
return 1