# Clean up leftover storage
data remove storage esefy:util list_loop

# Create/reset scoreboard
scoreboard objectives add esefy.util.list_loop dummy
scoreboard players reset * esefy.util.list_loop