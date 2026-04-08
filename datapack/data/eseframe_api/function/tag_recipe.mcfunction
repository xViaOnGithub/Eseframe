# Stop if used outside of the intended function tag (#eseframe:content/add)
execute unless data storage eseframe:cache {initialize:{content:{allow_content_register:1b}}} run say [Eseframe API] Error! Custom recipe tags can only be registered during function tag `#eseframe_api:content/add`.
execute unless data storage eseframe:cache {initialize:{content:{allow_content_register:1b}}} run return fail

say [Eseframe API] TODO: Add some sort of input validation to eseframe_api:tag_recipe to prevent duplicates (or maybe silently ignore them?) 

$function eseframe:content/recipe_tag/add {tag_id:"$(tag_id)",tag_namespace:"$(tag_namespace)",recipe_id:"$(id)",recipe_namespace:"$(namespace)"}