source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in rails-sql_functions.gemspec
gemspec

platforms :ruby do
  gem 'sqlite3', '1.3.13'
end

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
end

