# Store the amount of slots used by the recipe to compare later
$execute store result score #slots_used_in_recipe esefy.temporary.workstation_crafting if data storage esefy:recipes $(data)[$(index)].input[]

# Attempt to craft the recipe, and pass the return code onto the loop
# A return code of 1 ends the loop early.
$return run function esefy:internal/mechanics/crafting/workstation/attempt/steps/03_attempt_single_recipe with storage esefy:recipes $(data)[$(index)]