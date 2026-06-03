# Fail if no addons
execute unless data storage eseframe:cache initialize.include.Addons run return fail

# Send every addon namespace in chat
function eseframe:util/list_loop/run {function:"eseframe:initialize/include/list_addons/steps/01_say_addon_name",list_path:"storage eseframe:cache initialize.include.Addons",pass_index:false}