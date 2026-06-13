# Since this is invoked by an advancement, it runs AS and AT the player.
# Called when an item with custom data {eseframe_api:{v1:{item_proxy:{}}}} is detected during an inventory change


# Clear leftover data from last time this advancement was called, incase it runs multiple times in one tick
data remove storage eseframe:cache tick.registry.item.proxy.proxies_found


# Get a list of item proxies in player's inventory
data modify storage eseframe:cache tick.registry.item.proxy.loop_macro set value {index:0,function:"eseframe:registry/item/proxy/steps/01_find_all_item_proxies"}
execute store result storage eseframe:cache tick.registry.item.proxy.loop_macro.max_index int 1 run function eseframe:util/get_list_highest_index/run {list_path:"entity @s Inventory"}
function eseframe:util/loop/start with storage eseframe:cache tick.registry.item.proxy.loop_macro

# For each unique item proxy found, clear all of that proxy and give an equal amount of the custom item it points to 
function eseframe:util/list_loop/run {pass_index:false,function:"eseframe:registry/item/proxy/steps/03_clear_and_replace_proxies",list_path:"storage eseframe:cache tick.registry.item.proxy.proxies_found"}


# Revoke the advancement at the end of the function to prevent it from being triggered when this function modifies the inventory.
advancement revoke @s only eseframe:registry/item/proxy/detect