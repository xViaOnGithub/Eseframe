# BUG: "Shapeless" recipes that don't specify which slot each item goes in don't check if you used the right amount of each item.

# Checks if the "Items" array of the block entity at ~ ~ ~ matches the "input" macro path.
# Next, checks if the recipe and input use the same amount of slots.
# If that succeeds, decrement every item count of this block entity and call the loot table specified in the "output" macro path.

# Return if container's "Items" nbt path doesn't soft-match the "input" field of the recipe.
$execute unless data block ~ ~ ~ {Items:$(input)} run return fail

# Store how many items are in this block entity.
execute store result score #slots_used_in_block_entity esefy.temporary.workstation_crafting if data block ~ ~ ~ Items[]

# Return fail if this block entity has a different amount of filled slots than there are in the recipe
# (This catches when extra items are present)
execute unless score #slots_used_in_block_entity esefy.temporary.workstation_crafting = #slots_used_in_recipe esefy.temporary.workstation_crafting run return fail

# Remove one from every possible crafting slot.
item modify block ~ ~ ~ container.0 esefy:remove_one
item modify block ~ ~ ~ container.1 esefy:remove_one
item modify block ~ ~ ~ container.2 esefy:remove_one
item modify block ~ ~ ~ container.3 esefy:remove_one
item modify block ~ ~ ~ container.4 esefy:remove_one
item modify block ~ ~ ~ container.5 esefy:remove_one
item modify block ~ ~ ~ container.6 esefy:remove_one
item modify block ~ ~ ~ container.7 esefy:remove_one
item modify block ~ ~ ~ container.8 esefy:remove_one
item modify block ~ ~ ~ container.9 esefy:remove_one
item modify block ~ ~ ~ container.10 esefy:remove_one
item modify block ~ ~ ~ container.11 esefy:remove_one
item modify block ~ ~ ~ container.12 esefy:remove_one
item modify block ~ ~ ~ container.13 esefy:remove_one
item modify block ~ ~ ~ container.14 esefy:remove_one
item modify block ~ ~ ~ container.15 esefy:remove_one
item modify block ~ ~ ~ container.16 esefy:remove_one
item modify block ~ ~ ~ container.17 esefy:remove_one
item modify block ~ ~ ~ container.18 esefy:remove_one
item modify block ~ ~ ~ container.19 esefy:remove_one
item modify block ~ ~ ~ container.20 esefy:remove_one
item modify block ~ ~ ~ container.21 esefy:remove_one
item modify block ~ ~ ~ container.22 esefy:remove_one
item modify block ~ ~ ~ container.23 esefy:remove_one
item modify block ~ ~ ~ container.24 esefy:remove_one
item modify block ~ ~ ~ container.25 esefy:remove_one
item modify block ~ ~ ~ container.26 esefy:remove_one
item modify block ~ ~ ~ container.27 esefy:remove_one
item modify block ~ ~ ~ container.28 esefy:remove_one
item modify block ~ ~ ~ container.29 esefy:remove_one
item modify block ~ ~ ~ container.30 esefy:remove_one
item modify block ~ ~ ~ container.31 esefy:remove_one
item modify block ~ ~ ~ container.32 esefy:remove_one
item modify block ~ ~ ~ container.33 esefy:remove_one
item modify block ~ ~ ~ container.34 esefy:remove_one
item modify block ~ ~ ~ container.35 esefy:remove_one
item modify block ~ ~ ~ container.36 esefy:remove_one
item modify block ~ ~ ~ container.37 esefy:remove_one
item modify block ~ ~ ~ container.38 esefy:remove_one
item modify block ~ ~ ~ container.39 esefy:remove_one
item modify block ~ ~ ~ container.40 esefy:remove_one
item modify block ~ ~ ~ container.41 esefy:remove_one
item modify block ~ ~ ~ container.42 esefy:remove_one
item modify block ~ ~ ~ container.43 esefy:remove_one
item modify block ~ ~ ~ container.44 esefy:remove_one
item modify block ~ ~ ~ container.45 esefy:remove_one
item modify block ~ ~ ~ container.46 esefy:remove_one
item modify block ~ ~ ~ container.47 esefy:remove_one
item modify block ~ ~ ~ container.48 esefy:remove_one
item modify block ~ ~ ~ container.49 esefy:remove_one
item modify block ~ ~ ~ container.50 esefy:remove_one
item modify block ~ ~ ~ container.51 esefy:remove_one
item modify block ~ ~ ~ container.52 esefy:remove_one
item modify block ~ ~ ~ container.53 esefy:remove_one


#
#data modify storage esefy:tmp recipe_performer.output_success set value false



# Slimefun4's output chest direction order (parity is ideal but not required):
#-z (north) +x (east) +z (south) -x (west)
# Attempt to insert the output into an adjacent block with the container #esefy:recipe_output_containers, return success if any succeed


# The below lines are currently disabled due to a bug that makes /loot return success when a container is full if there is any of the output item in the chest.  
# THE BELOW COMMENTS SUCK, REWRITE THEM
# Try to place the output loot table in a North (Z-) adjacent output container, return if successful.
#$execute store success storage esefy:tmp recipe_performer.output_success byte 1 if block ~ ~ ~-1 #esefy:recipe_output_containers run loot insert ~ ~ ~-1 loot $(output)
#execute if data storage esefy:tmp {recipe_performer:{output_success:true}} run return 1

# Try to place the output loot table in a East (X+) adjacent output container, return if successful.
#$execute store success storage esefy:tmp recipe_performer.output_success byte 1 if block ~1 ~ ~ #esefy:recipe_output_containers run loot insert ~1 ~ ~ loot $(output)
#execute if data storage esefy:tmp {recipe_performer:{output_success:true}} run return 1

# Try to place the output loot table in a South (Z+) adjacent output container, return if successful.
#$execute store success storage esefy:tmp recipe_performer.output_success byte 1 if block ~ ~ ~1 #esefy:recipe_output_containers run loot insert ~ ~ ~1 loot $(output)
#execute if data storage esefy:tmp {recipe_performer:{output_success:true}} run return 1

# Try to place the output loot table in a West (X-) adjacent output container, return if successful.
#$execute store success storage esefy:tmp recipe_performer.output_success byte 1 if block ~-1 ~ ~ #esefy:recipe_output_containers run loot insert ~-1 ~ ~ loot $(output)
#execute if data storage esefy:tmp {recipe_performer:{output_success:true}} run return 1

# Try to place the output loot table into itself, return if successful.
#$execute store success storage esefy:tmp recipe_performer.output_success byte 1 run loot insert ~ ~ ~ loot $(output)
#execute if data storage esefy:tmp {recipe_performer:{output_success:true}} run return 1

# Spawn the output loot table as item entities and return
$loot spawn ~ ~ ~ loot $(output)

# Tell the loop to stop trying new recipes 
return 1