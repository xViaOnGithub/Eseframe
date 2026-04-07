# Returns fail if this is the same item as last time an Eseframe item was used

data modify storage eseframe:cache tick.content.item.detect.using.02.uuid set from entity @s UUID
data modify storage eseframe:cache tick.content.item.detect.using.02.item.id set from entity @s SelectedItem.components."minecraft:custom_data".eseframe.id
data modify storage eseframe:cache tick.content.item.detect.using.02.item.namespace set from entity @s SelectedItem.components."minecraft:custom_data".eseframe.namespace

return run data modify storage eseframe:cache session.content.item.detect.using.02.press_test set from storage eseframe:cache tick.content.item.detect.using.02