>[!todo] #todo This page is unfinished.
> >[!warning]
> >#todo add a warning that Eseframe is NOT portable and including Eseframe in their datapack—while allowed by the #repo-todo license—may cause issues bc multiple versions of eseframe from different packs

>[!todo] #todo before page is ready
> - [ ] all steps
> - [ ] intro
> - [ ] outro, with link to next tutorial.
> - [ ] images for each step

# #todo title

#todo intro

#todo quick recommendation in a callout suggesting they use an IDE 

#todo "an #repo-todo example Core can be found at…" put that in a callout and on


>[!note] note for wiki authors
>jsust include directories relevant to this tutorial; the next tutorials will add relevant directories as they go. unless it's a directory that will be used alot, like content/item
>#todo path convention callout for "content"

## Creating a new datapack for your Core

#todo maybe this could a list of instructions, with an Example type callout having the final directory structure?? the steps would start with a fresh datapack from `/datapack create ...`

- Create a new datapack with `/datapack create "<datapack name>" "<a short description>"` #todo tips on what to call it and the description


For these tutorials, we will be naming the datapack My_Eseframe_Core.==#todo THIS COMMAND DOES NOT WORK, SEE [mc wiki](https://minecraft.wiki/w/Commands/datapack#Syntax)== and include info on how to name it (like no spaces or underscores or ?????)
#todo just checked, seems like it follows the same naming criteria as namespaces (no spaces or )
```
/datapack create my_core "An example Core for Eseframe API tutorials"
```

## Opening your new Core's datapack

1. Go back to the world menu, and click on the world you just created a datapack in. Don't click the play button—you need to select the world, not play it.
	![[Pasted image 20260420212245.jpg]]

2. Click the "Edit" button at the bottom on the screen.
	![[Screenshot_20260420_212845_Amethyst.jpg]]

3. Click "Open World Folder". This will open your world in your device's file manager.
	![[Pasted image 20260420213951.jpg]]

4. Open the folder called `datapacks`.
	![[Screenshot_20260420_215117_Files.jpg]]

5. Open the folder with the same name you typed in the `/datapack create…` command.
	![[Screenshot_20260421_112611_Files.jpg]]

**You are now inside of your datapack's folder.** In this folder are two items:
-  `data`, an empty folder that will soon hold your custom content.
- `pack.mcmeta`, a file that contains your datapack's description and version. It can be opened with any normal text editor (like Notepad), but the description does need to have quotation marks around it.

## creating the folders #todo rename

In your new datapack's folder, open the `data` folder. It will most likely be empty inside.

![[Screenshot_20260421_113814_Files.jpg]]

### Eseframe API's files

1. Inside the `data` folder, create and open a new folder called `eseframe_api`.
	![[Screenshot_20260421_191118_Files.jpg]]

2. Inside the `eseframe_api` folder, create and open a new folder called `tags`.
	

3. Inside the `tags` folder, create and open a new folder called `function`.
	

4. Inside the `function` folder, create and open a new folder called `registry`.
	

5. Inside the `registry` folder, create a new text file, and then change it to a JSON file by renaming it to `add.json`
> [!note]- How to change a file's type
> #todo Add an explanation of what file extensions are, how some file managers do not show file extensions and why, and general steps on how to turn that on that can apply to most file managers

 6. Open `add.json` and paste the following into it, and then save the file:
	```
	{
	    replace: false,
	    values: [
	        
	    ]
	}
	```

### Your Namespace

#todo what a namespace is, and that you should use the same name as you did in the datapack create command






>[!example]- Final folder structure
> - pack.mcmeta
>- data/
>	- eseframe_api
>		- tags
>			- function
>				- registry
>    - ==\<your namespace>==
>		- function
>			- content
>				- item
>				- recipe
>				- recipe_tag
>		- loot_table
>			- eseframe_api
>				- recipe
>		- tags
>			- function
>				- eseframe_api
>					- item



## Picking a namespace

#todo callout with something like "this prob goes without saying, but DO NOT call it eseframe, eseframe_api, or minecraft, or that will probably break something!"

#todo tips on choosing a unique itentifier to represend their project

- - -

#todo congradionz, u haz made the outline of ur core and r redī 2 add recipes n stufff

# next step
now yuor'e ready tpo [[Core Tutorials/Adding features to your custom item|create your first custom item]]1!

#todo next tutorial callout