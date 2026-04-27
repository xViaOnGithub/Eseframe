# Generate a list of each ingredient as an item predicate 
$function eseframe:registry/recipe/process/generate_item_predicates/run with storage eseframe:registry recipe[$(index)]
return 1