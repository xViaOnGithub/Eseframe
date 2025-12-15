# DO NOT USE THIS FUNCTION ON IT'S OWN
# Call for stringify_uuid instead, this is part of it!

# Conbine the four parts into one string 
$data modify storage esefy:uuid uuid_full set value "$(uuid0)_$(uuid1)_$(uuid2)_$(uuid3)"