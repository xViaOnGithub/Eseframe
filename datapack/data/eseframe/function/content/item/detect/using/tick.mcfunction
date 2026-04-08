# Remove the PressDebounce tag from all players
tag @a remove eseframe.content.item.detect.using.PressDebounce

# Give the PressDebounce tag to every player that has tag UsedThisTickUsedThisTick
tag @a[tag=eseframe.content.item.detect.using.UsedThisTick] add eseframe.content.item.detect.using.PressDebounce

# Remove the UsedThisTick tag from all players
tag @a remove eseframe.content.item.detect.using.UsedThisTick