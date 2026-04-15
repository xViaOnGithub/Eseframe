# Stop if used outside of the intended function tag (#eseframe:registry/add)
execute unless data storage eseframe:cache {initialize:{registry:{allow_registry_register:1b}}} run say [Eseframe API] Error! Custom items can only be registered during function tag `#eseframe_api:registry/add`.
execute unless data storage eseframe:cache {initialize:{registry:{allow_registry_register:1b}}} run return fail

# Prevent duplicate id/namespace combonations. 
$execute if data storage eseframe:registry item[{id:"$(id)",namespace:"$(namespace)"}] run say [Eseframe API] Error! There is already a custom item registered with id "$(id)" and namespace "$(namespace)".
$execute if data storage eseframe:registry item[{id:"$(id)",namespace:"$(namespace)"}] run return fail


$function eseframe:registry/item/add {id:"$(id)",namespace:"$(namespace)",components:$(components),properties:$(properties)}