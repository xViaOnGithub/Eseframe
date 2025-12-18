# So apperently I can't store custom data inside a marker. That sucks.
# I'm thinking maybe I could use the UUID of a marker as a key to a value in storage,
# but I am concerned about creating storage memory leaks when a marker is deleted improperly.

# I'm going to use the function esefy:generic/uuid/get_uuid_as_a_string to use the
# marker's UUID as a key in the storage esefy:marker_data. This can store stuff like
# what kind of machine it is and machine metadata. It could also be used for other
# things like GEO-Miner resour.... Wait no, actually I'm gonna make that it's own
# tag and storage so it can be cleared independently.

# I'll then have a function loop that goes through them all round-robin as a cleanup/garbage collector