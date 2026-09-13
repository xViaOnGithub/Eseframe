# Remove the PressDebounce tag from all players
tag @a remove eseframe-item_callbacks.PressDebounce

# Give the PressDebounce tag to every player that has tag UsedThisTickUsedThisTick
tag @a[tag=eseframe-item_callbacks.PressDebounce] add eseframe-item_callbacks.PressDebounce

# Remove the UsedThisTick tag from all players
tag @a remove eseframe-item_callbacks.PressDebounce