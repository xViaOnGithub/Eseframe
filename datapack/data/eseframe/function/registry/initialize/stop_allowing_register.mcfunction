# API can check if path storage eseframe:cache initialize.registry.allow_registry_add to know if Eseframe is accepting registry registers.
# To use, check with "execute [...] if data storage eseframe:cache {initialize:{registry:{allow_registry_register:1b}}} [...]"

# 1b:       Registering is allowed
# 0b:       Registering is not allowed
# (unset):  Registering is not allowed

# Stop allowing new registers
data modify storage eseframe:cache initialize.registry.allow_registry_register set value 0b