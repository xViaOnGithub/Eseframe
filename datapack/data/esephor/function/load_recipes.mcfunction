## USEFUL ITEMS

# Rag
data modify storage esefy:recipes recipes append value {id:"esephor:rag",ingredients:[{item_predicate:'*[minecraft:custom_data~{esephor:{id:"cloth"}}]',count:6},{item_predicate:'minecraft:string',count:2}],results:{loot:"esephor:recipe/rag"}}

# Bandage
data modify storage esefy:recipes recipes append value {id:"esephor:bandage",ingredients:[{item_predicate:'*[minecraft:custom_data~{esephor:{id:"rag"}}]',count:2},{item_predicate:'minecraft:string',count:1}],results:{loot:"esephor:recipe/bandage"}}

# Splint
data modify storage esefy:recipes recipes append value {id:"esephor:splint",ingredients:[{item_predicate:"minecraft:iron_ingot",count:2},{item_predicate:"minecraft:stick",count:3}],results:{loot:"esephor:recipe/splint"}}



## MISCELLANEOUS ITEMS

# Cloth
data modify storage esefy:recipes recipes append value {id:"esephor:cloth",ingredients:[{item_predicate:"#minecraft:wool",count:1}],results:{loot:"esephor:recipe/cloth"}}