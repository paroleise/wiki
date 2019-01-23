class Sakuraiyushi::UsersController < Sakuraiyushi::ApplicationController

  def index
    @users = User.all
  end

end