# Add component
$data modify storage test item_predicate append value '$(id)=$(value)'

# Add a comma as a separate entry so the last comma can be deleted individually
data modify storage test item_predicate append value ","