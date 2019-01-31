class ApplicationController < ActionController::Base
  before_action :updated_date
  before_action :constant_information
  before_action :search

  def updated_date
    @sidebar_machines = Machine.all.order(updated_at: :desc).limit(100)
    @dates = []
    @sidebar_machines.each do |sidebar_machine|
        @dates << sidebar_machine.updated_at.to_date unless @dates.last == sidebar_machine.updated_at.to_date
    end
  end

  def constant_information
    @manufacturers = %w(aiki amtechs agon excite ok olympia kyoraku ginza goldolympia sammy sankyo sanyo sunthree sansei jb daiichi daito taiyo takasago takao takeya daiwa toyomaru aaa nanasho nishijin newgin bisty fuji heiwa bros bellco masamura maruhon mizuho macy other)
    @judgments = %w(good ordinary shit pac squid terror nothing)
    @archetypes = %w(kakuhen st vkakuhen vst tenraku onetwo feather ippatsu set hensoku uncategorized)
    @specs = %w(fucking_rare ultra_rare hyper_rare super_rare very_rare rare often normal feather uncategorized)
  end

  def search
    @q = Machine.all.order(introduction_date: :desc).ransack(params[:q])
  end

end


