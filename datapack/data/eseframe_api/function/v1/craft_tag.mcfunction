# Fail immeadiately if recipe tag does not exist
$execute unless data storage eseframe:registry recipe_tag[{id:"$(id)",namespace:"$(namespace)"}] run return fail


$function eseframe:registry/recipe_tag/crafting/attempt {id:"$(id)",namespace:"$(namespace)"}