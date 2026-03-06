## USEFUL ITEMS

# Rag
data modify storage esefy:recipes recipes append value {id:"esephor:rag",ingredients:[{item_predicate:'*[minecraft:custom_data~{esephor:{id:"cloth"}}]',count:6},{item_predicate:'minecraft:string',count:2}],results:{loot:"esephor:recipe/rag"}}

# Bandage
data modify storage esefy:recipes recipes append value {id:"esephor:bandage",ingredients:[{item_predicate:'*[minecraft:custom_data~{esephor:{id:"rag"}}]',count:2},{item_predicate:'minecraft:string',count:1}],results:{loot:"esephor:recipe/bandage"}}

# Splint
data modify storage esefy:recipes recipes append value {id:"esephor:splint",ingredients:[{item_predicate:"minecraft:iron_ingot",count:2},{item_predicate:"minecraft:stick",count:3}],results:{loot:"esephor:recipe/splint"}}


## TOOLS

# Gold Pan
data modify storage esefy:recipes recipes append value {id:"esephor:gold_pan",ingredients:[{item_predicate:"minecraft:bowl",count:1},{item_predicate:"minecraft:stone",count:5}],results:{loot:"esephor:recipe/gold_pan"}}

# Cobalt Pickaxe
data modify storage esefy:recipes recipes append value {id:"esephor:cobalt_pickaxe",ingredients:[{item_predicate:'*[minecraft:custom_data~{esephor:{id:"cobalt_ingot"}}]',count:3},{item_predicate:'*[minecraft:custom_data~{esephor:{id:"nickel_ingot"}}]',count:2}],results:{loot:"esephor:recipe/cobalt_pickaxe"}}


## RESOURCES

# Nickel Ingot
data modify storage esefy:recipes recipes append value {id:"esephor:nickel_ingot",ingredients:[{item_predicate:'*[minecraft:custom_data~{esephor:{id:"iron_dust"}}]',count:1},{item_predicate:"minecraft:iron_ingot",count:1},{item_predicate:'*[minecraft:custom_data~{esephor:{id:"copper_dust"}}]',count:1}],results:{loot:"esephor:recipe/nickel_ingot"}}

# Cobalt Ingot
data modify storage esefy:recipes recipes append value {id:"esephor:cobalt_ingot",ingredients:[{item_predicate:'*[minecraft:custom_data~{esephor:{id:"iron_dust"}}]',count:1},{item_predicate:'*[minecraft:custom_data~{esephor:{id:"copper_dust"}}]',count:1},{item_predicate:'*[minecraft:custom_data~{esephor:{id:"nickel_ingot"}}]',count:1}],results:{loot:"esephor:recipe/cobalt_ingot"}}


## MISCELLANEOUS ITEMS

# Cloth
data modify storage esefy:recipes recipes append value {id:"esephor:cloth",ingredients:[{item_predicate:"#minecraft:wool",count:1}],results:{loot:"esephor:recipe/cloth"}}