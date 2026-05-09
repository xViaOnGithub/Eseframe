# Runs WITH every recipe added through API, and it's index 


## Keys: id, namespace, ingredients

# ingredients formatted like this:

# TODO: Type          required    string      "item"
# Components    optional    compound
#   ID            required    string
#   Value_string         required    number or string (compounds or lists must be in a string)
# Predicates    optional    compound
#   ID            required    string
#   Value_string         required    number or string (compounds or lists must be in a string)
# Item          optional    string
# Count         required    int >0

## TODO:
# Type          required    string      "custom_item"
# ID            required    string
# Namespace     required    string
# Count         required    int >0

# Delete leftover data
data remove storage eseframe:cache tick.registry.recipe.process.generate_item_predicate

# Copy the recipe's ingredients
$data modify storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.Ingredients set value $(ingredients)

# Loop through each ingredient, generating an item predicate and store it in storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.GeneratedItemPredicates
function eseframe:util/list_loop/run {list_path:"storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.Ingredients",function:"eseframe:registry/recipe/process/steps/02_for_every_ingredient",pass_index:true}

# Copy output to registry
$data modify storage eseframe:registry recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredient_item_predicates set from storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.Output


# Continue the loop through each recipe
return 1