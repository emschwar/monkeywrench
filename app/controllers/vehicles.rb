require 'ruby-debug'
class Vehicles < Application
  # provides :xml, :yaml, :js

  def index
    @vehicles = Vehicle.all
    render
  end

  def show(id)
    @vehicle = Vehicle.get(id)
    raise NotFound unless @vehicle
    display @vehicle
  end

  def new
    only_provides :html
    @vehicle = Vehicle.new
    3.times { @vehicle.maintenance_events.build } 
    render
  end

  def edit(id)
    only_provides :html
    @vehicle = Vehicle.get(id)
    raise NotFound unless @vehicle
    3.times { @vehicle.maintenance_events.build } unless
      @vehicle.maintenance_events.any?
    display @vehicle
  end

  def create(vehicle)
    debugger
    @vehicle = Vehicle.new(vehicle.merge(:owner => session.user))
    if @vehicle.save
      redirect resource(:vehicles), :message => {:notice => "Vehicle was successfully created"}
    else
      message[:error] = "Vehicle failed to be created"
      render :new
    end
  end

  def update(id, vehicle)
    @vehicle = Vehicle.get(id)
    raise NotFound unless @vehicle
    if @vehicle.update_attributes(vehicle)
      redirect resource(:vehicles)
    else
      display @vehicle, :edit
    end
  end

  def destroy(id)
    @vehicle = Vehicle.get(id)
    raise NotFound unless @vehicle
    if @vehicle.destroy
      redirect resource(:vehicles)
    else
      raise InternalServerError
    end
  end

end # Vehicles
