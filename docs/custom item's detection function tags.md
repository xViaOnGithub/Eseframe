#todo #api_function

>[!info] #todo related tutorial: [[tutorials/Detecting when an item is used or consumed]]

Eseframe automatically detects certain actions like use (aka "right-clicking") for any item with the `Eseframe` path in it's `minecraft:custom_data` component
#### `<datapack root>/data/<namespace>/tags/function/eseframe_api/item/<custom item id>/`:
*All of the below are optional.*
- `consume.json`: Invoked when the player consumes an item, like when an item is eaten or thrown. 
- `use_press.json`: Invoked when the item first starts being used. "Using" includes things like eating a food and using a brush.
- `use_hold.json`: Invoked **every tick** an item is being used for. "Using" includes things like eating a food and using a brush.