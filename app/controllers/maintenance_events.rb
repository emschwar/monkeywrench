class MaintenanceEvents < Application
  # provides :xml, :yaml, :js

  def index
    @maintenance_events = MaintenanceEvent.all
    display @maintenance_events
  end

  def show(id)
    @maintenance_event = MaintenanceEvent.get(id)
    raise NotFound unless @maintenance_event
    display @maintenance_event
  end

  def new
    only_provides :html
    @maintenance_event = MaintenanceEvent.new
    display @maintenance_event
  end

  def edit(id)
    only_provides :html
    @maintenance_event = MaintenanceEvent.get(id)
    raise NotFound unless @maintenance_event
    display @maintenance_event
  end

  def create(maintenance_event)
    @maintenance_event = MaintenanceEvent.new(maintenance_event)
    if @maintenance_event.save
      redirect resource(@maintenance_event), :message => {:notice => "MaintenanceEvent was successfully created"}
    else
      message[:error] = "MaintenanceEvent failed to be created"
      render :new
    end
  end

  def update(id, maintenance_event)
    @maintenance_event = MaintenanceEvent.get(id)
    raise NotFound unless @maintenance_event
    if @maintenance_event.update_attributes(maintenance_event)
       redirect resource(@maintenance_event)
    else
      display @maintenance_event, :edit
    end
  end

  def destroy(id)
    @maintenance_event = MaintenanceEvent.get(id)
    raise NotFound unless @maintenance_event
    if @maintenance_event.destroy
      redirect resource(:maintenance_events)
    else
      raise InternalServerError
    end
  end

end # MaintenanceEvents
