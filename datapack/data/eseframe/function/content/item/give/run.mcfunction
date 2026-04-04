# Combine registy data and macros to cache to macro into the next function
$data modify storage eseframe:cache tick.content.item.give set from storage eseframe:content item[{id:"$(id)",namespace:"$(namespace)"}]
$data modify storage eseframe:cache tick.content.item.give.count set value $(count)

# Generative and give this entity a loot table from the custom item's data
function eseframe:content/item/give/steps/01_generate_and_call_loot_table with storage eseframe:cache tick.content.item.give

# TODO: generate the loot table seprately from giving it, so the loot table can be spawned and
#       inserted without needing to keep track of 3 copies of the loot table