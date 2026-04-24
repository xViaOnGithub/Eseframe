# Stop if used outside of the intended function tag (#eseframe_api:register/items)
execute unless data storage eseframe:cache {initialize:{registry:{allow_registry_register:"item"}}} run return run say [Eseframe API] Error! Custom items can only be registered during function tag `#eseframe_api:register/items`.

# Prevent duplicate id/namespace combonations.
$execute if data storage eseframe:registry item[{id:"$(id)",namespace:"$(namespace)"}] run return run say [Eseframe API] Error! There is already a custom item registered with id "$(id)" and namespace "$(namespace)".

# TODO: Add the item directly to a storage path, then check/process that after?
$function eseframe:registry/item/add {id:"$(id)",namespace:"$(namespace)",components:$(components),properties:$(properties)}