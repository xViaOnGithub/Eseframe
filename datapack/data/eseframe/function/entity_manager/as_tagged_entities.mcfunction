# Runs AS and AT every entity with the Eseframe tag

## Conditions

# Return and kill if Eseframe data is missing
execute unless data entity @s {data:{eseframe:{requirements:[{}]}}} run say structure missing
execute unless data entity @s {data:{eseframe:{requirements:[{}]}}} run return run kill

# Return and kill if any requirements fail
## TODO: Make requirements into it's own system
execute unless function eseframe:entity_manager/steps/01_test_all_requirements run return run kill

## Features

# Run functions for on attack/interact added using the API, if this is a minecraft:interaction entity.
execute if entity @s[type=interaction] if function eseframe:entity_manager/steps/03_interaction_changed run function #eseframe:entity_manager/on_interaction_interact with entity @s
execute if entity @s[type=interaction] if function eseframe:entity_manager/steps/04_attack_changed run function #eseframe:entity_manager/on_interaction_attack with entity @s