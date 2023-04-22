require 'pg'

RSpec.describe 'users', type: :model do
  describe 'email validation' do
    it 'validates email addresses' do
      # Connect to the PostgreSQL database
      conn = PG.connect(dbname: 'appdb_development', user: 'appdb', password: '12345', host: '10.32.2.248')

      # Select all the email addresses from the users table
      result = conn.exec('SELECT email FROM users')

      # Loop through each row in the result set and validate the email address
      result.each do |row|
        email = row['email']

        if email.match?(/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i)
          # Do nothing, email is valid
        else
          # Fail the test if an invalid email address is found
          fail "#{email} invalid email address"
        end
      end

      # Close the database connection
      conn.close
    end
  end
end