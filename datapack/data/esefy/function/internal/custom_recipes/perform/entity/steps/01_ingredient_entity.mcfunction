# Run this AS the entity being checked, WITH storage esefy:tmp custom_recipe_attempt.ingredient.

# Macros:
# group      string
# id         string
# index      integer (starts at 0)
# slot_type  string  (inventory, hotbar, container, etc.)

# storage used: esefy:tmp custom_recipe_attempt.ingredient.macro (deleted afterward)


# Import ingredient data from recipe storage, using macro to determine a path
$data modify storage esefy:tmp custom_recipe_attempt.ingredient.macro set from storage esefy:recipes loaded.$(group).recipes.$(id).ingredients[$(index)]

# Set entity item slot type from macro
$data modify storage esefy:tmp custom_recipe_attempt.ingredient.macro.slot_type set value "$(slot_type)"


## Set default values and format optional data types
# items: needs quotation marks around it if it's not a list
execute unless data storage esefy:tmp custom_recipe_attempt.ingredient.macro.items[] run function esefy:internal/custom_recipes/perform/steps/01_add_quotation_marks_to_item_string with storage esefy:tmp custom_recipe_attempt.ingredient.macro
# min_count: defaults to 1
execute unless data storage esefy:tmp custom_recipe_attempt.ingredient.macro.min_count run data modify storage esefy:tmp custom_recipe_attempt.ingredient.macro.min_count set value 1
# slot: defaults to string "*"
execute unless data storage esefy:tmp custom_recipe_attempt.ingredient.macro.slot run data modify storage esefy:tmp custom_recipe_attempt.ingredient.macro.slot set value "*"
# predicates: defaults to {}
# components: defaults to {}
data merge storage esefy:tmp {custom_recipe_attempt:{ingredient:{macro:{predicates:{},components:{}}}}}


# Check if the ingredient is present in the given slot
function esefy:internal/custom_recipes/perform/steps/ingredient_check/entity with storage esefy:tmp custom_recipe_attempt.ingredient.macro

# Clean up temporary macro compound
data remove storage esefy:tmp custom_recipe_attempt.ingredient.macro

# Return 1 if the ingredient check succeeded
execute if data storage esefy:tmp {custom_recipe_attempt:{ingredient:{success:1b}}} run return 1

# Return fail if the ingredient check failed
return fail