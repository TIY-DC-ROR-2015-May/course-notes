How many users are there?
50 because I am already in there
User.count


What are the 5 most expensive items?
Item.order(price: :desc).limit(5)



What's the cheapest electronics item?
Rustic Wooden Table
Item.order(price: :asc).where(category: "Electronics").limit(1)



Who lives at "489 Fritsch Island"? Do they have another address?
Address.where(street: "489 Fritsch Island")
returns user_id of 35 can use that to run next command:
Address.where(user_id: 35)
user_id: 35,
  street: "84642 Bosco Orchard",
  city: "East Devanland",
  state: "Maryland",
  zip: 97375>,



Correct Tevin Mitchell's New York zip code to 10108.
User.where(first_name: "Tevin", last_name: "Mithell") to find the user id
 g = Address.find(26)
 g.zip = 10108


How much would it cost to buy one of each piece of jewelery?
Item.where(category: "Jewelery").sum(:price)
BigDecimal:7fe9a28f5e10,'0.7858E2',18(36) which I think means $78.58


How many total items did we sell?
Order.sum(:quantity)
821


How much was spent on health?
Item.where(category: "Health") returns
Ergonomic Plastic Chair id:1
Order.where(item_id: 1).sum(:quantity)
35


Simulate buying an item by inserting a User for yourself and an Order for that User (do not include this in the figures above).
User.create(first_name: "OB", last_name: "Sileo", email: "ob.gmail.com")
returns:
id: 52,
 first_name: "OB",
 last_name: "Sileo",
 email: "ob.gmail.com">
 Order.create(user_id: 52, item_id: 40, quantity: 12)






This folder structure should be suitable for starting a project that uses a database:

* Clone the repo
* `rake generate:migration <Name>` to create a migration
* `rake db:migrate` to run it
* Create models
* ... ?
* Profit

You may need to fiddle around with remotes assuming that you don't want to push to this one (which you probably don't).

## Rundown

```
.
├── Gemfile             # Details which gems are required by the project
├── README.md           # This file
├── Rakefile            # Defines `rake generate:migration` and `db:migrate`
├── config
│   └── database.yml    # Defines the database config (e.g. name of file)
├── console.rb          # `ruby console.rb` starts `pry` with models loaded
├── db
│   ├── dev.sqlite3     # Default location of the database file
│   ├── migrate         # Folder containing generated migrations
│   └── setup.rb        # `require`ing this file sets up the db connection
└── lib                 # Your ruby code (models, etc.) should go here
    └── all.rb          # Require this file to auto-require _all_ `.rb` files in `lib`
```
