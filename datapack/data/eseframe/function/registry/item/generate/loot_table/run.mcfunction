# Macro Keys:
#   - id (string)               id of a registered custom item
#   - namespace (string)        namespace of a registered custom item

## Outputs to storage eseframe:cache tick.registry.item.generate.loot_table.output


# If this item has the "override_template_item" property, start with that item
$execute if data storage eseframe:registry item[{id:"$(id)",namespace:"$(namespace)"}].properties.override_template_item run data modify storage eseframe:cache tick.registry.item.generate.loot_table.output set value {type:"minecraft:generic",pools:[{rolls:$(count),entries:[{type:"minecraft:item",functions:[]}]}]}
$execute if data storage eseframe:registry item[{id:"$(id)",namespace:"$(namespace)"}].properties.override_template_item run data modify storage eseframe:cache tick.registry.item.generate.loot_table.output.pools[0].entries[0].name set from storage eseframe:registry item[{id:"$(id)",namespace:"$(namespace)"}].properties.override_template_item

# Otherwise, start with a dummy item
$execute unless data storage eseframe:registry item[{id:"$(id)",namespace:"$(namespace)"}].properties.override_template_item run data modify storage eseframe:cache tick.registry.item.generate.loot_table.output set value {type:"minecraft:generic",pools:[{rolls:$(count),entries:[{type:"minecraft:loot_table",value:"eseframe:dummy_item",functions:[]}]}]}

# Generate an item modifier that will apply components and custom data item
$function eseframe:registry/item/generate/item_modifier/run {id:"$(id)",namespace:"$(namespace)"}

# Insert the generated item modifier into the loot table for the final output
data modify storage eseframe:cache tick.registry.item.generate.loot_table.output.pools[0].entries[0].functions append from storage eseframe:cache tick.registry.item.generate.item_modifier.output