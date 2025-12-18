# This function can be called by an entity, and it will fill the storage esefy:uuid with 5 strings,
# the four parts of the UUID called "uuid0-3", and then a combined string called "uuid_full". 


# Store the four parts of this entity's UUID as strings
data modify storage esefy:uuid uuid0 set string entity @s UUID[0]
data modify storage esefy:uuid uuid1 set string entity @s UUID[1]
data modify storage esefy:uuid uuid2 set string entity @s UUID[2]
data modify storage esefy:uuid uuid3 set string entity @s UUID[3]

# Combine those strings into one string called "uuid_full"
function esefy:internal/get_uuid_as_a_string/steps/01_combine_uuid_parts_into_string with storage esefy:uuid
say 0