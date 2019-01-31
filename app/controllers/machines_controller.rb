class MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :versions, :edit, :update, :destroy, :mod]
  before_action :search_past_article, only: [:trace, :diff, :nowdiff, :degenerate]
  before_action :confirm_authority, only: [:edit, :update, :degenerate, :mod, :destroy]


  def index
    if params[:manufacturer]
      @machines = Machine.all.where(manufacturer: params[:manufacturer]).order(introduction_date: :asc)
      @divided = "manufacturer"
      @value = params[:manufacturer]
    elsif params[:archetype]
      @machines = Machine.all.where(archetype: params[:archetype]).order(introduction_date: :desc)
      @divided = "archetype"
      @value = params[:archetype]
    elsif params[:spec]
      @machines = Machine.all.where(spec: params[:spec]).order(introduction_date: :desc)
      @divided = "spec"
      @value = params[:spec]
    elsif params[:judgment]
      @machines = Machine.all.where(judgment: params[:judgment]).order(introduction_date: :desc)
      @divided = "judgment"
      @value = params[:judgment]
    else
      @machines = Machine.all.order(introduction_date: :desc)
      @divided = nil
      @value = nil
    end
  end

  def search
    @machines = Machine.all.order(introduction_date: :desc)
    @q = Machine.ransack(params[:q])
    @machines = @q.result.page(params[:page]).per(20)
  end

  def versions
    @versions = @machine.versions.reorder('created_at DESC').page(params[:page]).limit(100).per(20)
    unless @versions.last
      redirect_to machine_path(@machine)
    end
  end

  def show
  end

  def trace
  end

  def diff
    @previous = @version.previous.reify if @version.previous
    set_machine if params[:current]
  end

  def nowdiff
    @previous = @machine
    @machine = Machine.find(params[:id])
  end

  def new
    unless administrator_signed_in? || user_signed_in?
      redirect_to root_path, notice: "新しい記事の作成にはログインが必要です。"
    end
    @machine = Machine.new
  end

  def edit
  end

  def mod
    @object = params[:object]
  end

  def degenerate
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
      params.require(:machine).permit(:name, :kana, :judgment,
        :manufacturer, :spec, :archetype, :introduction_date, :introduction_season,
        :overview, :feature, :evaluation_point, :pros_and_cons, :problem, :other,
        :conclusion, :degression, :details, :authority)
    end

    def search_past_article
      @version = Machine.find(params[:id]).versions.last
      (params[:index].to_i - 1).times do
        @version = @version.previous
      end
      @machine = @version.reify
    end

    def confirm_authority
      if @machine.authority == "administrator"
        return true if administrator_signed_in?
      elsif @machine.authority == "user"
        return true if user_signed_in? || administrator_signed_in?
      else
        return true
      end
      redirect_to machine_path(@machine), notice: "この記事の編集は管理者によって制限されています。"
    end

end
