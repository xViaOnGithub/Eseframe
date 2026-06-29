#macros: id, namespace

# Return fail if recipe does not exist, or if there are no ingredients
$execute unless data storage eseframe:registry recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredient_item_predicates[] run return fail


# Check if all the ingredients are present
$execute store result storage eseframe:cache tick.registry.recipe.crafting.player.RecipeCheckResult byte 1 run function eseframe:util/list_loop/run {pass_index:false,function:"eseframe:registry/recipe/crafting/player/steps/01_check_ingredient",list_path:'storage eseframe:registry recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredient_item_predicates'}

# Return fail if ingredient check failed
execute if predicate {condition:"minecraft:value_check",value:{type:"minecraft:storage",storage:"eseframe:cache",path:"tick.registry.recipe.crafting.player.RecipeCheckResult"},range:0} run return fail


# Clear items
$function eseframe:util/list_loop/run {pass_index:false,function:"eseframe:registry/recipe/crafting/player/steps/02_clear_ingredient",list_path:'storage eseframe:registry recipe[{id:"$(id)",namespace:"$(namespace)"}].ingredient_item_predicates'}

# Give results
$loot give @s loot $(namespace):eseframe_api-v1/recipe/$(id)


# Return success
return 1