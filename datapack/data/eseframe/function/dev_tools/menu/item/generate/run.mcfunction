# Generates a dialog with a "give" button for every registered item, in order.
# This function should be ran on reload, after all registry has been registered.

## Outputs a formatted dialog to storage eseframe:cache session.dev_tools.menu.item.generate.dialog

# Mainly for testing, to see quickly see/obtain all registered custom items;
# It might need some tweaks and refactoring before it can be adapted for player use.
# `eseframe:cache` is probably not the right storage path for something like this.
# Perhaps generated dialogs could use something like `eseframe:generated dialog`?

# Also, this directory could use a better name. "dev_tools/item_menu"?

# RETURN CODES:
#   - 0: no registered items were found, created blank menu with message
#   - 1: dialog generated successfully


# If there are no registered items, create a blank dialog and return 
data modify storage eseframe:cache session.dev_tools.menu.item.generate.dialog set value {type:"minecraft:notice",body:[{type:"minecraft:plain_message",contents:"* But nobody came."}],title:"Eseframe Registered Items (Dev Menu)"}
execute unless data storage eseframe:registry item[] run return 0

# Create the menu
data modify storage eseframe:cache session.dev_tools.menu.item.generate.dialog set value {type:"minecraft:multi_action",inputs:[{type:"minecraft:number_range",key:"count",label:{text:"Item Count"},start:1,end:64,step:1,initial:1,width:300}],can_close_with_escape:1,title:"Eseframe Registered Items (Dev Menu)",actions:[],exit_action:{label:{translate:"gui.back"}}}

# Add a button to the menu for each registered item
function eseframe:util/list_loop/run {pass_index:false,function:"eseframe:dev_tools/menu/item/generate/steps/01_prepare_macro",list_path:"storage eseframe:registry item"}

return 1