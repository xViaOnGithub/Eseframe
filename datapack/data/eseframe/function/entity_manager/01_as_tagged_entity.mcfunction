# Runs AS and AT every entity with the Eseframe tag

# ------------------------------------------------------------------------
## Conditions

# Return and kill if Eseframe data is missing
execute unless data entity @s {data:{Eseframe:{requirements:[{}]}}} run say structure missing
execute unless data entity @s {data:{Eseframe:{requirements:[{}]}}} run return run function eseframe:entity_manager/_kill

# Return and kill if any requirements fail 
execute unless function eseframe:entity_manager/02_test_all_requirements run return run function eseframe:entity_manager/_kill


# on_interact_function
execute if entity @s[type=minecraft:interaction] if data entity @s interaction if data entity @s data.Eseframe.on_interact_function run function eseframe:entity_manager/_on_interact_function with entity @s data.Eseframe