# Ran WITH each ingredient of type custom_item

# Fill in the ID, Namespace, and Count of the custom item to create the item predicate
$data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate set value '*[minecraft:custom_data~{eseframe:{id:"$(id)",namespace:"$(namespace)"}},minecraft:count~{min:$(count)}]'

# Item test (for regular predicates)
$data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_test set value {count:{min:$(count)},predicates:{"minecraft:custom_data":{eseframe:{id:"$(id)",namespace:"$(namespace)"}}}}