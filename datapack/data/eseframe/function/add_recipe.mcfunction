#/function eseframe:add_recipe {id:"id",namespace:"namespace",ingredients:[{item_predicate:"*",count:1}]}
$say full id: "$(namespace):$(id)"
$say loot table location: $(namespace):eseframe/recipe/$(id)
$data modify storage eseframe:content recipe append value {id:"$(id)",namespace:"$(namespace)",ingredients:$(ingredients)}