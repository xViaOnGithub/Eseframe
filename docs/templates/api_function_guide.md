> Banner, if there's a related tutorial
# `eseframe_api:path/to/function`
##### Brief description of basic functionality. 
#api_function
## Description

## [Macros](https://minecraft.wiki/w/Function_(Java_Edition)#Macros)
| key  | [type](https://minecraft.wiki/w/NBT_format#Data_types) | description                                                                                                           | example          |
| ---- | ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------- | ---------------- |
| key1 | string                                                 | A short description of this key's purpose                                                                             | "cool_sword"     |
| key2 | compound                                               | A short description of this key's purpose                                                                             | {another_key:1b} |
| key3 | compound                                               | When a compound or list of too complex to fit under "example", feel free to refer readers to the "structure" section. | *See below*      |
### Structure
- key_that_is_a_string *string*
- a_float *float*
- list_of_any_amount_of_strings *list*:
	1. *string*
	2. ...
- list_of_strictly_one_entry *list*:
	1. *string*
- this_can_be_a_compound_or_a_string *compound or string*:
	- integer_list_with_three_entries *integer list*:
		1. *integer*
		2. *integer*
		3. *integer*
	- this_is_an_empty_compound_nested_inside_another_compond_that_is_optional *compound (optional)*

## Return Codes
| Return Code | Meaning |
| ----------- | ------- |
| fail        | ...     |
| 1           | ...     |
## See also:
#todo