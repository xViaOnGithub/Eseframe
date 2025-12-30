# Loop reciever, see function esefy:util/loop/start for more details.

# $(data) is the name of the workstation
# Recipe data for current recipe can be found at storage esefy:recipes $(data)[$(index)]


# Set an input check flag that starts out true 
data modify storage esefy:tmp recipe_performer.recipe_success set value true


# Set the recipe check flag to false if the predicate and/or the NBT check fails.
# If a predicate/data is not provided, it's test is ignored.
$execute if data storage esefy:recipes $(data)[$(index)].input.predicate run function esefy:internal/mechanics/crafting/workstation/attempt/steps/03_check_predicate_path with storage esefy:recipes $(data)[$(index)].input
$execute if data storage esefy:recipes $(data)[$(index)].input.data run function esefy:internal/mechanics/crafting/workstation/attempt/steps/04_check_data_match with storage esefy:recipes $(data)[$(index)].input


# Return fail if any provided input check failed
execute if data storage esefy:tmp {recipe_performer:{recipe_success:false}} run return fail


# Decrease the count of every slot by 1, effectively using up one item of each slot.
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

# Invoke output loot table as item entity(s)
$function esefy:internal/mechanics/crafting/workstation/attempt/steps/05_spawn_loot_table with storage esefy:recipes $(data)[$(index)].output


# Return 1 to stop trying new recipes.
return 1