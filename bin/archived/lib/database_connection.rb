def connect_to_db
  require 'active_record'

  # TODO read in from ../config/database.yml
  # Change the following to reflect your database settings
  ActiveRecord::Base.establish_connection(
      adapter:  'postgresql',
      host:     'localhost',
      database: 'argotifier_prod',
      username: 'argotifier',
      password: 'start123'
  )
end
