# Add component
$data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value '$(id)=$(value)'

# Add a comma as a separate entry so the last comma can be deleted individually
data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value ","