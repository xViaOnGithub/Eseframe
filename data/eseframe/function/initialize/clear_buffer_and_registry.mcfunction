# Clear buffer
data remove storage eseframe:buffer item
data remove storage eseframe:buffer recipe
data remove storage eseframe:buffer recipe_tag

# Clear registry
data modify storage eseframe:registry item set value []
data modify storage eseframe:registry recipe set value []
data modify storage eseframe:registry recipe_tag set value []