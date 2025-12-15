# Create (and reset) a scoreboard to track how long the player has been sprinting for
scoreboard objectives add test_sprint dummy
scoreboard players reset * test_sprint
say talisman load