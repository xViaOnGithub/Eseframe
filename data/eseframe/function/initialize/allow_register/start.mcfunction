# Start allowing item registers until register period stops or a new type is open for registers
data modify storage eseframe:cache initialize.registry.allow_registry_register set value 1b