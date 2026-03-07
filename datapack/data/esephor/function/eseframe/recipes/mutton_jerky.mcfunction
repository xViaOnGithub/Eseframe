## RESULT
# esephor:mutton_jerky      x1

## INGREDIENTS
# minecraft:cooked_mutton   x1
# esephor:salt              x1

data modify storage eseframe:recipes recipes append value {id:"esephor:mutton_jerky",ingredients:[{item_predicate:"minecraft:cooked_mutton",count:1},{item_predicate:'*[minecraft:custom_data~{esephor:{id:"salt"}}]',count:1}],results:{loot:"esephor:recipe/mutton_jerky"}}