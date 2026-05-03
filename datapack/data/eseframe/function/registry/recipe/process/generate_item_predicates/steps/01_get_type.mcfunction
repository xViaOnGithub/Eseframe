# Get type
$data modify storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.IngredientType set from storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.Ingredients[$(index)].type


# Type: "item", run a function with the ingredient index
$execute if data storage eseframe:cache {tick:{registry:{recipe:{process:{generate_item_predicate:{IngredientType:"item"}}}}}} run function eseframe:registry/recipe/process/generate_item_predicates/steps/01 {index:$(index)}

# Type: "custom_item", run a function with the ingredient
$execute if data storage eseframe:cache {tick:{registry:{recipe:{process:{generate_item_predicate:{IngredientType:"custom_item"}}}}}} run function eseframe:registry/recipe/process/generate_item_predicates/steps/custom_item/01 with storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.Ingredients[$(index)]
