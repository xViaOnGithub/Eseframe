# Ran WITH each ingredient

$data modify storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.IngredientItemPredicatesForClear append value '*[minecraft:custom_data~{eseframe:{id:"$(id)",namespace:"$(namespace)"}}] $(count)'