#macros: id, namespace


# Return fail if this block is not a container with items in it
# Uses "if" instead of "unless", because "unless" will actually fail here if the block doesn't have container slots 
execute store success storage eseframe:cache tick.registry.recipe.crafting.block.IsContainerWithItems byte 1 if items block ~ ~ ~ container.* *
execute if predicate {condition:"minecraft:value_check",value:{type:"storage",storage:"eseframe:cache",path:"tick.registry.recipe.crafting.block.IsContainerWithItems"},range:0} run return fail

# Return fail if recipe does not exist, or if there are no ingredients
$execute unless data storage eseframe:registry recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredient_item_predicates[] run return fail


# Check if all the ingredients are present
$execute store result storage eseframe:cache tick.registry.recipe.crafting.block.RecipeCheckResult byte 1 run function eseframe:util/list_loop/run {pass_index:false,function:"eseframe:registry/recipe/crafting/block/steps/01_check_ingredient",list_path:'storage eseframe:registry recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredient_item_predicates'}

# Return fail if ingredient check failed
execute if predicate {condition:"minecraft:value_check",value:{type:"minecraft:storage",storage:"eseframe:cache",path:"tick.registry.recipe.crafting.block.RecipeCheckResult"},range:0} run return fail


# Clear items?
$function eseframe:util/list_loop/run {pass_index:false,function:"eseframe:registry/recipe/crafting/block/steps/02_clear_ingredient",list_path:'storage eseframe:registry recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredient_item_predicates'}

# Give results
$loot spawn ~ ~ ~ loot $(namespace):eseframe_api/v1/recipe/$(id)


# Return success
return 1