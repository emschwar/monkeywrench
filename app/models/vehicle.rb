class Vehicle
  include DataMapper::Resource
  
  property :id,         Serial
  property :model_year, Date
  property :bought,     Date
  property :model_info, String
  property :comments,   String

  belongs_to :owner, :class_name => 'User', :child_key => [ :owner_id ]
  
  timestamps :on
end
