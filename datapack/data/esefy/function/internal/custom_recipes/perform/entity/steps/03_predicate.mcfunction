say predicate didnt crash (yipee)


# Start a counter of how many of this ingredient has been found
scoreboard players reset #amount_of_ingredient_found esefy.tmp.perform_custom_recipe

# Add inventory matches to counter
$execute store result score #matches_in_slot_type esefy.tmp.perform_custom_recipe if items entity @s inventory.* $(item_predicate)
scoreboard players operation #amount_of_ingredient_found esefy.tmp.perform_custom_recipe += #matches_in_slot_type esefy.tmp.perform_custom_recipe

# # Add hotbar matches to counter
$execute store result score #matches_in_slot_type esefy.tmp.perform_custom_recipe if items entity @s hotbar.* $(item_predicate)
scoreboard players operation #amount_of_ingredient_found esefy.tmp.perform_custom_recipe += #matches_in_slot_type esefy.tmp.perform_custom_recipe

# # Add offhand slot matches to counter
$execute store result score #matches_in_slot_type esefy.tmp.perform_custom_recipe if items entity @s weapon.offhand $(item_predicate)
scoreboard players operation #amount_of_ingredient_found esefy.tmp.perform_custom_recipe += #matches_in_slot_type esefy.tmp.perform_custom_recipe


# Set fail flag to true if there is less matches than required
$execute store success storage esefy:tmp perform_custom_recipe_entity.any_ingredient_missing byte 1 unless score #amount_of_ingredient_found esefy.tmp.perform_custom_recipe matches $(count)..