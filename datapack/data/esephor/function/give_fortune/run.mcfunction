# Remove the advancement that detects the player eating a fortune cookie
advancement revoke @s only esephor:internal/temporary/ate_fortune_cookie

# Set up storage
data modify storage esephor:tmp fortunes set value {}

# Add possible fortunes to storage
data modify storage esephor:tmp fortunes.text append value "Help me, I am trapped in a Fortune Cookie Factory!"
data modify storage esephor:tmp fortunes.text append value "You will die tomorrow...     by a Creeper"
data modify storage esephor:tmp fortunes.text append value "At some point in your Life something bad will happen!!!"
data modify storage esephor:tmp fortunes.text append value "Next week you will notice that this is not the real world, you are in a computer game"
data modify storage esephor:tmp fortunes.text append value "This cookie will taste good in a few seconds"
data modify storage esephor:tmp fortunes.text append value 'The last word you will hear is gonna be "EXTERMINATE!!!"'
data modify storage esephor:tmp fortunes.text append value "Whatever you do, do not hug a Creeper... I tried it. It feels good, but it's not worth it."
data modify storage esephor:tmp fortunes.text append value "42. The answer is 42."
data modify storage esephor:tmp fortunes.text append value "A Walshy a day will keep the troubles away."
data modify storage esephor:tmp fortunes.text append value "Never dig straight down!"
data modify storage esephor:tmp fortunes.text append value "Tis but a flesh wound!"
data modify storage esephor:tmp fortunes.text append value "Always look on the bright side of life!"
data modify storage esephor:tmp fortunes.text append value "This one was actually a Biscuit and not a Cookie"
data modify storage esephor:tmp fortunes.text append value "Neon signs are LIT!"
data modify storage esephor:tmp fortunes.text append value "XVIA WUZ HERE!!!"

# Tellraw the player a random fortune
execute store result storage esephor:tmp fortunes.random int 1 run random value 0..14 esephor:fortunes
function esephor:give_fortune/steps/01 with storage esephor:tmp fortunes

# Clean up
data remove storage esephor:tmp fortunes