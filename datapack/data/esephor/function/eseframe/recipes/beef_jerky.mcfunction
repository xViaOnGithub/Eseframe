## RESULT
# esephor:beef_jerky    x1

## INGREDIENTS
# minecraft:cooked_beef x1
# esephor:salt          x1

data modify storage eseframe:recipes recipes append value {id:"esephor:beef_jerky",ingredients:[{item_predicate:"minecraft:cooked_beef",count:1},{item_predicate:'*[minecraft:custom_data~{esephor:{id:"salt"}}]',count:1}],results:{loot:"esephor:recipe/beef_jerky"}}