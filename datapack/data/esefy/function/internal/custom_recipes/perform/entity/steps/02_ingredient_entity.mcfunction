# Run this AS the entity being checked, WITH ?????????

# Macros:
# id                string
# ingredient_index  integer (starts at 0)
# slot_type         string  (inventory, hotbar, container, etc.)

# storage used: esefy:tmp perform_custom_recipe_entity.ingredient_data              (deleted afterward)
#               esefy:tmp perform_custom_recipe_entity.ingredient_predicate_macro   (deleted afterward)

$say ingredient $(ingredient_index)


# Return imeadiately if a previous ingredient failed (placeholder for loop)
execute if data storage esefy:tmp {perform_custom_recipe_entity:{any_ingredient_missing:1b}} run say previous ingredient failed, skipping ingredient check...
execute if data storage esefy:tmp {perform_custom_recipe_entity:{any_ingredient_missing:1b}} run return fail

say starting predicate check

# Set ingredient fail flag to 1b
data modify storage esefy:tmp perform_custom_recipe_entity.any_ingredient_missing set value 1b

# Set ingredient fail flag back to 0b if predicate loads and succeeds
$function esefy:internal/custom_recipes/perform/entity/steps/03_predicate with storage esefy:recipes recipes[{id:"$(id)"}].ingredients[$(ingredient_index)]



execute if data storage esefy:tmp {perform_custom_recipe_entity:{any_ingredient_missing:1b}} run say INGREDIENT MISSING