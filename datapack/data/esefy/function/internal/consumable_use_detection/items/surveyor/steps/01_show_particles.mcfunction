# Creates particles in a flat square with the corners ~ ~ ~ and ~16 ~ ~16
# Inteneded to be ran at the corner of a chunk to show chunk borders
# The macros assume they are ran with path chunk_coords from storage esefy:util after running function esefy:util/chunk_coords.


# FIXME: Hey, can't other players see this? (After fixing, leave a comment about how this should be called as the player)


#  DEV NOTE:
# "$(corner_x).0 ... ~0.5" is used instead of "$(corner_z).0" for getting the center of the block because
# if the macro'd coordinate was negative, it would add -0.5 instead of 0.5.
# For example, 2 would become 2.5 (a change of +0.5), but -2 would become -2.5 (a change of -0.5)

# NOTE: Dust particles ignore motion, but they might fall on bedrock(?)

# Corners, forced
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:4} ~0.5 ~ ~0.5 0 0 0 0 0 force
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:4} ~15.5 ~ ~0.5 0 0 0 0 0 force
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:4} ~0.5 ~ ~15.5 0 0 0 0 0 force
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:4} ~15.5 ~ ~15.5 0 0 0 0 0 force

# Algined with player along X and Z border of chunk, forced
# "~" is used instead of corner coords to align it with the player
$execute positioned $(corner_x).0 ~ ~ run particle minecraft:dust{color:[0,0,1],scale:4} ~0.5 ~ ~0.5 0 0 0 0 0 force
$execute positioned $(corner_x).0 ~ ~ run particle minecraft:dust{color:[0,0,1],scale:4} ~15.5 ~ ~0.5 0 0 0 0 0 force
$execute positioned ~ ~ $(corner_z).0 run particle minecraft:dust{color:[0,0,1],scale:4} ~0.5 ~ ~0.5 0 0 0 0 0 force
$execute positioned ~ ~ $(corner_z).0 run particle minecraft:dust{color:[0,0,1],scale:4} ~0.5 ~ ~15.5 0 0 0 0 0 force

# -Z X_Range
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~1.5 ~ ~0.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~2.5 ~ ~0.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~3.5 ~ ~0.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~4.5 ~ ~0.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~5.5 ~ ~0.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~6.5 ~ ~0.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~7.5 ~ ~0.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~8.5 ~ ~0.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~9.5 ~ ~0.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~10.5 ~ ~0.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~11.5 ~ ~0.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~12.5 ~ ~0.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~13.5 ~ ~0.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~14.5 ~ ~0.5 0 0 0 0 0 normal

# +Z X_Range
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~1.5 ~ ~15.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~2.5 ~ ~15.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~3.5 ~ ~15.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~4.5 ~ ~15.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~5.5 ~ ~15.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~6.5 ~ ~15.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~7.5 ~ ~15.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~8.5 ~ ~15.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~9.5 ~ ~15.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~10.5 ~ ~15.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~11.5 ~ ~15.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~12.5 ~ ~15.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~13.5 ~ ~15.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~14.5 ~ ~15.5 0 0 0 0 0 normal

# -X Z_Range
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~1.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~2.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~3.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~4.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~5.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~6.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~7.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~8.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~9.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~10.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~11.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~12.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~13.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~0.5 ~ ~14.5 0 0 0 0 0 normal

# +X Z_Range
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~1.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~2.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~3.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~4.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~5.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~6.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~7.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~8.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~9.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~10.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~11.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~12.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~13.5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15.5 ~ ~14.5 0 0 0 0 0 normal