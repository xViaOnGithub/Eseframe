# Add predicate
$data modify storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.Step01.GeneratedItemPredicate append value '$(id)~$(value)'

# Add a comma as a separate entry so the last comma can be deleted individually
data modify storage eseframe:cache tick.registry.recipe.process.generate_item_predicate.Step01.GeneratedItemPredicate append value ","