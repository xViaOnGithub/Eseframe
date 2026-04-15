# Called from an advancement, will run AS and AT the player who got the advancement.
# This function runs when the player consumes (throws, eats, or otherwise direclty uses up) an item with the eseframe.detect_consume custom data set to true (1b).

# Remove the advancement so it can be earned again next tick
advancement revoke @s only eseframe:registry/item/detect/consume

# Call a function that runs the consume function tag in the item's respective folder
function eseframe:registry/item/detect/consume/steps/01_call_function_tag_in_item_folder with entity @s SelectedItem.components."minecraft:custom_data".eseframe