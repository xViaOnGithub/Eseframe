> [!info] **There is a tutorial available for this function!** [[tutorials/Adding a new recipe]]
# `eseframe_api:add_recipe`
##### Registers a new item to Eseframe.
#api_function
## Description
#todo
## [Macros](https://minecraft.wiki/w/Function_(Java_Edition)#Macros)

| key         | type   | description                                            | example                                       |
| ----------- | ------ | ------------------------------------------------------ | --------------------------------------------- |
| id          | string | A unique identifier for the item within the namespace. | "cool_ingot"                                  |
| namespace   | string | The namespace of the core adding the item              | "my_core"                                     |
| ingredients | list   | A the [[custom recipe format]]                         | \[{item_predicate:"minecraft:apple",count:2}] |
### Structure
- id *string*
- namespace *string*
- ingredients *list:
	1. *compound*: 
		- [item_predicate](https://minecraft.wiki/w/Argument_types#minecraft:item_predicate) *(string)* ==#todo should this not a link?==
		- count *(integer)*
	2. ...

## Return Codes
(none)
## See also:
#todo