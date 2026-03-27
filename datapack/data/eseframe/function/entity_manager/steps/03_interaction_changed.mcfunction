# AS an interaction entity

# Return fail if "interaction" was not set yet or was deleted.
execute unless data entity @s interaction run return fail

# Returns the output of trying to copy "interaction" to another path. 
# When ran every tick, this should detect if "interaction" was created or changed without deleting it.
return run data modify entity @s data.Eseframe.last_interaction set from entity @s interaction