# Called from an advancement, will run AS and AT the player who got the advancement.
# This function runs when the player is using (holding interact with) an item with the `eseframe` custom data path

# Remove the advancement so it can be earned again next tick
advancement revoke @s only eseframe:registry/item/detect/using

# Call a function that runs the use_hold function tag in the item's respective folder
#   unless the player used an Eseframe item last tick
execute unless entity @s[tag=eseframe.registry.item.detect.using.PressDebounce] run function eseframe:registry/item/detect/using/steps/01_call_use_press_function_tag_in_item_folder with entity @s SelectedItem.components."minecraft:custom_data".eseframe

# Add the UsedThisTick tag (which will give the player the PressDebounce tag next tick)
tag @s add eseframe.registry.item.detect.using.UsedThisTick

# Call a function that runs the use_hold function tag in the item's respective folder
function eseframe:registry/item/detect/using/steps/02_call_use_hold_function_tag_in_item_folder with entity @s SelectedItem.components."minecraft:custom_data".eseframe