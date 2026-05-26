$data modify storage eseframe:cache tick.registry.item.proxy.step03.give_macro set value {id:"$(id)",namespace:"$(namespace)"}
$execute store result storage eseframe:cache tick.registry.item.proxy.step03.give_macro.count int 1 run clear @s *[minecraft:custom_data~{eseframe_api:{item_proxy:{id:"$(id)",namespace:"$(namespace)"}}}]

function eseframe:registry/item/give/run with storage eseframe:cache tick.registry.item.proxy.step03.give_macro