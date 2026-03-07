# Start a counter of how many of this ingredient has been found
scoreboard players reset #amount_of_ingredient_found eseframe.tmp.perform_custom_recipe

# Add inventory matches to counter
$execute store result score #matches_in_slot_type eseframe.tmp.perform_custom_recipe if items entity @s inventory.* $(item_predicate)
scoreboard players operation #amount_of_ingredient_found eseframe.tmp.perform_custom_recipe += #matches_in_slot_type eseframe.tmp.perform_custom_recipe

# # Add hotbar matches to counter
$execute store result score #matches_in_slot_type eseframe.tmp.perform_custom_recipe if items entity @s hotbar.* $(item_predicate)
scoreboard players operation #amount_of_ingredient_found eseframe.tmp.perform_custom_recipe += #matches_in_slot_type eseframe.tmp.perform_custom_recipe

# # Add offhand slot matches to counter
$execute store result score #matches_in_slot_type eseframe.tmp.perform_custom_recipe if items entity @s weapon.offhand $(item_predicate)
scoreboard players operation #amount_of_ingredient_found eseframe.tmp.perform_custom_recipe += #matches_in_slot_type eseframe.tmp.perform_custom_recipe



# Return whether enough of the ingredient was found (failing will break the loop and make the craft fail)
$return run execute if score #amount_of_ingredient_found eseframe.tmp.perform_custom_recipe matches $(count)..