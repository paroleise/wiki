class Sakuraiyushi::MachinesController < Sakuraiyushi::ApplicationController

  def index
    @machines = Machine.all
  end

end
