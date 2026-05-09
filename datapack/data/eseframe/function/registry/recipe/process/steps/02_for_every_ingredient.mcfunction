# Ran WITH every ingredient (and it's index)

$say $(type)



## todo: set up data for the next functions this calls to write to


# Get type
$data modify storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.IngredientType set value "$(type)"


# Type: "item", run a function with the ingredient index
$execute if data storage eseframe:cache {tick:{registry:{recipe:{process:{generate_item_predicate:{IngredientType:"item"}}}}}} run function eseframe:registry/recipe/process/steps/generate_item_checks/item/01 {index:$(index)}

# Type: "custom_item", run a function with the ingredient
$execute if data storage eseframe:cache {tick:{registry:{recipe:{process:{generate_item_predicate:{IngredientType:"custom_item"}}}}}} run function eseframe:registry/recipe/process/steps/generate_item_checks/custom_item/01 with storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.Ingredients[$(index)]


## todo: copy the generated data back into the registry here instead of during the functions above