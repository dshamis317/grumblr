database_url = ENV['DATABASE_URL'] || 'postgres://localhost/grumblr'
ActiveRecord::Base.establish_connection(database_url)
