class MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :versions, :edit, :update, :destroy, :mod]
  before_action :search_past_article, only: [:trace, :diff, :degenerate]

  def index
    @machines = Machine.all
  end

  def versions
    @versions = @machine.versions
  end

  def show
  end

  def trace
    (params[:index].to_i - 1).times do
      @version = @version.previous
    end
    @machine = @version.reify
  end

  def diff
    (params[:index].to_i - 1).times do
      @version = @version.previous
    end
    @machine = @version.reify
    @previous = @version.previous.reify
  end

  def new
    @machine = Machine.new
  end

  def edit
  end

  def mod
    @object = params[:object]
  end

  def degenerate
    (params[:index].to_i - 1).times do
      @version = @version.previous
    end
    @machine = @version.reify
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

    def search_past_article
      @version = Machine.find(params[:id]).versions.last
    end

end
