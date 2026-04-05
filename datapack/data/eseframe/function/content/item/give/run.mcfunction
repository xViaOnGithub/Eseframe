# Expected to be ran WITH the following keys:
#   - id (string): The id of the custom item within the item registry
#   - namespace (string): The namespace of the custom item within the item registry
#   - count (integer): The amount of the item to give the player running this function

# Generate an item modifier that will turn a default "minecraft:command_block" into the desired registered custom item
$function eseframe:content/item/generate/generate_item_modifier/run {id:"$(id)",namespace:"$(namespace)"}
data modify storage eseframe:cache tick.content.item.give.item_modifier set from storage eseframe:cache tick.content.item_modifier.generate.item_modifier.output

# Set amount of items to give from macro key $(count)
$data modify storage eseframe:cache tick.content.item.give.count set value $(count)

# Generative and give this entity a loot table from the custom item's data
function eseframe:content/item/give/steps/01_generate_and_call_loot_table with storage eseframe:cache tick.content.item.give