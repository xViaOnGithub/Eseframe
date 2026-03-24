# `eseframe:craft`
##### Attempts to craft a registered recipe as the player running the function. 
## Description
#todo Lorem ibsum, among other made-up latinesque words. I'm going to copy and paste this. Lorem ibsum, among other made-up latinesque words. I'm going to copy and paste this. Lorem ibsum, among other made-up latinesque words. I'm no longer going to copy and paste this.

awdawdwadawdawdawdawdawdadawdawdawdawdawdawd
## [Macros](https://minecraft.wiki/w/Function_(Java_Edition)#Macros)
| key       | type   | description                                              | example      |
| --------- | ------ | -------------------------------------------------------- | ------------ |
| id        | string | A unique identifier for the recipe within the namespace. | "cool_sword" |
| namespace | string | The namespace of the core adding the recipe              | "my_core"    
### Structure
- id *string*
- namespace *string*

## Return Codes
| Return Code | Meaning                                                                            |
| ----------- | ---------------------------------------------------------------------------------- |
| fail        | Recipe doesn't exists, has no ingredients, or player does not have all ingredients |
| 1           | Recipe was detected successfully and the output was spawned                        |
## See also:
#todo