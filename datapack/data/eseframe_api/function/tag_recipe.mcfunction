# Stop if used outside of the intended function tag (#eseframe:registry/add)
execute unless data storage eseframe:cache {initialize:{registry:{allow_registry_register:1b}}} run say [Eseframe API] Error! Custom recipe tags can only be registered during function tag `#eseframe_api:registry/add`.
execute unless data storage eseframe:cache {initialize:{registry:{allow_registry_register:1b}}} run return fail

say [Eseframe API] TODO: Add some sort of input validation to eseframe_api:tag_recipe to prevent duplicates (or maybe silently ignore them?) 

$function eseframe:registry/recipe_tag/add {tag_id:"$(tag_id)",tag_namespace:"$(tag_namespace)",recipe_id:"$(id)",recipe_namespace:"$(namespace)"}