# Merge instead of append to prevent duplicate entires
$data merge storage eseframe:cache {tick:{content:{item:{proxy:{proxies_found:[{id:"$(id)",namespace:"$(namespace)"}]}}}}}