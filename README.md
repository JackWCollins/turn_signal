# Turn Signal

This is a sample API that allows CRUD actions for Vehicles, Makes, Models, and vehicle Options. Visit the [API Docs](https://jackwcollins.github.io/turn_signal_docs/) for more information.

### Tech Stack
* Rails 5.1 / Ruby 2.3.1
* RSpec
* ActiveModelSerializers
* Kaminari for pagination
* Figaro for environment variables

### For a real application

I definitely omitted certain features that I would have included for a production application. Some of those are: 

* Allow the client to specify which relationships shoudl be included. For example, you could allow clients to specifically request the vehicles for each models via `/models?include=vehicles`. https://github.com/rails-api/active_model_serializers/issues/968 
* Add real authorization key handling... don't just use a constant string