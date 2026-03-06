## RESULT
# esephor:nickel_ingot  x1

## INGREDIENTS
# esephor:iron_dust     x1
# minecraft:iron_ingot  x1
# esephor:copper_dust   x1

data modify storage esefy:recipes recipes append value {id:"esephor:nickel_ingot",ingredients:[{item_predicate:'*[minecraft:custom_data~{esephor:{id:"iron_dust"}}]',count:1},{item_predicate:"minecraft:iron_ingot",count:1},{item_predicate:'*[minecraft:custom_data~{esephor:{id:"copper_dust"}}]',count:1}],results:{loot:"esephor:recipe/nickel_ingot"}}