class ApplicationController < ActionController::Base
  before_action :updated_date


  def updated_date
    @sidebar_machines = Machine.all.order(updated_at: :desc).limit(100)
    @dates = []
    @sidebar_machines.each do |sidebar_machine|
        @dates << sidebar_machine.updated_at.to_date unless @dates.last == sidebar_machine.updated_at.to_date
    end
  end
end
