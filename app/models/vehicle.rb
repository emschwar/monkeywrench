class Vehicle
  include DataMapper::Resource

  property :id,         Serial
  property :model_year, Integer
  property :model_info, String
  property :bought,     Date
  property :comments,   String
  property :color,      String
  property :vin,        String
  timestamps :on

  ########################################
  # Relationships
  ########################################
  belongs_to :owner, :class_name => 'User', :child_key => [ :owner_id ]

  ########################################
  # Validations
  ########################################
  validates_present :model_year, :model_info, :owner
end
