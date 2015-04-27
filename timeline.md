This timeline aims to present the various MVC pieces in isolation as much as possible and get some good reps in on the various pieces before jumping into Rails proper.

This is simply a loose outline, and may change depending on class progress and student interests. We may also reschedule to make the most of opportunities that present themselves along the way.

## Week 1 - Basic Ruby

By the end of this week students should be

* Comfortable with Ruby syntax and control flow constructs
* Used to both running scripts directly and interacting with them via e.g. Pry
* Exposed to testing ideas (via e.g. Ruby Koans), if not necessarily comfortable TDD'ing things themselves

## Week 2 - OO Design

* Classes, subclasses, modules and mixins
* Heavy emphasis on understanding local variable vs. method vs. instance variable - visibility and scoping
* More familiarity with testing.

## Week 3 - Models

* Introduce databases, SQL and Camping models
* Adapt projects from week 2 to be persistent
* Projects driven either via command line scripts or by tests where appropriate

## Week 4 - Controllers

* Introduce HTTP protocol, how the web works
* Poke around with some APIs - Github, Spotify are good
* Write our own Camping controllers and interact with them via e.g. Postman
* At this point, could deploy to Heroku

## Week 5 - Views

* Cover the HTML bestiary (esp. the various relevant form elements)
* CSS and design
* Can finally build a full-scale MVC app. Should probably do so to prepare for ...

## Week 6 - Rails!

* Cover project organization, conventions
* Command line helpers, scaffolding
* Migrate the project from last week to Rails. Compare and contrast pain points.
* Tools for testing with Rails - Capybara, factories

## Week 7 - Rails Patterns

Look at some of the common patterns and exensions, like

* Authentication systems, Devise (omniauth?), API token auth
* Authorization, /(can){2,3}/
* Pagination (kaminari, will_paginate)
* File uploads (paperclip, carrier_wave)
* Search (pg extensions? Mention ES?)
* Mailers (background workers? ... once 4.2 is out, it'd make sense to mention that here)

## Week 8 - Javascript

* DOM manipulation with (and without?) jQuery
* UJS
* AJAX
* Asset pipeline, vendoring JS, coffeescript

## Week 9

Can be more flexible, depending on interests and progress of the class. Some combination of

* Deeper look into client-side frameworks
* More on good testing practices
* Soft-skills - scrum and estimation (I'd like to get students working in small groups with something like a designated scrummaster at this point - that's a good way to push your more advanced students to work on non-technical skills)
* Peek into DevOps, e.g. by deploying to Digital Ocean using Capistrano
* Continue to explore Rails patters and the Rails-related Gem ecosystem
* Hardware integration projects - CloudBits, Hue bulbs, Artoo

## Week 10

Continue on list from Week 9

## Week 11

Review and final projects

## Week 12

Review and final projects
