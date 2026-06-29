# Only allow during function <namespace>:eseframe_api-v1/content
execute unless data storage eseframe:cache initialize.include.add_content.Allowed run return run say [Eseframe API] Error! Custom items can only be registered during function `<addon_namespace>:eseframe_api-v1/content`.

# # Prevent duplicate id/namespace combonations.
# $execute if data storage eseframe:registry item[{id:"$(id)",namespace:"$(namespace)"}] run return run say [Eseframe API] Error! There is already a custom item registered with id "$(id)" and namespace "$(namespace)".
say TODO: Re-implement duplicate addon item id prevention during processing


# Prepare a macro that will add the item to the registery
$data modify storage eseframe:cache initialize.include.add_content.API.Macro set value {id:"$(id)",components:$(components),properties:$(properties)}
data modify storage eseframe:cache initialize.include.add_content.API.Macro.namespace set from storage eseframe:cache initialize.include.add_content.Addon


# TODO: Add the item directly to a storage path, then check/process that after?
function eseframe:registry/item/add with storage eseframe:cache initialize.include.add_content.API.Macro