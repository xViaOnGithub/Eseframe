# Only allow during function tag #eseframe_api-v1:include
execute unless data storage eseframe:cache initialize.include.Allowed run return run say [Eseframe API] Error! Function `eseframe_api-v1:include` is only allowed during function tag `#eseframe_api-v1:include`!


# Add the namespace to a list of addons
$data modify storage eseframe:cache initialize.include.Addons append value {namespace:"$(addon)"}