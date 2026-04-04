say todo: put check if there is already an item of the given namespace and id in function eseframe:content/item/add
say or maybe the check should be directly in the api? unsure yet
$data modify storage eseframe:content item append value {id:"$(id)",namespace:"$(namespace)",components:$(components)}