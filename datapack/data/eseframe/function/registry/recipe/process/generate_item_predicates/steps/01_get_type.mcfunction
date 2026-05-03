$say get type $(index)

# Get type
$data modify storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.IngredientType set from storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.Ingredients[$(index)].type

# Type: "item"
$execute if data storage eseframe:cache {tick:{registry:{recipe:{process:{generate_item_predicate:{IngredientType:"item"}}}}}} run function eseframe:registry/recipe/process/generate_item_predicates/steps/01 {index:$(index)}
