> **There is a tutorial available for this command!** [[Core Tutorial - Adding a new recipe]]
# `eseframe:add_recipe`
##### Registers a new recipe to Eseframe.
#api_function
## Description
#todo 
\[...it is recommended to run this on reload by adding a function in ur namespace with it to LOAD RECIPES TAG HERE]
## [Macros](https://minecraft.wiki/w/Function_(Java_Edition)#Macros)

| key         | type   | description                                                                          | example                                       |
| ----------- | ------ | ------------------------------------------------------------------------------------ | --------------------------------------------- |
| id          | string | A unique identifier for the recipe within the namespace.                             | "cool_sword"                                  |
| namespace   | string | The namespace of the core adding the recipe                                          | "my_core"                                     |
| ingredients | list   | A list containing at least one compound, each following the [[custom recipe format]] | \[{item_predicate:"minecraft:apple",count:2}] |
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