# Add this ingredient's count to the #total_ingredient_count counter
$scoreboard players add #total_ingredient_count eseframe.tmp.perform_custom_recipe $(count)


# Start a counter of how many of this ingredient has been found
scoreboard players reset #amount_of_ingredient_found eseframe.tmp.perform_custom_recipe

# Add inventory matches to counter
$execute store result score #amount_of_ingredient_found eseframe.tmp.perform_custom_recipe if items block ~ ~ ~ container.* $(item_predicate)

# Return whether the correct amount of the ingredient was found (failing will break the loop and make the craft fail)
$return run execute if score #amount_of_ingredient_found eseframe.tmp.perform_custom_recipe matches $(count)