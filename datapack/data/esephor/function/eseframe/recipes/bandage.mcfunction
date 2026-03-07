## RESULT
# esephor:bandage   x4

## INGREDIENTS
# esephor:rag       x2
# minecraft:string  x3

data modify storage eseframe:recipes recipes append value {id:"esephor:bandage",ingredients:[{item_predicate:'*[minecraft:custom_data~{esephor:{id:"rag"}}]',count:2},{item_predicate:'minecraft:string',count:1}],results:{loot:"esephor:recipe/bandage"}}
say a