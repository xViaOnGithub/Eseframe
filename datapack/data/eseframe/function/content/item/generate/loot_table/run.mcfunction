# Macro Keys:
#   - id (string)               id of a registered custom item
#   - namespace (string)        namespace of a registered custom item
#   - template_item (string):   A (real) item id of the item to have the loot table apply components to.
#                                   leave blank to use a dummy item with no (functional) components.


# from old function:
# It is an inline loot table that works like this:
#   1. Start with a minecraft:command_block, an item that is unobtainable in survival mode
#   2. Set the amount of the item to macro $(count)
#   3. Remove certain default components like minecraft:item_name and minecraft:item_model to make it effectively a dummy item
#   4. Use an inline item modifier to insert components from macro $(componenets)
#   5. Use another inline item modifier to set required Eseframe custom data, such as "id" and "namespace", using macros

## Outputs to storage eseframe:cache tick.content.item.generate.loot_table.output


# Store a flag called "use_dummy_item" if $(template_item) is a blank string
$data modify storage eseframe:cache tick.content.item.generate.loot_table.use_dummy_item set value "$(template_item)"
execute unless data storage eseframe:cache {tick:{content:{item:{generate:{loot_table:{use_dummy_item:""}}}}}} run data remove storage eseframe:cache tick.content.item.generate.loot_table.use_dummy_item


# Start with the template item
$execute unless data storage eseframe:cache tick.content.item.generate.loot_table.use_dummy_item run data modify storage eseframe:cache tick.content.item.generate.loot_table.output set value {type:"minecraft:generic",pools:[{rolls:$(count),entries:[{type:"minecraft:item",name:"$(template_item)",functions:[]}]}]}

# Start with a dummy item if there was no template item
$execute if data storage eseframe:cache tick.content.item.generate.loot_table.use_dummy_item run data modify storage eseframe:cache tick.content.item.generate.loot_table.output set value {type:"minecraft:generic",pools:[{rolls:$(count),entries:[{type:"minecraft:loot_table",value:"eseframe:dummy_item",functions:[]}]}]}


# Generate an item modifier that will turn the command block(s) into the desired item
$function eseframe:content/item/generate/item_modifier/run {id:"$(id)",namespace:"$(namespace)"}

# Insert the generated item modifier into the loot table for the final output
data modify storage eseframe:cache tick.content.item.generate.loot_table.output.pools[0].entries[0].functions append from storage eseframe:cache tick.content.item.generate.item_modifier.output