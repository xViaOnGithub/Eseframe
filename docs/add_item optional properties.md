>[!todo] #todo This page is unfinished
>it will be a list of all optional parameters that can be included in the `properties` key of function `eseframe_api:add_item`

all item properties are optional
if you are not using any item properties, just key the properties key to a blank compound (`{}`)

## `override_template_item`

**Type:** string

A namespaced item ID. Overrides what item this custom item's components are applied onto. The default is to use a dummy item, created by removing default components from a `minecraft:command_block`.

>[!example]- Example
>**Example:** `override_template_item:"minecraft:iron_pickaxe"`

>[!warning] 
==**It is strongly recommended you do not use this unless it is absolutely required for the item to function as intended.**==
>
In most cases, this would be if you need an item to be seen as an existing item id by vanilla and other mods/datapacks, which is usually unfavorable because it allows the item to be used in ways it was not intended for, potentially enabling exploits **including using your item in crafting recipes it is not supposed to work in.**
>
>If that is not the intended behavior of your item, it is much better to use data components to add the functionality you are looking for--you'd be surprised at how much they can do!
