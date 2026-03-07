## RESULT
# esephor:diet_cookie   x1

## INGREDIENTS
# minecraft:cookie      x1
# esephor:elytra_scale  x1

data modify storage eseframe:recipes recipes append value {id:"esephor:diet_cookie",ingredients:[{item_predicate:"minecraft:cookie",count:1},{item_predicate:'*[minecraft:custom_data~{esephor:{id:"elytra_scale"}}]',count:1}],results:{loot:"esephor:recipe/diet_cookie"}}