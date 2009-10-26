User.fixture {{
  :login                 => (login = /\w+/.gen),
  :email                 => "#{login}@example.com",
  :password              => (password = /\w+/.gen),
  :password_confirmation => password
}}

