# this will be ran with each "item" typed ingredient in a recipe, and the index key is passed here


# This function creates an item predicate by making a list with the item type/tag, opening
#   bracket, soft/hard component checks (if provided), stack count minimum, and closing bracket,
#   then combining it all into one string for a macro-ready item predicate parameter that
#   can be inserted into `execute if items` or part of `clear`.


# Start the string with the item type (or item tag)
$data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append from storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients[$(index)].item

# If there was no item tag, use a wildcard (detect any item) instead 
execute unless data storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate[0] run data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value "*"


# Opening bracket for component checks
data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value "["


# add all components to item predicate
$function eseframe:util/list_loop/run {pass_index:false,list_path:"storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients[$(index)].components",function:"eseframe:registry/recipe/process/steps/generate_item_checks/item/02"}

# add all predicates to item predicate
$function eseframe:util/list_loop/run {pass_index:false,list_path:"storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients[$(index)].predicates",function:"eseframe:registry/recipe/process/steps/generate_item_checks/item/03"}


# add min stack count check
data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value "minecraft:count~{min:"
$data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append from storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients[$(index)].count
data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value "}"


# Closing bracket for component checks
data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value "]"


# Combine strings in list into one item predicate string
function eseframe:util/list_concat/run {list_path:"storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate"}


return 1