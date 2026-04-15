# Expected to be ran WITH the following keys:
#   - id (string): The id of the custom item within the item registry
#   - namespace (string): The namespace of the custom item within the item registry
#   - count (integer): The amount of the item to give the player running this function

# Generate a loot table of the desired amount of the given registered custom item
$function eseframe:registry/item/generate/loot_table/run {id:"$(id)",namespace:"$(namespace)",count:$(count)}
data modify storage eseframe:cache tick.registry.item.give.loot_table set from storage eseframe:cache tick.registry.item.generate.loot_table.output

# Give this player the loot table
function eseframe:registry/item/give/steps/01_give_loot with storage eseframe:cache tick.registry.item.give