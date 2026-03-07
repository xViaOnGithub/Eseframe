## RESULT
# esephor:cobalt_pickaxe    x1

## INGREDIENTS
# esephor:cobalt_ingot  x3
# esephor:nickel_ingot  x2

data modify storage eseframe:recipes recipes append value {id:"esephor:cobalt_pickaxe",ingredients:[{item_predicate:'*[minecraft:custom_data~{esephor:{id:"cobalt_ingot"}}]',count:3},{item_predicate:'*[minecraft:custom_data~{esephor:{id:"nickel_ingot"}}]',count:2}],results:{loot:"esephor:recipe/cobalt_pickaxe"}}