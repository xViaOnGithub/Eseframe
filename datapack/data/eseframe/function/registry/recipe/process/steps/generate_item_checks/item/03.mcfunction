## ITEM PREDICATE

# Add predicate to item predicate
$data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value '$(id)~$(value)'

# Add a comma as a separate entry to item predicate so the last comma can be deleted individually
data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_predicate append value ","


## ITEM TEST

# Add predicate to predicates list
$data modify storage eseframe:cache tick.registry.recipe.process.Step02.generated.item_test.predicates.$(id) set value $(value)