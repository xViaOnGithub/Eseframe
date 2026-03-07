## RESULT
# esephor:fish_jerky    x1

## INGREDIENTS
# minecraft:cooked_cod  x1
# esephor:salt          x1

data modify storage eseframe:recipes recipes append value {id:"esephor:fish_jerky",ingredients:[{item_predicate:"minecraft:cooked_cod",count:1},{item_predicate:'*[minecraft:custom_data~{esephor:{id:"salt"}}]',count:1}],results:{loot:"esephor:recipe/fish_jerky"}}