> The entity system is an **internal system**, and is not part of the [[Eseframe API]]. It's innerworkings are subject to change, so please be cautious if you are trying to hook into it directly!

>If you are making your own [[Core]], is recommended to use [[add_block]] instead of directly using the Entity Manager where possible.

The Eseframe Entity Manager is an internal system in Eseframe that used to internally keep track of the entities it spawns, to control what conditions that must exist under, and to control what they do in certain conditions to create new functionality.
## draft stuff
#todo 
explaination of how the input of [[add_block]] is formated and how the Eseframe Entity Manager uses it when [[set_block]] (and similar functions) is called   
## Example of use
### Making a custom block that can be interacted with

| Entity Type            | Purpose                                           | Conditions                                                 | Other custom functionalities                                                                                                                            |
| ---------------------- | ------------------------------------------------- | ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| minecraft:interaction  | Provides a hitbox                                 | Must be in an air block.                                   | Runs kill when attacked; Drops an item when killed; Running a function when interacted with that changes the minecraft:item_display's custom model data |
| minecraft:item_display | Displays a custom model to make the block visible | There must be a minecraft:interaction at the same position | -                                                                                                                                                       |
### Adding a new ore that works as an overlay to stone blocks

| Entity Type            | Purpose                                                                                                                  | Conditions               | Other custom functionalities                                                |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------ | ------------------------ | --------------------------------------------------------------------------- |
| minecraft:item_display | Displays a custom model resembling an ore at a size slightly larger than stone, creating the illusion of a new ore block | Must be in a stone block | Spawns custom items from loot table and runs kill when the stone is removed |
## Data structure of managed entities
- data
	- Eseframe
		- requirements
			==a list of [[Requirement]]s. if any is not met, the entity will be killed.==
			1. ...
		- on_interact_function *string (optional)* ==if present and the entity type is an minecraft:interaction, this function (or function with macro, or function tag) will be called when the entity is interacted with (or "right-clicked")==