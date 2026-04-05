# $(list_path) example:
#   Yes: "storage eseframe:cache tick.path.list" "entity @s Inventory"
#   No: "storage eseframe:cache tick.path.list[]" "entity @s Inventory[]"

$execute store result score #math eseframe.util.get_list_highest_index if data $(list_path)[]
return run scoreboard players remove #math eseframe.util.get_list_highest_index 1