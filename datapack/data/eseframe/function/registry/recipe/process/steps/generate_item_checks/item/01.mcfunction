# this will be ran with each "item" typed ingredient in a recipe, and the index key is passed here


## Item Type/Tag

# Set item to wildcard (any item) 
data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value "*"

# If the ingredient specifies an item, replace the wildcard with the item
# Can the execute if part be removed?
$execute if data storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients[$(index)].item run data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate[0] set from storage eseframe:cache tick.registry.recipe.process.Step01.all_ingredients[$(index)].item


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