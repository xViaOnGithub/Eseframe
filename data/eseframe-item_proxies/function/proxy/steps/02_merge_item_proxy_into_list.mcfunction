# Merge instead of append to prevent duplicate entires
$data merge storage eseframe-item_proxies:_cache {proxies_found:[{id:"$(id)",addon:"$(addon)"}]}