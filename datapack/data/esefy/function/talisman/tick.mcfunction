# TODO move this talisman to its own folder
# TODEBT we dont need to check if sprint twice, just if players start, and if a player that is sprinting stops sprinting
execute as @a run attribute @s movement_speed modifier remove esefy:talisman/engine/movement_speed
execute as @a if predicate esefy:is_sprinting run scoreboard players add @s test_sprint 1
# FIXME As is, this will not work with mutliple players because this function is currently being ran for each player one line at a time instead of every line one player at a time
# which means whichever player is checked overwrites the data for all players checked before
# hence why I put my username for now
execute as x_Via if predicate esefy:is_sprinting store result storage esefy Test float 0.005 run scoreboard players get x_Via test_sprint
execute as x_Via if predicate esefy:is_sprinting run function esefy:talisman/engine/macro_set_movement_speed with storage esefy

execute as @a unless predicate esefy:is_sprinting run scoreboard players reset @s test_sprint

#execute as @a unless predicate esefy:is_sprinting run scoreboard players set @s test_sprint -200