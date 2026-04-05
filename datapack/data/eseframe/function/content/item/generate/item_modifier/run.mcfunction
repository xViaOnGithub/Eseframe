# Expected to be ran WITH the following keys:
#   - id (string): The id of the custom item within the item registry
#   - namespace (string): The namespace of the custom item within the item registry

# Generates an item modifier that applies item components from the item registry (storage eseframe:content item[]),
#   intended to be used on a "minecraft:command_block" item that has default components.

## Outputs to storage eseframe:cache tick.content.item_modifier.generate.item_modifier.output

# To use, run this function, and then immeadiately use or copy the output somewhere else, as it will be deleted at
#   the end of the tick, and overwritten the next time this function is called.


# Create a blank sequence item modifier at the output storage location
data modify storage eseframe:cache tick.content.item_modifier.generate.item_modifier.output set value {function:"minecraft:sequence",functions:[]}


# First, remove the default components found on item "minecraft:command_block"
data modify storage eseframe:cache tick.content.item_modifier.generate.item_modifier.output.functions append value {function:"minecraft:set_components",components:{"!minecraft:rarity":{},"!minecraft:item_name":{},"!minecraft:item_model":{},"!minecraft:max_stack_size":{}}}

# Second, apply components copied over from the item registry
data modify storage eseframe:cache tick.content.item_modifier.generate.item_modifier.output.functions append value {function:"minecraft:set_components"}
$data modify storage eseframe:cache tick.content.item_modifier.generate.item_modifier.output.functions[1].components set from storage eseframe:content item[{id:"$(id)",namespace:"$(namespace)"}].components



# Last, add the custom item's id and namespace to a fixed path (Eseframe:{id,namespace}) in component "minecraft:custom_data"
$data modify storage eseframe:cache tick.content.item_modifier.generate.item_modifier.output.functions append value {function:"minecraft:set_custom_data",tag:{Eseframe:{id:"$(id)",namespace:"$(namespace)"}}}