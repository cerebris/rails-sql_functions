$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "rails_sql_functions"

require "minitest/autorun"
require 'active_record'
require 'active_record/railtie'
require 'rails/test_help'
require 'rake'

Rails.env = 'test'

puts "Testing With RAILS VERSION #{Rails.version}"

class TestApp < Rails::Application
  config.eager_load = false
  config.root = File.dirname(__FILE__)
  config.session_store :cookie_store, key: 'session'
  config.secret_key_base = 'secret'

  #Raise errors on unsupported parameters
  config.action_controller.action_on_unpermitted_parameters = :raise

  ActiveRecord::Schema.verbose = false
  config.active_record.schema_format = :none
  config.active_support.test_order = :random

  if Rails::VERSION::MAJOR >= 5
    config.active_support.halt_callback_chains_on_return_false = false
    config.active_record.time_zone_aware_types = [:time, :datetime]
    config.active_record.belongs_to_required_by_default = false
  end

  config.active_record.sqlite3.represent_boolean_as_integer = true
end

TestApp.initialize!
Rails.application.load_tasks


# Setup some tables
ActiveRecord::Schema.define do
  create_table :authors, force: true do |t|
    t.string  :name
    t.timestamps null: false
  end

  create_table :posts, force: true do |t|
    t.string     :title
    t.text       :body
    t.integer    :author_id
    t.timestamps null: false
  end
end

# run one dummy query to setup the connections so it doesn't get counted later
ActiveRecord::Base.connection.execute "select null;"

def assert_query_count(expected, msg = nil, &block)
  callback = lambda {|_, _, _, _, payload|
    @queries.push payload[:sql]
  }

  @queries = []
  ActiveSupport::Notifications.subscribed(callback, 'sql.active_record', &block)
  show_queries unless expected == @queries.size
  assert expected == @queries.size, "Expected #{expected} queries, ran #{@queries.size} queries"
end

def track_queries(&block)
  @queries = []
  callback = lambda {|_, _, _, _, payload|
    @queries.push payload[:sql]
  }
  ActiveSupport::Notifications.subscribed(callback, 'sql.active_record', &block)

  show_queries
  @queries = nil
end

def show_queries
  @queries.each_with_index do |query, index|
    puts "sql[#{index}]: #{query}"
  end
end