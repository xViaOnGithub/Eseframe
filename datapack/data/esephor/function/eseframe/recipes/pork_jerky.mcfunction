## RESULT
# esephor:pork_jerky        x1

## INGREDIENTS
# minecraft:cooked_porkchop x1
# esephor:salt              x1

data modify storage eseframe:recipes recipes append value {id:"esephor:pork_jerky",ingredients:[{item_predicate:"minecraft:cooked_porkchop",count:1},{item_predicate:'*[minecraft:custom_data~{esephor:{id:"salt"}}]',count:1}],results:{loot:"esephor:recipe/pork_jerky"}}