# Store the result of trying to craft a recipe from the tag
# A return code of 1 means the recipe was crafted
$execute store result storage eseframe:cache tick.registry.recipe_tag.crafting.recipe_id byte 1 run function eseframe:registry/recipe/crafting/attempt {id:"$(id)",namespace:"$(namespace)"}

#$say $(namespace):$(id)

# Return fail if recipe succeeded
# In other words, keep going until a recipe crafts successfully or it runs out of recipes
return run execute unless data storage eseframe:cache {tick:{registry:{recipe_tag:{crafting:{recipe_id:1b}}}}}