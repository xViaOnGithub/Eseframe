# Clean up leftover storage
data remove storage eseframe:util list_loop

# Create/reset scoreboard
scoreboard objectives add eseframe.util.list_loop dummy
scoreboard players reset * eseframe.util.list_loop