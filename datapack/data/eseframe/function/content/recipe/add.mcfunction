say todo: put check if there is already a recipe of the given namespace and id in function eseframe:content/recipe/add
say or maybe the check should be directly in the api? unsure yet
$data modify storage eseframe:content recipe append value {id:"$(id)",namespace:"$(namespace)",ingredients:$(ingredients)}