# NOTE: This will not work for recipes that have multiple identical ingredients, because the same slot can be detected twice!


# Return fail if the item is not found in inventory, not found in hotbar, or not found in offhand
# This will make the entire loop stop and return a fail
$execute unless items entity @s inventory.* $(item_predicate) unless items entity @s hotbar.* $(item_predicate) unless items entity @s weapon.offhand $(item_predicate) run return fail

# If the function makes it past the above line without returning, it means that the player has the ingredient.

# Continue the loop as normal
return 1