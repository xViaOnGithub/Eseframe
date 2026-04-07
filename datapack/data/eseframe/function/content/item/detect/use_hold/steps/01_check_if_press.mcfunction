# Return 1 if item changed
execute if function eseframe:content/item/detect/use_hold/steps/02_check_if_different_item run return 1

# If the function makes it to this point, the player is using an Eseframe item
#   with the same namespace and ID as the last time they used an Eseframe item. 

return fail



# press (wip)
#execute unless entity @s[tag=eseframe-content-item-detect-use_hold-used_last_tick] run say press













# # This function runs after functions called from advancements due to execution order.

# execute as @a run say -- NEW TICK --
# execute as @a[tag=eseframe-content-item-detect-use_hold-used_this_tick] run say this tick
# execute as @a[tag=eseframe-content-item-detect-use_hold-used_last_tick] run say last tick


# # Remove the tag for using item last tick
# tag @a remove eseframe-content-item-detect-use_hold-used_last_tick

# # Add the used item last tick tag to players with the used this tick
# tag @a[tag=eseframe-content-item-detect-use_hold-used_this_tick] add eseframe-content-item-detect-use_hold-used_last_tick
# tag @a remove eseframe-content-item-detect-use_hold-used_this_tick