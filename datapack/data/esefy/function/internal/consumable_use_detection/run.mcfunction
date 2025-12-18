# This function is called by the advancement "esefy:_internal/generic/detect_item_use" when the player uses an item that has Esefy.detect_item_use set to true.
# It is automatically ran as and at the player using the consumable item with the tag.
# When this function is ran, it then runs function "esefy:consumable_use_detection/items/[Esefy.id from custom data component]/run"

say a
# Revoke the advancement so it can be detected again next tick.
advancement revoke @s only esefy:internal/generic/detect_item_use

# Macro the player's entity data so step 1 can access SelectedItem
function esefy:internal/consumable_use_detection/steps/01_run_function_from_item_id_subdirectory with entity @s SelectedItem.components.minecraft:custom_data.Esefy

# Tag the player to show that they pressed it this tick
tag @s add esefy_detect_item_use_last_tick

# This is going to macro in the item's id to another function that will use that to run a "run" function from a directory named after the item id