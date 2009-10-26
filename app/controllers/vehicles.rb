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
    display @vehicle
  end

  def edit(id)
    only_provides :html
    @vehicle = Vehicle.get(id)
    raise NotFound unless @vehicle
    display @vehicle
  end

  def create(vehicle)
    @vehicle = Vehicle.new(vehicle)
    if @vehicle.save
      redirect resource(@vehicle), :message => {:notice => "Vehicle was successfully created"}
    else
      message[:error] = "Vehicle failed to be created"
      render :new
    end
  end

  def update(id, vehicle)
    @vehicle = Vehicle.get(id)
    raise NotFound unless @vehicle
    if @vehicle.update_attributes(vehicle)
       redirect resource(@vehicle)
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