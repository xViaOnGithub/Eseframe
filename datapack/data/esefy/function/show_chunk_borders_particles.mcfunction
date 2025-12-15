# Creates particles in a flat square with the corners ~ ~ ~ and ~16 ~ ~16
# Inteneded to be ran at the corner of a chunk to show chunk borders
# The macros assume they are ran with path chunk_coords from storage esefy:util after running function esefy:util/chunk_coords.
# todo note on executor aligned particles and the whole .0 thing
# another note, dust ignores motion

# Corners, forced
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:4} ~ ~ ~ 0 0 0 0 0 force
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:4} ~16 ~ ~ 0 0 0 0 0 force
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:4} ~ ~ ~16 0 0 0 0 0 force
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:4} ~16 ~ ~16 0 0 0 0 0 force

# algined with player, forced
$execute positioned $(corner_x).0 ~ ~ run particle minecraft:dust{color:[0,0,1],scale:2} ~ ~ ~ 0 0 0 0 0 force
$execute positioned $(corner_x).0 ~ ~ run particle minecraft:dust{color:[0,0,1],scale:2} ~16 ~ ~ 0 0 0 0 0 force
$execute positioned ~ ~ $(corner_z).0 run particle minecraft:dust{color:[0,0,1],scale:2} ~ ~ ~ 0 0 0 0 0 force
$execute positioned ~ ~ $(corner_z).0 run particle minecraft:dust{color:[0,0,1],scale:2} ~ ~ ~16 0 0 0 0 0 force

# -Z X_Range
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~1 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~2 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~3 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~4 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~5 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~6 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~7 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~8 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~9 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~10 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~11 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~12 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~13 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~14 ~ ~ 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15 ~ ~ 0 0 0 0 0 normal

# +Z X_Range
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~1 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~2 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~3 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~4 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~5 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~6 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~7 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~8 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~9 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~10 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~11 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~12 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~13 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~14 ~ ~16 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~15 ~ ~16 0 0 0 0 0 normal

# -X Z_Range
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~1 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~2 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~3 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~4 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~6 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~7 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~8 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~9 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~10 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~11 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~12 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~13 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~14 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~ ~ ~15 0 0 0 0 0 normal

# +X Z_Range
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~1 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~2 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~3 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~4 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~5 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~6 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~7 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~8 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~9 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~10 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~11 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~12 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~13 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~14 0 0 0 0 0 normal
$execute positioned $(corner_x).0 ~ $(corner_z).0 run particle minecraft:dust{color:[1,0,0],scale:2} ~16 ~ ~15 0 0 0 0 0 normal