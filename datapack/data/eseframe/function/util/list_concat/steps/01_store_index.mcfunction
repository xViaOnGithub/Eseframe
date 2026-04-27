# Ran from loop, WITH the loop index

$data modify storage eseframe:cache tick.util.list_concat.Index set value $(index)
function eseframe:util/list_concat/steps/02_get_list_entry with storage eseframe:cache tick.util.list_concat

# Continue the loop
return 1