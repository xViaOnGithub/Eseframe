# Merge instead of append to prevent duplicate entires
$data merge storage eseframe:cache {tick:{registry:{item:{proxy:{proxies_found:[{id:"$(id)",addon:"$(addon)"}]}}}}}