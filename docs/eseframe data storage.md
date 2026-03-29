# storage `eseframe:cache`
- tick (cleared during \#minecraft:tick)
	- ...
- session (cleared on reload)
	- ...
#### Best practice
Keys should be named after the function's folder. For example:

| Path of main function                                                        | Storage path for cache (cleared on tick)            | Storage path for cache (cleared on reload)             |
| ---------------------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------ |
| `<root>/data/eseframe/function/content/item/detect/use_press/run.mcfunction` | `eseframe:cache tick/content/item/detect/use_press` | `eseframe:cache session/content/item/detect/use_press` |