# Called from an advancement, will run AS and AT the player who got the advancement.
# This function runs when the player starts using (holding interact with) an item with the eseframe.detect_use_press custom data set to true (1b).

# Remove the advancement so it can be earned again next tick
advancement revoke @s only eseframe:content/item/detect/use_press

title @s actionbar "USE PRESS DETECTION IS TEMPORARILY DISABLED UNTIL IT IS REWORKED TO USE STORAGE INSTEAD OF ITEM DATA, AS CHANGING ITEM DATA RESET THE USE ANIMATION, MAKING IT IMPOSSIBLE TO CONSUME AN ITEM THAT IS NOT INSTANT."
return -1

# If player started using the held item this frame, call a function that runs the use_hold function tag in the item's respective folder
execute if function eseframe:content/item/detect/use_press/steps/01_check_if_use_just_started run function eseframe:content/item/detect/use_press/steps/03_call_function_tag_in_item_folder with entity @s SelectedItem.components."minecraft:custom_data".eseframe


# Store a timestamp in the item, so it knows to not call the item's use_press function next tick.
execute store result storage eseframe:cache tick.content.item.detect.use_press.current_gametime long 1 run time query gametime
item modify entity @s weapon.mainhand eseframe:content/item/detect/use_press/copy_use_timestamp_to_item