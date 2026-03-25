## NOTE:
# THE BLOCK VERSION OF THE CUSTOM RECIPE PERFORMER REQUIRES AN EXACT AMOUNT OF ITEMS,
# BECAUSE IT CLEARS THE CONTAINER TO AVOID A VANILLA BEHAVIOR WHERE INSERTING LOOT INTO A
# FULL CONTAINER WILL ONLY INSERT SOME ITEMS INSTEAD OF ALL OF THEM.
# IT ALSO CLEARS THE CONTAINER BECAUSE clear DOES NOT WORK ON BLOCKS, WHICH MEANS SELECTIVELY
# REMOVING ITEMS WOULD HAVE TO BE DONE THROUGH FUNCTIONS (todo?).

## Possible fixes:
# Removing ingredients:
# - Manually remove ingredients from chest after ingredient check
# Inserting and merging results (very hard without item loss):
# - ?


# Maybe I could just loot spawn the results as item entities?
# I could add a macro for item output coordinates so a machine could
# provide relative coords to spawn the items at.


# ----------------------------------------------------------------------

#macros: id, namespace
## temporary storage eseframe:tmp perform_custom_recipe_block
## Temporary scoreboard used: eseframe.tmp.perform_custom_recipe


# Return fail if recipe does not exist, or if ingredients field is empty
$execute unless data storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}] run say recipe not found!
$execute unless data storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredients[] run say recipe has no ingredients!
$execute unless data storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredients[] run return fail

# Set up scoreboard
scoreboard objectives add eseframe.tmp.perform_custom_recipe dummy

# Start a counter of the total amount of ingredients
scoreboard players reset #total_ingredient_count eseframe.tmp.perform_custom_recipe

# Check if all the ingredients are present
$execute store result storage eseframe:tmp perform_custom_recipe_block.ingredient_check_result byte 1 run function eseframe:utils/list_loop/start {function_path:"eseframe:custom_recipes/perform/block/steps/01_check_ingredient",list_path:'storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredients'}

# Return fail if ingredient check failed
execute if data storage eseframe:tmp {perform_custom_recipe_block:{ingredient_check_result:0b}} if function eseframe:custom_recipes/perform/block/steps/99_inline_cleanup run return fail


# RETURN IF TOTAL ITEM COUNT DOESN'T MATCH TOTAL ITEMS IN CONTAINER
execute store result score #total_container_items eseframe.tmp.perform_custom_recipe if items block ~ ~ ~ container.* *
execute unless score #total_ingredient_count eseframe.tmp.perform_custom_recipe = #total_container_items eseframe.tmp.perform_custom_recipe if function eseframe:custom_recipes/perform/block/steps/99_inline_cleanup run return fail

# Clear items
data remove block ~ ~ ~ Items

# Give results
$loot insert ~ ~ ~ loot $(namespace):eseframe/recipe/$(id)

# Clean up
function eseframe:custom_recipes/perform/block/steps/99_inline_cleanup
return 1