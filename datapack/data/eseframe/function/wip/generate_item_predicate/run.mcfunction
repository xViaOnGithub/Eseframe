# Loop with a list of items formatted like this:

# TODO: Type          required    string      "item"
# Components    optional    compound
#   ID            required    string
#   Value_string         required    number or string (compounds or lists must be in a string)
# Predicates    optional    compound
#   ID            required    string
#   Value_string         required    number or string (compounds or lists must be in a string)
# Item          optional    string
# Count         required    int >0

## TODO:
# Type          required    string      "custom_item"
# ID            required    string
# Namespace     required    string
# Count         required    int >0


# Delete leftover data
data remove storage test output

# Copy the recipe's ingredients
$data modify storage minecraft:test ingredients set value $(ingredients)
#data modify storage minecraft:test ingredients set value [{item:"minecraft:stone",predicates:[{id:"draft:draft",value:'["",{"text":"Extra saturating!","color":"white","italic":false}]'}],components:[{id:"draft:draft",value:1},{id:"draft:draft",value:'{key:"WATCH OUT ITS A STRING"}'}]},{count:32,components:[{id:"draft:draft",value:3},{id:"draft:draft",value:4}]}]

# Loop through each ingredient, generating an item predicate and outputing it to storage minecraft:test output.IngredientItemPredicatesForClear
function eseframe:util/list_loop/run {list_path:"storage minecraft:test ingredients",function:"eseframe:wip/generate_item_predicate/steps/01",pass_index:true}
