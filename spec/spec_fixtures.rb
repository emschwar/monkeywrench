User.fixture {{
  :login                 => (login = /\w+/.gen),
  :email                 => "#{login}@example.com",
  :password              => (password = /\w+/.gen),
  :password_confirmation => password
}}

Vehicle.fixture {{
  :model_year => 1950 + rand(59),
  :model_info => ["Toyota Sienna", "Mazda 6i", "Subaru Forester"][rand(3)],
  :vin        => "XKCD0394829",
  :owner      => User.make
}}
