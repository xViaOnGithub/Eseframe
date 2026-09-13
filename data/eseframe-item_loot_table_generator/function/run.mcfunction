# Macro Keys:
#   - id (string)         id of a registered custom item
#   - namespace (string)  namespace of a registered custom item
#   - count (integer)     loot table rolls

## Outputs to eseframe-item_loot_table_generator:output loot_table

## Prepare a (usually) dummy loot table to add components; Store at storage eseframe-item_loot_table_generator:_cache loot_table

# Get the this custom item's template item (vanilla item id as a string), if it has one 
data modify storage eseframe-item_loot_table_generator:_cache template_item set from storage eseframe:registry item[{id:"$(id)",namespace:"$(namespace)"}].properties.override_template_item

# If this item has the "override_template_item" property, start with a loot table that gives that item
execute if data storage eseframe-item_loot_table_generator:_cache template_item run data modify storage eseframe-item_loot_table_generator:_cache loot_table set value {type:"minecraft:generic",pools:[{entries:[{type:"minecraft:item",functions:[]}]}]}
execute if data storage eseframe-item_loot_table_generator:_cache template_item run data modify storage eseframe-item_loot_table_generator:_cache loot_table.pools[0].entries[0].name set from storage eseframe-item_loot_table_generator:_cache template_item

# Otherwise, start with a loot table that gives a dummy item
execute unless data storage eseframe-item_loot_table_generator:_cache template_item run data modify storage eseframe-item_loot_table_generator:_cache loot_table set value {type:"minecraft:generic",pools:[{entries:[{type:"minecraft:loot_table",value:"eseframe-item_loot_table_generator:dummy_item",functions:[]}]}]}

# Set the amount of rolls from $(count)
$data modify storage eseframe-item_loot_table_generator:_cache loot_table.pools[0].rolls set value $(count)


## Generate an item modifier that will apply components and custom data to the item; Store at storage eseframe-item_loot_table_generator:_cache item_modifier

# Create a blank sequence item modifier
data modify storage eseframe-item_loot_table_generator:_cache item_modifier set value {function:"minecraft:sequence",functions:[]}

# Copy over components from the custom item registry
data modify storage eseframe-item_loot_table_generator:_cache item_modifier.functions append value {function:"minecraft:set_components"}
$data modify storage eseframe-item_loot_table_generator:_cache item_modifier.functions[0].components set from storage eseframe:registry item[{id:"$(id)",namespace:"$(namespace)"}].components

# The custom item's id and namespace will be stored in it's "minecraft:custom_data" component
# Paths (CHANGING WILL BREAK BACKWARDS COMPATIBILITY):
# - Internal: eseframe.id, eseframe.namespace
# - API V1: eseframe_api-v1.custom_item.id, eseframe_api-v1.custom_item.addon
$data modify storage eseframe-item_loot_table_generator:_cache item_modifier.functions append value {function:"minecraft:set_custom_data",tag:{eseframe:{id:"$(id)",namespace:"$(namespace)"},eseframe_api-v1:{custom_item:{id:"$(id)",addon:"$(namespace)"}}}}


## Insert the generated item modifier into the loot table for the final output
data modify storage eseframe-item_loot_table_generator:_cache loot_table.pools[0].entries[0].functions append from storage eseframe-item_loot_table_generator:_cache item_modifier


## Copy final loot table to the output path
data modify storage eseframe-item_loot_table_generator:output loot_table set from storage eseframe-item_loot_table_generator:_cache loot_table


## Clean up temporary storage paths used
data remove storage eseframe-item_loot_table_generator:_cache template_item
data remove storage eseframe-item_loot_table_generator:_cache loot_table
data remove storage eseframe-item_loot_table_generator:_cache item_modifier