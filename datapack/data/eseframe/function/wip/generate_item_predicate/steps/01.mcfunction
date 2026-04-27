# this will be ran with each item in a recipe, and the index key is passed here

## THIS IS RAN WITH EVERY ITEM IN THE RECIPE (todo when type is added: after "|"" = optional)
# example item:        {type:"item",count:1,  |  item:"minecraft:stone",components:[{id:"",value:''}],predicates:[{id:"",value:''}]}
#todo example custom item: {type:"custom item",id:"",namespace:"",count:1}

# just focus on item for now and ignore type

# to get this ingredient's optional fields: `storage minecraft:test ingredients[$(index)]`



# Clear leftover data
data remove storage test item_predicate


## Item Type/Tag

# Set item to wildcard (any item) 
data modify storage test item_predicate append value "*"

# If the ingredient specifies an item, replace the wildcard with the item
$execute if data storage minecraft:test ingredients[$(index)].item run data modify storage test item_predicate[0] set from storage minecraft:test ingredients[$(index)].item


## if components or predicates

# Opening bracket for component checks
data modify storage test item_predicate append value "["

## TODO: this is a bandage fix for skipping the bracket section entirely if there are no components or predicates
# This blank string will be deleted instead of a comma if no component checks are appended 
data modify storage test item_predicate append value ""

# todo skip if no components
# add all components to item predicate
$function eseframe:util/list_loop/run {pass_index:false,list_path:"storage minecraft:test ingredients[$(index)].components",function:"eseframe:wip/generate_item_predicate/steps/02"}

# todo skip if no predicates
# add all predicates to item predicate
$function eseframe:util/list_loop/run {pass_index:false,list_path:"storage minecraft:test ingredients[$(index)].predicates",function:"eseframe:wip/generate_item_predicate/steps/03"}

# remove last added item (comma)
# todo: only do this is there were are components or predicates
data remove storage test item_predicate[-1]

# Closing bracket for component checks
data modify storage test item_predicate append value "]"


## Count

# Add a space before the item count
data modify storage test item_predicate append value " "

# Add count (default to 1 if it's missing)
$execute if data storage minecraft:test ingredients[$(index)].count run data modify storage test item_predicate append from storage minecraft:test ingredients[$(index)].count
$execute unless data storage minecraft:test ingredients[$(index)].count run data modify storage test item_predicate append value 1




# Combine strings in list into one item predicate string
function eseframe:util/list_concat/run {list_path:"storage test item_predicate"}
tellraw @a ["item predicate: ",{nbt:"item_predicate",storage:"test"}]

# Add final generated item predicate to a list in the output
data modify storage test output.IngredientItemPredicatesForClear append from storage test item_predicate


return 1