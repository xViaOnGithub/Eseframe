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
data remove storage eseframe:cache tick.registry.recipe.process

# Copy the recipe's ingredients
$data modify storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients set value $(ingredients)


# Create a data path that will be the new entry to the recipe registry
# Start with the ID and namespace of the recipe
$data modify storage eseframe:cache tick.registry.recipe.process.Step01.final_recipe_entry_data set value {id:"$(id)",namespace:"$(namespace)"}

# Loop through each ingredient, generating data based on each ingredient and storing it to storage eseframe:cache tick.registry.recipe.process.Step01.final_recipe_entry_data
function eseframe:util/list_loop/run {list_path:"storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients",function:"eseframe:registry/recipe/process/steps/02_for_every_ingredient",pass_index:true}


## Append final output to the custom recipe registry
data modify storage eseframe:registry recipe append from storage eseframe:cache tick.registry.recipe.process.Step01.final_recipe_entry_data


# Delete this entry, and continue the loop through each recipe
return -1