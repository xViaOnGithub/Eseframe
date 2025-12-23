# This function is intended to be called as and at a player
# It shows a particle outline of the chunk border

# TODO/NOTE: If this feautre is added to another tool, DO NOT COPY/PASTE THIS!! Instead, move it to a
# new location and have both items call that instead.

say a
# Get the chunk coordinates
function esefy:util/chunk_coords
# Shows particles at the chunk borders, aligned with eye level
execute anchored eyes positioned ^ ^ ^ run function esefy:internal/consumable_use_detection/items/surveyor/steps/01_show_particles with storage esefy:utils chunk_coords