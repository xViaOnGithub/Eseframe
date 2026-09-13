# Since this is invoked by an advancement, it runs AS and AT the player.
# Called when an item with custom data {eseframe_api-v1:{item_proxy:{}}} is detected during an inventory change

# Get a list of item proxies in player's inventory
data modify storage eseframe-item_proxies:_cache loop set value {index:0,function:"eseframe-item_proxies:proxy/steps/01_find_all_item_proxies"}
execute store result storage eseframe-item_proxies:_cache loop.max_index int 1 run function eseframe:util/get_list_highest_index/run {list_path:"entity @s Inventory"}
function eseframe:util/loop/start with storage eseframe-item_proxies:_cache loop

# For each unique item proxy found, clear all of that proxy and give an equal amount of the custom item it points to 
function eseframe:util/list_loop/run {pass_index:false,function:"eseframe-item_proxies:proxy/steps/03_clear_and_replace_proxies",list_path:"storage eseframe-item_proxies:_cache proxies_found"}


## Cleanup

# Revoke the advancement at the end of the function to prevent it from being triggered when this function modifies the inventory.
advancement revoke @s only eseframe-item_proxies:detect

# Clear temporary storage paths
data remove storage eseframe-item_proxies:_cache loop
data remove storage eseframe-item_proxies:_cache proxies_found
data remove storage eseframe-item_proxies:_cache loot_macro