# Returns fail if this is the same item as last time an Eseframe item was used

data modify storage eseframe:cache tick.content.item.detect.use_hold.press_test.uuid set from entity @s UUID
data modify storage eseframe:cache tick.content.item.detect.use_hold.press_test.item.id set from entity @s SelectedItem.components."minecraft:custom_data".eseframe.id
data modify storage eseframe:cache tick.content.item.detect.use_hold.press_test.item.namespace set from entity @s SelectedItem.components."minecraft:custom_data".eseframe.namespace

return run data modify storage eseframe:cache session.content.item.detect.use_hold.press_test set from storage eseframe:cache tick.content.item.detect.use_hold.press_test