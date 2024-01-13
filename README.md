

This is a simple script that took less than 20 minutes to write.

This is designed to create the entries that go into the QBCore shared/vehicles.lua

How to use:
1. Put the cars you want to price into the Config.VehiclesToPrice
2. Go to the airport or wherever you set your Config.SpawnLocation
3. Type /startpricer to spawn the first vehicle
4. Type /price {amount} {shop} (ex. /price 10000 pdm)
    This will set whatever car is currently showing to be written to your file
5. Take the entries from cars.txt and copy/paste them into shared/vehicles.lua

Note:
This works for vanilla cars because it gets the vehicle display name and breaks it into sections.
This may not work as well for addon cars.
Any time there is an unknown part that the script can't fetch from the vehicle info, it will populate to "Unknown"

It is up to you to make sure you put the write price and shop

OPTIONAL PYTHON SCRIPT:
- This python script can be used to webscrape the FiveM docs page showing all the vehicles in the base game
execute this python script and it will write all the names to code_words.txt and you can copy/paste that into your Config.VehiclesToPrice