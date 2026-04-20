>[!todo] #todo This page is unfinished.

#todo intro

#todo quick recommendation in a callout suggesting they use an IDE 

# Creating the datapack

## Setting up the folders

>[!note] note for wiki authors
>jsust include directories relevant to this tutorial; the next tutorials will add relevant directories as they go. unless it's a directory that will be used alot, like content/item
>#todo path convention callout for "content"

#todo maybe this could a list of instructions, with an Example type callout having the final directory structure?? the steps would start with a fresh datapack from `/datapack create ...`

- pack.mcmeta
- data/
	- ==\<your namespace>==
		- function
			- content
				- item
				- recipe
				- recipe_tag
		- loot_table
			- eseframe_api
				- recipe
		- tags
			- function
				- eseframe_api
					- item
	- eseframe_api
		- tags
			- function
				- registry


## Picking a namespace

#todo callout with something like "this prob goes without saying, but DO NOT call it eseframe, eseframe_api, or minecraft, or that will probably break something!"

#todo tips on choosing a unique itentifier to represend their project

# creating files
#todo quick note on file extensions and how ur computer might not show them bc settings

	- function tags, just blank ones for now


# next step
now yuor'e ready tpo [[Core Tutorials/Adding features to your custom item|create your first custom item]]1!

#todo next tutorial callout