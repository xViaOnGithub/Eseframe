# Clean up leftover storage
data remove storage esefy:util loop

# Create/reset scoreboard
scoreboard objectives add esefy.util.loop dummy
scoreboard players reset * esefy.util.loop