#todo #datapack-todo #api_function

Eseframe automatically detects certain actions like use (aka "right-clicking") for any item with the `Eseframe` path in it's `minecraft:custom_data` component
#### `<datapack root>/data/<namespace>/tags/function/eseframe_api/item/<custom item id>/`:
*All of the below are optional.*
- `consume.json`: Runs when the player consumes an item, like when an item is eaten or thrown. 
- `use_press`: ==Currently broken/disabled #todo #datapack-todo== 
- `use_hold`: Runs **every tick** an item is being used for. "Using" includes things like eating a food and using a brush.