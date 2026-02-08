# Run this AS the entity being checked, WITH ?????????

# Macros:
# id                string
# ingredient_index  integer (starts at 0)
# slot_type         string  (inventory, hotbar, container, etc.)

# storage used: esefy:tmp perform_custom_recipe_entity.ingredient_data              (deleted afterward)
#               esefy:tmp perform_custom_recipe_entity.ingredient_predicate_macro   (deleted afterward)

say ingredient


# Return imeadiately if a previous ingredient failed (placeholder for loop)
execute if data storage esefy:tmp {perform_custom_recipe_entity:{any_ingredient_missing:1b}} run say previous ingredient failed, skipping ingredient check...
execute if data storage esefy:tmp {perform_custom_recipe_entity:{any_ingredient_missing:1b}} run return fail



# Import ingredient data from recipe storage, using macro to determine a path
$data modify storage esefy:tmp perform_custom_recipe_entity.ingredient_data set from storage esefy:recipes recipes[{id:"$(id)"}].ingredients[$(ingredient_index)]
function esefy:internal/custom_recipes/perform/entity/steps/04_set_up_ingredient_data with storage esefy:tmp perform_custom_recipe_entity
$data modify storage esefy:tmp perform_custom_recipe_entity.ingredient_predicate_macro.slot_type set value "$(slot_type)"

# Remove ingredient_data, it is no longer needed. (SHOULD THIS BE MOVED TO CLEANUP?)
data remove storage esefy:tmp perform_custom_recipe_entity.ingredient_data


say starting predicate check

# Set ingredient fail flag to 1b
data modify storage esefy:tmp perform_custom_recipe_entity.any_ingredient_missing set value 1b

# Set ingredient fail flag back to 0b if predicate loads and succeeds
function esefy:internal/custom_recipes/perform/entity/steps/05_predicate with storage esefy:tmp perform_custom_recipe_entity.ingredient_predicate_macro



execute if data storage esefy:tmp {perform_custom_recipe_entity:{any_ingredient_missing:1b}} run say INGREDIENT MISSING
#execute if data storage esefy:tmp {perform_custom_recipe_entity:{any_ingredient_missing:1b}} run say INGREDIENT MISSING
