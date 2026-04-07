# Called from an advancement, will run AS and AT the player who got the advancement.
# This function runs when the player is using (holding interact with) an item with the ...eseframe.detect_use_hold set to true (1b).

# Remove the advancement so it can be earned again next tick
advancement revoke @s only eseframe:content/item/detect/use_hold

# TODO: Detect press
execute if function eseframe:content/item/detect/use_hold/steps/01_check_if_press run say item changed since last use



# Call a function that runs the use_hold function tag in the item's respective folder
function eseframe:content/item/detect/use_hold/steps/03_call_function_tag_in_item_folder with entity @s SelectedItem.components."minecraft:custom_data".eseframe