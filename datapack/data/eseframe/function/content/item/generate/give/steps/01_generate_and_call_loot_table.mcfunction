# Gives the entity running the command an item using Eseframe's custom item format.
# Intended to be called WITH a properly formatted custom item from storage eseframe:content item[]   

# It is an inline loot table that works like this:
#   1. Start with a minecraft:command_block, an item that is unobtainable in survival mode
#   2. Set the amount of the item to macro $(count)
#   3. Remove certain default components like minecraft:item_name and minecraft:item_model to make it effectively a dummy item
#   4. Use an inline item modifier to insert components from macro $(componenets)
#   5. Use another inline item modifier to set required Eseframe custom data, such as "id" and "namespace", using macros

$loot give @s loot {type:"minecraft:generic",pools:[{rolls:$(count),entries:[{type:"minecraft:item",name:"minecraft:command_block",functions:[$(item_modifier)]}]}]}