$say add content of $(namespace)


data remove storage eseframe:cache initialize.include.add_content.Step01.ContentFunctionSuccess

# Try to run the function for adding content
$execute store success storage eseframe:cache initialize.include.add_content.Step01.ContentFunctionSuccess byte 1 run function $(namespace):eseframe_api/content

# Say an error if the content function fails
$execute if predicate {condition:"minecraft:value_check",value:{type:"minecraft:storage",storage:"eseframe:cache",path:"initialize.include.add_content.Step01.ContentFunctionSuccess"},range:1} run say [Eseframe API] Error! Function `$(namespace):eseframe_api/content` is missing or failed!


# Tell list_loop to keep going
return 1