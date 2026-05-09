# Ran WITH every ingredient (and it's index)

$say $(type) $(count)



## todo: set up data for the next functions this calls to write to

#reset generation output
data remove storage eseframe:cache tick.registry.recipe.process.Step02.generated


## Generate item predicate and item test

# Get type
$data modify storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.IngredientType set value "$(type)"


# Type: "item", run a function with the ingredient index
$execute if data storage eseframe:cache {tick:{registry:{recipe:{process:{generate_item_predicate:{IngredientType:"item"}}}}}} run function eseframe:registry/recipe/process/steps/generate_item_checks/item/01 {index:$(index)}

# Type: "custom_item", run a function with the ingredient
$execute if data storage eseframe:cache {tick:{registry:{recipe:{process:{generate_item_predicate:{IngredientType:"custom_item"}}}}}} run function eseframe:registry/recipe/process/steps/generate_item_checks/custom_item/01 with storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients[$(index)]


## Copy the generated item predicate data to the recipe's final data

# Add generated item predicate and the ingredient count to a compound called "ingredient_item_predicates_entry"
$data modify storage eseframe:cache tick.registry.recipe.process.Step02.ingredient_item_predicates_entry.count set value $(count)
data modify storage eseframe:cache tick.registry.recipe.process.Step02.ingredient_item_predicates_entry.item_predicate set from storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate

# Copy the pair to <recipe data>.ingredient_item_predicates
data modify storage eseframe:cache tick.registry.recipe.process.Step01.final_recipe_entry_data.ingredient_item_predicates append from storage eseframe:cache tick.registry.recipe.process.Step02.ingredient_item_predicates_entry


## Insert the generated item test into the recipe's final data

# Placeholder path, will be inserted into a predicate set up by 01
data modify storage eseframe:cache tick.registry.recipe.process.Step01.final_recipe_entry_data.PLACEHOLDER append from storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_test


# Continue the loop
return 1