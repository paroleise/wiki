class Sakuraiyushi::MachinesController < Sakuraiyushi::ApplicationController
  before_action :set_machine, only: [:show, :edit, :update, :destroy, :mod]

  def index
    @machines = Machine.all
  end

  def show
  end

  def new
    @machine = Machine.new
  end

  def history
    
  end

  def edit
  end

  def mod
    @object = params[:object]
  end


  def create
    @machine = Machine.new(machine_params)

    respond_to do |format|
      if @machine.save
        format.html { redirect_to @machine, notice: 'Machine was successfully created.' }
        format.json { render :show, status: :created, location: @machine }
      else
        format.html { render :new }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @machine.update(machine_params)
        format.html { redirect_to @machine, notice: 'Machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @machine }
      else
        format.html { render :edit }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @machine.destroy
    respond_to do |format|
      format.html { redirect_to machines_url, notice: 'Machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_machine
      @machine = Machine.find(params[:id])
    end

    def machine_params
      params.require(:machine).permit(:name, :kana, :judgment, :manufacturer, :spec, :archetype, :introduction_date, :introduction_season, :overview, :feature, :evaluation_point, :pros_and_cons, :problem, :other, :conclusion, :annotation)
    end
end
