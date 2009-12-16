class MaintenanceEvent
  include DataMapper::Resource

  property :id,             Serial
  property :description,    String
  property :next_ocurrence, Integer
  property :interval,       Integer
  property :performed_on,   Integer
end
