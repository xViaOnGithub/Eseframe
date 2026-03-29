# Called from an advancement, will run AS and AT the player who got the advancement.
# This function runs when the player is using (holding interact with) an item with the ...Eseframe.detect_use_hold set to true (1b).

# Remove the advancement so it can be earned again next tick
advancement revoke @s only eseframe:content/item/detect/use_hold

# Call a function that runs the use_hold function in the item's respective folder
function eseframe:content/item/detect/use_hold/steps/01_call_function_in_item_folder with entity @s SelectedItem.components."minecraft:custom_data".Eseframe