# Stop if used outside of the intended function tag (#eseframe:content/add)
execute unless data storage eseframe:cache {initialize:{content:{allow_content_register:1b}}} run say [Eseframe API] Error! Custom recipes can only be registered during function tag `#eseframe_api:content/add`.
execute unless data storage eseframe:cache {initialize:{content:{allow_content_register:1b}}} run return fail

# Prevent duplicate id/namespace combonations. 
$execute if data storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}] run say [Eseframe API] Error! There is already a custom recipe registered with id "$(id)" and namespace "$(namespace)".
$execute if data storage eseframe:content recipe[{id:"$(id)",namespace:"$(namespace)"}] run return fail


$function eseframe:content/recipe/add {id:"$(id)",namespace:"$(namespace)",ingredients:$(ingredients),properties:$(properties)}