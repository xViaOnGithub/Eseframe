$say 05: clearing ingredient index $(ingredient_index)
# Set ingredient fail flag back to 0b if predicate loads and succeeds
$function esefy:internal/custom_recipes/perform/entity/steps/06_clear_with_ingredient_data with storage esefy:recipes recipes[{id:"$(id)"}].ingredients[$(ingredient_index)]