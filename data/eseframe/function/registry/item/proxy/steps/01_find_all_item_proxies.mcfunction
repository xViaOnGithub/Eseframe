# Return if this slot's custom data doesn't have custom data eseframe_api-v1.item_proxy 
$execute unless data entity @s Inventory[$(index)].components."minecraft:custom_data".eseframe_api-v1.item_proxy run return 0

$function eseframe:registry/item/proxy/steps/02_merge_item_proxy_into_list with entity @s Inventory[$(index)].components."minecraft:custom_data".eseframe_api-v1.item_proxy