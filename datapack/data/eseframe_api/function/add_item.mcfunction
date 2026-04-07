# Stop if used outside of the intended function tag (#eseframe:content/add)
execute unless data storage eseframe:cache {initialize:{content:{allow_content_register:1b}}} run say [Eseframe API] Error! Custom items can only be registered during function tag `#eseframe_api:content/add`.
execute unless data storage eseframe:cache {initialize:{content:{allow_content_register:1b}}} run return fail

# Prevent duplicate id/namespace combonations. 
$execute if data storage eseframe:content item[{id:"$(id)",namespace:"$(namespace)"}] run say [Eseframe API] Error! There is already a custom item registered with id "$(id)" and namespace "$(namespace)".
$execute if data storage eseframe:content item[{id:"$(id)",namespace:"$(namespace)"}] run return fail


$function eseframe:content/item/add {id:"$(id)",namespace:"$(namespace)",components:$(components),properties:$(properties)}