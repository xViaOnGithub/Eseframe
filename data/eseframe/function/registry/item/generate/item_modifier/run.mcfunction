# Expected to be ran WITH the following keys:
#   - id (string): The id of the custom item within the item registry
#   - namespace (string): The namespace of the custom item within the item registry

# Generates an item modifier that applies item components from the item registry (storage eseframe:registry item[]),
#   intended to be used on an item that has it's default components removed (though sometimes it is useful to not do that!).

## Outputs to storage eseframe:cache tick.registry.item.generate.item_modifier.output

# To use, run this function, and then immeadiately use or copy the output somewhere else, as it will be deleted at
#   the end of the tick, and overwritten the next time this function is called.


# Create a blank sequence item modifier at the output storage location
data modify storage eseframe:cache tick.registry.item.generate.item_modifier.output set value {function:"minecraft:sequence",functions:[]}


# Apply components copied over from the item registry
data modify storage eseframe:cache tick.registry.item.generate.item_modifier.output.functions append value {function:"minecraft:set_components"}
$data modify storage eseframe:cache tick.registry.item.generate.item_modifier.output.functions[0].components set from storage eseframe:registry item[{id:"$(id)",namespace:"$(namespace)"}].components

# Add the custom item's id and namespace to a fixed path (eseframe:{id,namespace}) in component "minecraft:custom_data"
$data modify storage eseframe:cache tick.registry.item.generate.item_modifier.output.functions append value {function:"minecraft:set_custom_data",tag:{eseframe:{id:"$(id)",namespace:"$(namespace)"},eseframe_api:{v1:{custom_item:{id:"$(id)",addon:"$(namespace)"}}}}}