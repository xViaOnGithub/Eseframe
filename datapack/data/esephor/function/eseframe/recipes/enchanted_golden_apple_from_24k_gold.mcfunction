## RESULT
# minecraft:enchanted_golden_apple  x1

## INGREDIENTS
# esephor:gold_block_24k            x8
# minecraft:apple                   x1

data modify storage eseframe:recipes recipes append value {id:"esephor:enchanted_golden_apple_from_24k_gold",ingredients:[{item_predicate:'*[minecraft:custom_data~{esephor:{id:"gold_block_24k"}}]',count:8},{item_predicate:"minecraft:apple",count:1}],results:{loot:"esephor:recipe/enchanted_golden_apple_from_24k_gold"}}