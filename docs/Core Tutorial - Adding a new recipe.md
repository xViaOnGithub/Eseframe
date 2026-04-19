# Tutorial: Adding a New Recipe

>[!note] This tutorial assumes you have already completed [[Core Tutorial - Making a new custom item]]

Cores can add new crafting recipes to Eseframe using the command `function eseframe:add_recipe` . This command is usually called inside a function that runs when your datapack loads.

Here is an example of a completed recipe command:

	function eseframe:add_recipe {id:"cool_sword",namespace:"my_core",ingredients:[{item_predicate:"minecraft:stick",count:1},{item_predicate:"*[minecraft:custom_data~{my_core:{id:'cool_ingot'}}]",count:1}]}

The rest of this tutorial explains how to create everything needed for a recipe step-by-step.

Just like before, we will use a custom item with the ID `cool_sword` with the namespace `my_core` as an example.

## 1. Understanding the Recipe Parameters

### Namespace

`namespace` should match your datapack namespace.

	namespace:"my_core"

### ID

`id` is the recipe's unique identifier within the namespace.

	id:"cool_sword"

Each ID in a specific namespace should be unique; ==#todo elaborate with an example of two identical ids from different namespaces==

#### Choosing an ID

A good convention is to use the same ID as the main item the recipe creates-- In this case, `cool_sword`.

If there are multiple recipes to craft that item, or there are existing recipes for that item in vanilla, consider giving the recipe a more specific name that describles how it is made, like `iron_nugget_from_ore_crusher`.

### Ingredients

`ingredients` is a list of ingredient objects. Each ingredient contains:

- An **[item predicate](https://minecraft.wiki/w/Argument_types#item_predicate)** describing what item is required
- A **count** describing how many are required

Example:

	ingredients:[{item_predicate:"minecraft:stick",count:1},{item_predicate:"*[minecraft:custom_data~{my_core:{id:'cool_ingot'}}]",count:1}]

#### ==move/rewrite "detecting esephor items" here as "detecting custom items"==
---

## 1. Creating the Recipe Loot Table

When performing an Eseframe recipe, Eseframe will use the recipe's ID and namespace to select the loot table that defines what the recipe's result. The loot table must be located at:

	<datapack folder>/data/<your namespace>/loot_table/eseframe/recipe/<recipe id>.json

Example:

	<datapack folder>/data/**my_core**/loot_table/eseframe/recipe/**cool_sword**.json

Fill in the loot table:

	{
		"pools": [
			{
				"rolls": 1,
				"entries": [
					{
						"type": "minecraft:loot_table",
						 "value": "my_core:items/cool_sword"
					} 
				]
			}
		]
	}

A good convention is to have the recipe's loot table be separate from your item's loot table, and to have the recipe's loot table call the item's loot table. If want a recipe to give multiple of a custom item, set `rolls` to the amount of that item you wish to give.

This loot table determines what item(s) the player receives when the recipe is crafted.

---

## 2. Creating the Recipe Function

Next, create a function that registers the recipe with Eseframe. This function must be located at:

	<datapack folder>/data/<your namespace>/function/eseframe/recipe/<recipe id>.mcfunction

Example:

	<datapack folder>/data/**my_core**/function/eseframe/recipe/**cool_sword**.mcfunction

Inside that function, add the recipe command #todo:

	function eseframe:add_recipe

---

## 4. Detecting Esephor Items

> #todo This section should be moved to a sub-section of Understanding Parameters -> Ingredients

Custom Esephor items store their items in their [`minecraft:custom_data` data component](https://minecraft.wiki/w/Data_component_format#custom_data). To detect one of these items, use an item predicate like this:

	*[minecraft:custom_data~{esephor:{id:"salt"}}]

This checks for any item *containing* (does not have to be a strict match-- for that use = instead of ~==#todo that should probably be it's own paragraphs (or maybe just provide the basics for the example and link to miencraft wiki item predicate?)==) the custom data:

	{esephor:{id:"salt"}}

For example, this lets the recipe accept the Esephor item **salt**.

---

## 5. Automatically Loading the Recipe

To ensure your recipe loads automatically, add your function to the Eseframe registry load tag.

The file path is:

	<datapack folder>/data/eseframe/tags/02_load_registry.json

Add your recipe function to the list:

==#todo example of what the tag might look like before and after, with a warning under it that says if you set replace to true other cores will fail to load==

When the datapack loads, Eseframe will run this function and register your recipe.

---

## 6. Testing the Recipe

After installing your datapack:

1. Use the command `/reload`
2. ==#datapack-todo some sort of registry test command==
3. 

---

## Troubleshooting


---
# MISC #todo 
- fix step numbers
- 