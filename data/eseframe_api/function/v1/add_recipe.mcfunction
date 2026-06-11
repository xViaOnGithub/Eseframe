# Only allow during function <namespace>:eseframe_api/v1/content
execute unless data storage eseframe:cache initialize.include.add_content.Allowed run return run say [Eseframe API] Error! Custom recipes can only be added during function `<addon_namespace>:eseframe_api/v1/content`.

# # Prevent duplicate id/namespace combonations.
# $execute if data storage eseframe:buffer recipe[{id:"$(id)",namespace:"$(namespace)"}] run return run say [Eseframe API] Error! There is already a custom recipe added with id "$(id)" and namespace "$(namespace)".
say TODO: Re-implement duplicate addon recipe id prevention during processing


# Assemble the raw recipe data that will added to the buffer
$data modify storage eseframe:cache initialize.include.add_content.API.RawRecipe set value {id:"$(id)",ingredients:$(ingredients),properties:$(properties)}
data modify storage eseframe:cache initialize.include.add_content.API.RawRecipe.namespace set from storage eseframe:cache initialize.include.add_content.Addon

# Add the recipe directly to a storage path for processing
data modify storage eseframe:buffer recipe append from storage eseframe:cache initialize.include.add_content.API.RawRecipe