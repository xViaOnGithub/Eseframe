# Returns 1 if this item just started being used this tick, and returns fail if the item was used last tick


# Get last tick's gametime
execute store result storage eseframe:cache tick.content.item.detect.use_press.last_gametime long 1 run data get storage eseframe:cache session.content.item.detect.use_press.copy_of_gametime_that_is_updated_on_tick_which_makes_it_one_tick_behind_gametime_when_read_by_a_function_invoked_by_advancements_due_to_execution_order


# Return 1 if this is the first time this item is being used
execute unless data entity @s SelectedItem.components."minecraft:custom_data".eseframe.last_use run say first use
execute unless data entity @s SelectedItem.components."minecraft:custom_data".eseframe.last_use run return 1

# Return the inverse of whether the item was used last tick
return run function eseframe:content/item/detect/use_press/steps/02_does_last_use_not_match_last_tick with storage eseframe:cache tick.content.item.detect.use_press