# This function stores the chunk coordinates and -x -z corners of said chunk to the object "chunk_coords" data storage "eseframe:util"
# I recommend appending ".0" to your macro if you use the corner coordinate otherwise it will treat it as the center of the block at $(corner_x) [y] $(corner_z)!

execute store result storage eseframe:util chunk_coords.x int 1 run data get entity @s Pos[0] 0.0625
execute store result storage eseframe:util chunk_coords.z int 1 run data get entity @s Pos[2] 0.0625
execute store result storage eseframe:util chunk_coords.corner_x int 16 run data get entity @s Pos[0] 0.0625
execute store result storage eseframe:util chunk_coords.corner_z int 16 run data get entity @s Pos[2] 0.0625