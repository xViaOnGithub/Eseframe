# # Stop if used outside of the intended function tag (#eseframe_api:register/recipe_tags)
#execute unless data storage eseframe:cache {initialize:{registry:{allow_registry_register:"recipe_tag"}}} run return run say [Eseframe API] Error! Custom recipes can only be tagged during function tag `#eseframe_api:register/recipe_tags`.

# Delete this and uncomment the above once ready to move it to the proper tag
say [Eseframe API] Warning! Custom recipe tag function is temporarily enabled during `#eseframe_api:register/recipe` instead of `#eseframe_api:register/recipe_tags`!
execute unless data storage eseframe:cache {initialize:{registry:{allow_registry_register:"recipe"}}} run return run say [Eseframe API] Error! Custom recipes can temporarilly only be tagged during function tag `#eseframe_api:register/recipe`.

# Prevent duplicate id/namespace combonations within the recipe tag.
$execute if data storage eseframe:registry recipe_tag[{id:"$(id)",namespace:"$(namespace)"}] run return run say [Eseframe API] Error! Custom recipe with id "$(id)" and namespace "$(namespace)" already has tag with id $(tag_id) and namespace $(tag_namespace).

# TODO: Add the recipe tag entry directly to a storage path, then check/process that after?
$function eseframe:registry/recipe_tag/add {tag_id:"$(tag_id)",tag_namespace:"$(tag_namespace)",recipe_id:"$(id)",recipe_namespace:"$(namespace)"}