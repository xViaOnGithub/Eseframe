# Fail immeadiately if recipe tag does not exist
$execute unless data storage eseframe:registry recipe_tag[{id:"$(id)",namespace:"$(addon)"}] run return fail

$execute if predicate {condition:"minecraft:value_check",value:$(block),range:1} run return run function eseframe:registry/recipe_tag/crafting/block/attempt {id:"$(id)",namespace:"$(addon)"}
$function eseframe:registry/recipe_tag/crafting/player/attempt {id:"$(id)",namespace:"$(addon)"}