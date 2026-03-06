## RESULT
# esephor:rag   x1

## INGREDIENTS
# esephor:cloth     x6
# minecraft:string  x2

data modify storage esefy:recipes recipes append value {id:"esephor:rag",ingredients:[{item_predicate:'*[minecraft:custom_data~{esephor:{id:"cloth"}}]',count:6},{item_predicate:'minecraft:string',count:2}],results:{loot:"esephor:recipe/rag"}}