## RESULT
# esephor:rabbit_jerky      x1

## INGREDIENTS
# minecraft:cooked_rabbit   x1
# esephor:salt              x1

data modify storage eseframe:recipes recipes append value {id:"esephor:rabbit_jerky",ingredients:[{item_predicate:"minecraft:cooked_rabbit",count:1},{item_predicate:'*[minecraft:custom_data~{esephor:{id:"salt"}}]',count:1}],results:{loot:"esephor:recipe/rabbit_jerky"}}