require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a maintenance_event exists" do
  MaintenanceEvent.all.destroy!
  request(resource(:maintenance_events), :method => "POST", 
    :params => { :maintenance_event => { :id => nil }})
end

describe "resource(:maintenance_events)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:maintenance_events))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of maintenance_events" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a maintenance_event exists" do
    before(:each) do
      @response = request(resource(:maintenance_events))
    end
    
    it "has a list of maintenance_events" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      MaintenanceEvent.all.destroy!
      @response = request(resource(:maintenance_events), :method => "POST", 
        :params => { :maintenance_event => { :id => nil }})
    end
    
    it "redirects to resource(:maintenance_events)" do
      @response.should redirect_to(resource(MaintenanceEvent.first), :message => {:notice => "maintenance_event was successfully created"})
    end
    
  end
end

describe "resource(@maintenance_event)" do 
  describe "a successful DELETE", :given => "a maintenance_event exists" do
     before(:each) do
       @response = request(resource(MaintenanceEvent.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:maintenance_events))
     end

   end
end

describe "resource(:maintenance_events, :new)" do
  before(:each) do
    @response = request(resource(:maintenance_events, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@maintenance_event, :edit)", :given => "a maintenance_event exists" do
  before(:each) do
    @response = request(resource(MaintenanceEvent.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@maintenance_event)", :given => "a maintenance_event exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(MaintenanceEvent.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @maintenance_event = MaintenanceEvent.first
      @response = request(resource(@maintenance_event), :method => "PUT", 
        :params => { :maintenance_event => {:id => @maintenance_event.id} })
    end
  
    it "redirect to the maintenance_event show action" do
      @response.should redirect_to(resource(@maintenance_event))
    end
  end
  
end

