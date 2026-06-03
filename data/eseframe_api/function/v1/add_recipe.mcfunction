# Stop if used outside of the intended function tag (#eseframe_api:register/recipes)
execute unless data storage eseframe:cache initialize.registry.allow_registry_register run return run say [Eseframe API] Error! Custom recipes can only be added during function tag `#eseframe_api:register/recipes`.

# Prevent duplicate id/namespace combonations.
$execute if data storage eseframe:buffer recipe[{id:"$(id)",namespace:"$(namespace)"}] run return run say [Eseframe API] Error! There is already a custom recipe added with id "$(id)" and namespace "$(namespace)".

# Add the recipe directly to a storage path for processing
$data modify storage eseframe:buffer recipe append value {id:"$(id)",namespace:"$(namespace)",ingredients:$(ingredients),properties:$(properties)}