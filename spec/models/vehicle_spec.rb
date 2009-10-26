require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Vehicle do

  it "should not be valid without required attributes" do
    vehicle = Vehicle.new
    vehicle.should_not be_valid
  end

  it "should be valid with required attributes" do
    vehicle = Vehicle.new(:model_year => 2009,
                          :model_info => "Subaru Forester",
                          :owner => User.make)
    vehicle.should be_valid
  end

end
