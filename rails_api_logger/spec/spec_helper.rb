require "bundler/setup"
require "net/http"
require "rails_api_logger"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    database_setup
  end
end

def database_setup
  ActiveRecord::Base.logger = nil
  ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
  ActiveRecord::Migration.verbose = false

  # TODO: copy-pasted from the migration template. avoid this. how? 🤷‍

  ActiveRecord::Schema.define do
    create_table :inbound_request_logs do |t|
      t.string :method
      t.string :path
      t.text :request_body
      t.text :response_body
      t.integer :response_code
      t.timestamp :started_at
      t.timestamp :ended_at
      t.references :loggable, index: true, polymorphic: true
      t.timestamps null: false
    end

    create_table :outbound_request_logs do |t|
      t.string :method
      t.string :path
      t.text :request_body
      t.text :response_body
      t.integer :response_code
      t.timestamp :started_at
      t.timestamp :ended_at
      t.references :loggable, index: true, polymorphic: true
      t.timestamps null: false
    end
  end
end
