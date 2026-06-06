# Only allow during function <namespace>:eseframe_api/content
execute unless data storage eseframe:cache initialize.include.add_content.Allowed run return run say [Eseframe API] Error! Custom recipes can only be tagged during function `<addon_namespace>:eseframe_api/content`.

# Prevent duplicate id/namespace combonations within the recipe tag.
$execute if data storage eseframe:registry recipe_tag[{id:"$(id)",namespace:"$(namespace)"}] run return run say [Eseframe API] Error! Custom recipe with id "$(id)" and namespace "$(namespace)" already has tag with id $(tag_id) and namespace $(tag_namespace).

# TODO: Add the recipe tag entry directly to a storage path, then check/process that after?
$function eseframe:registry/recipe_tag/add {tag_id:"$(tag_id)",tag_namespace:"$(tag_namespace)",recipe_id:"$(id)",recipe_namespace:"$(namespace)"}