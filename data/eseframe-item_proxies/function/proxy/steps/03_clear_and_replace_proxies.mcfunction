$data modify storage eseframe-item_proxies:_cache loot_macro set value {id:"$(id)",namespace:"$(addon)"}
$execute store result storage eseframe-item_proxies:_cache loot_macro.count int 1 run clear @s *[minecraft:custom_data~{eseframe_api-v1:{item_proxy:{id:"$(id)",addon:"$(addon)"}}}]

function eseframe-item_loot_table_generator:run with storage eseframe-item_proxies:_cache loot_macro
function eseframe-item_proxies:proxy/steps/04_give with storage eseframe-item_loot_table_generator:output