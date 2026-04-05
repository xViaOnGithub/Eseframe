# Since this is invoked by an advancement, it runs AS and AT the player.
# Called when an item with custom data {eseframe_api:{proxy_item:{}}} is detected during an inventory change

# Revoke the advancement so it can be detected again
advancement revoke @s only eseframe:content/item/proxy/detect

say item proxy detected