$data modify storage eseframe:cache session.generate_menus.01.macro set value {id:"$(id)",namespace:"$(namespace)"}
data modify storage eseframe:cache session.generate_menus.01.macro.stringified_dialog_macro set value "$(count)"

function eseframe:generate_menus/02_add_give_item_button with storage eseframe:cache session.generate_menus.01.macro
return 1