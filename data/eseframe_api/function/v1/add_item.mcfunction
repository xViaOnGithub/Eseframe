# Only allow during function <namespace>:eseframe_api/content
execute unless data storage eseframe:cache initialize.add_content.Allowed run return run say [Eseframe API] Error! Custom items can only be registered during function `<addon_namespace>:eseframe_api/content`.

# Prevent duplicate id/namespace combonations.
$execute if data storage eseframe:registry item[{id:"$(id)",namespace:"$(namespace)"}] run return run say [Eseframe API] Error! There is already a custom item registered with id "$(id)" and namespace "$(namespace)".

# TODO: Add the item directly to a storage path, then check/process that after?
$function eseframe:registry/item/add {id:"$(id)",namespace:"$(namespace)",components:$(components),properties:$(properties)}