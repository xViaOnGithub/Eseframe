# Stop if used outside of the intended function tag (#eseframe:registry/add)
execute unless data storage eseframe:cache {initialize:{registry:{allow_registry_register:1b}}} run say [Eseframe API] Error! Custom recipe tags can only be registered during function tag `#eseframe_api:registry/add`.
execute unless data storage eseframe:cache {initialize:{registry:{allow_registry_register:1b}}} run return fail

# Prevent duplicate entries
$execute if data storage eseframe:registry recipe_tag[{id:"$(tag_id)",namespace:"$(tag_namespace)"}].recipes[{id:"$(id)",namespace:"$(namespace)"}] run say [Eseframe API] Warning! Recipe tag with ID "$(tag_id)" and namespace "$(tag_namespace)" already has recipe with ID "$(id)" and namespace "$(namespace)"! Skipping duplicate...
$execute if data storage eseframe:registry recipe_tag[{id:"$(tag_id)",namespace:"$(tag_namespace)"}].recipes[{id:"$(id)",namespace:"$(namespace)"}] run return fail

$function eseframe:registry/recipe_tag/add {tag_id:"$(tag_id)",tag_namespace:"$(tag_namespace)",recipe_id:"$(id)",recipe_namespace:"$(namespace)"}