# this will be ran with each "item" typed ingredient in a recipe, and the index key is passed here


## Item Type/Tag

# Set item to wildcard (any item) 
data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value "*"

# If the ingredient specifies an item, replace the wildcard with the item
# Can the execute if part be removed?
$execute if data storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients[$(index)].item run data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate[0] set from storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients[$(index)].item


## if components or predicates (todo: split off into it's own function)

# Opening bracket for component checks
data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value "["

## TODO: this is a bandage fix for skipping the bracket section entirely if there are no components or predicates
# This blank string will be deleted instead of a comma if no component checks are appended 
data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value ""

# todo skip if no components
# add all components to item predicate
$function eseframe:util/list_loop/run {pass_index:false,list_path:"storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients[$(index)].components",function:"eseframe:registry/recipe/process/steps/generate_item_checks/item/02"}

# todo skip if no predicates
# add all predicates to item predicate
$function eseframe:util/list_loop/run {pass_index:false,list_path:"storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients[$(index)].predicates",function:"eseframe:registry/recipe/process/steps/generate_item_checks/item/03"}

# remove last added item (comma)
# todo: only do this is there were are components or predicates
data remove storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate[-1]

# Closing bracket for component checks
data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value "]"


## Count

# Add a space before the item count
data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value " "

# Add count
$data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append from storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients[$(index)].count


# Combine strings in list into one item predicate string
function eseframe:util/list_concat/run {list_path:"storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate"}



return 1