## RESULT
# esephor:monster_jerky     x1

## INGREDIENTS
# minecraft:rotten_flesh    x1
# esephor:salt              x1

data modify storage eseframe:recipes recipes append value {id:"esephor:monster_jerky",ingredients:[{item_predicate:"minecraft:rotten_flesh",count:1},{item_predicate:'*[minecraft:custom_data~{esephor:{id:"salt"}}]',count:1}],results:{loot:"esephor:recipe/monster_jerky"}}