# Stop if used outside of the intended function tag (#eseframe_api:register/recipes)
execute unless data storage eseframe:cache {initialize:{registry:{allow_registry_register:"recipe"}}} run return run say [Eseframe API] Error! Custom recipes can only be registered during function tag `#eseframe_api:register/recipes`.

# Prevent duplicate id/namespace combonations.
$execute if data storage eseframe:registry recipe[{id:"$(id)",namespace:"$(namespace)"}] run return run say [Eseframe API] Error! There is already a custom recipe registered with id "$(id)" and namespace "$(namespace)".

# TODO: Add the recipe directly to a storage path, then check/process that after?
$function eseframe:registry/recipe/add {id:"$(id)",namespace:"$(namespace)",ingredients:$(ingredients),properties:$(properties)}