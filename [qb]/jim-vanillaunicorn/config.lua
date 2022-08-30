print("Jim-VanillaUnicorn v1.1 - Vanilla Unicorn Job Script by Jimathy")

-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/xKgQZ6wZvS

Config = {}

Config.Locations = { ["main"] = { label = "Club De Deltaco", coords = vector3(111.05, -1287.96, 28.26) } }

Config.PayPerTicket = 50  --How much per ticket given at the bank

Config.ClockOutDist = 35 --25 Seems about fair, just outside the boundaries of the building

Config.MinAmountforTicket = 50 --Change this to your cheapest product price

Config.MLO = "van" --Set to "van" for the default interior
				   --Set to "gabz" for Gabz VU interior

Config.DrinkItems = {
    label = "Drinks Store",
    slots = 16,
    items = {
        [1] = { name = "cranberry", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "schnapps", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
        [3] = { name = "gin", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
        [4] = { name = "scotch", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
        [5] = { name = "rum", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
        [6] = { name = "icream", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
        [7] = { name = "amaretto", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
        [8] = { name = "curaco", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
        [9] = { name = "vodka", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
        [10] = { name = "sprunk", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
        [11] = { name = "sprunklight", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
        [12] = { name = "ecola", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
        [13] = { name = "ecolalight", price = 0, amount = 50, info = {}, type = "item", slot = 13, },
        [14] = { name = "crisps", price = 0, amount = 50, info = {}, type = "item", slot = 14, },
        [15] = { name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 15, },
        [16] = { name = "lime", price = 0, amount = 50, info = {}, type = "item", slot = 16, },
    }
}

Config.FoodItems = {
    label = "Food Fridge Store",
    slots = 12,
    items = {
        [1] = { name = "meat", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "pasta", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
        [3] = { name = "pickle", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
        [4] = { name = "fish", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
        [5] = { name = "nachos", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
        [6] = { name = "potato", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
        [7] = { name = "lettuce", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
        [8] = { name = "cheddar", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
        [9] = { name = "chocolate", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
		[10] = { name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
        [11] = { name = "lime", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
        [12] = { name = "crisps", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
    }
}