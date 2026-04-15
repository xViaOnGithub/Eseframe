> **There is a tutorial available for this command!** [[Core Tutorial - Making a new custom item]]
# `eseframe_api:add_item`
##### Registers a new item to Eseframe.
#api_function
## Description
This function can be used to add new items to the game through Eseframe. It works by storing [item data components](https://minecraft.wiki/w/Data_component_format) in a registry, which is then applied to a "dummy item" to create the item as needed.

**Note:** Certain default components, including but not limited to `minecraft:item_name`, `minecraft:item_model`, and `minecraft:max_stack_size` are intentionally removed from the dummy item. ==It is recommended you manually set every component you plan to use, even if it's value matches a default.==

Like similar registry functions, is best practice to invoke this during function tag `#eseframe_api:registry/add`. 
## [Macros](https://minecraft.wiki/w/Function_(Java_Edition)#Macros)

| key        | type     | description                                                                      | example                                                                                           |
| ---------- | -------- | -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| id         | string   | A unique identifier for the item within the namespace.                           | "cool_ingot"                                                                                      |
| namespace  | string   | The namespace of the core adding the item                                        | "my_core"                                                                                         |
| components | compound | See https://minecraft.wiki/w/Data_component_format#Item_format for reference...  | {"minecraft:max_stack_size":3,"minecraft:item_model":"minecraft:stick","!minecraft:item_name":{}} |
| properties | compound | A compound that holds optional metadata about the item. See [[Item Properties]]. | {override_template_item:"minecraft:iron_pickaxe"}                                                 |
### Structure
- id *string*
- namespace *string*
- components *compound*:
	- ==See https://minecraft.wiki/w/Data_component_format#Item_format for reference...==

## Return Codes
(none) #datapack-todo
## See also:
[[give]]