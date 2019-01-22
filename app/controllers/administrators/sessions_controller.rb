class Administrators::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    sakuraiyushi_root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :administrator
      sakuraiyushi_root_path
    else
      root_path
    end
  end

end
