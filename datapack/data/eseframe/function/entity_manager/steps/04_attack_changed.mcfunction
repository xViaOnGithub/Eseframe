# AS an interaction entity

# Return fail if "attack" was not set yet or was deleted.
execute unless data entity @s attack run return fail

# Returns the output of trying to copy "attack" to another path. 
# When ran every tick, this should detect if "attack" was created or changed without deleting it.
return run data modify entity @s data.eseframe.last_attack set from entity @s attack