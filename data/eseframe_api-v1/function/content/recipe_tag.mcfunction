# Only allow during function <namespace>:eseframe_api-v1/content
execute unless data storage eseframe:cache initialize.include.add_content.Allowed run return run say [Eseframe API] Error! Custom recipes can only be tagged during function `<addon_namespace>:eseframe_api-v1/content`.

# Prevent duplicate id/namespace combonations within the recipe tag.
$execute if data storage eseframe:registry recipe_tag[{id:"$(id)",namespace:"$(addon)"}] run return run say [Eseframe API] Error! Custom recipe with id "$(id)" and namespace "$(addon)" already has tag with id $(tag_id) and namespace $(tag_addon).

# TODO: Add the recipe tag entry directly to a storage path, then check/process that after?
$function eseframe:registry/recipe_tag/add {tag_id:"$(tag_id)",tag_namespace:"$(tag_addon)",recipe_id:"$(id)",recipe_namespace:"$(addon)"}