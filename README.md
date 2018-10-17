# Rails-SqlFunctions

This gem adds rake tasks to run sql statements. An option to dump the database structure using `db:structure:dump` is
also available.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails-sql_functions'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails-sql_functions

## Usage

Create the `db/functions` directory. Add `.sql` files. You can organize your files with sub directories and they
will be traversed. All `.sql` files will be run against the database.

You can also add an initializer to set configuration options such as an alternate directory to run or load sql
functions from.

Two rake tasks are available: 
### `db:sql_functions:load`

Used for loading functions and other changes to the database structure. By default will update the structure file by
running `db:structure:dump` after.

 
### `db:sql_functions:run`

Same as above, but does not run `db:structure:dump` afterwards

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. 
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the 
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, 
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at 
[https://github.com/cerebris/rails-sql_functions](https://github.com/cerebris/rails-sql_functions).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
