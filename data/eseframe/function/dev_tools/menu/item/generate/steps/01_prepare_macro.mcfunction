$data modify storage eseframe:cache session.dev_tools.menu.item.generate.01.macro set value {id:"$(id)",namespace:"$(namespace)"}
data modify storage eseframe:cache session.dev_tools.menu.item.generate.01.macro.stringified_dialog_macro set value "$(count)"

function eseframe:dev_tools/menu/item/generate/steps/02_add_give_item_button with storage eseframe:cache session.dev_tools.menu.item.generate.01.macro
return 1