require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a vehicle exists" do
  login_as(skif)
  Vehicle.all.destroy!
  request(resource(:vehicles), :method => "POST",
    :params => { :vehicle => { :id => nil,
                               :model_year => Date.today.year,
                               :model_info => "Ford F150",
                               :vin        => "A38w8ed39s39f83332"}})
end


describe "resource(:vehicles)" do
  describe "GET" do

    before(:each) do
      @response = request(resource(:vehicles))
    end

    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of vehicles" do
      @response.should have_xpath("//ul")
    end

  end

  describe "GET", :given => "a vehicle exists" do
    before(:each) do
      @response = request(resource(:vehicles))
    end

    it "has a list of vehicles" do
      @response.should have_xpath("//ul/li")
    end
  end

  describe "a successful POST" do
    before(:each) do
      Vehicle.all.destroy!
      login_as(skif)
      @response = request(resource(:vehicles), :method => "POST",
        :params => { :vehicle => { :id => nil,
                                   :model_year => Date.today.year,
                                   :model_info => "Mazda 6i",
                                   :vin        => "wtfzo38fm38g0392"}})

    end

    it "redirects to resource(:vehicles)" do
      @response.should redirect_to(resource(Vehicle.first), :message => {:notice => "vehicle was successfully created"})
    end

  end
end

describe "resource(@vehicle)" do
  describe "a successful DELETE", :given => "a vehicle exists" do
    before(:each) do
       @response = request(resource(Vehicle.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:vehicles))
     end

   end
end

describe "resource(:vehicles, :new)" do
  before(:each) do
    @response = request(resource(:vehicles, :new))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@vehicle, :edit)", :given => "a vehicle exists" do
  before(:each) do
    @response = request(resource(Vehicle.first, :edit))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@vehicle)", :given => "a vehicle exists" do
  describe "GET" do
    before(:each) do
      @response = request(resource(Vehicle.first))
    end

    it "responds successfully" do
      @response.should be_successful
    end
  end

  describe "PUT" do
    before(:each) do
      @vehicle = Vehicle.first
      @response = request(resource(@vehicle), :method => "PUT",
        :params => { :vehicle => {:id => @vehicle.id} })
    end

    it "redirect to the vehicle show action" do
      @response.should redirect_to(resource(@vehicle))
    end
  end

end

