# Sets up storage esefy:tmp perform_custom_recipe_entity.ingredient_predicate_macro for use in the predicate macro (step 04)
# WITH storage esefy:tmp perform_custom_recipe_entity


# Set default values of an ingredient
data modify storage esefy:tmp perform_custom_recipe_entity.ingredient_predicate_macro set value {items:"minecraft:barrier",min_count:0,components:{},slot:"*"}

# Merge recipe data over the default values
$data merge storage esefy:tmp {perform_custom_recipe_entity:{ingredient_predicate_macro:$(ingredient_data)}}

# Prevent "items" from escaping if it is not a list (and therefore is a string)
execute unless data storage esefy:tmp perform_custom_recipe_entity.ingredient_predicate_macro.items[] run function esefy:internal/custom_recipes/perform/entity/steps/03_add_quotation_marks_to_item_string with storage esefy:tmp perform_custom_recipe_entity.ingredient_predicate_macro