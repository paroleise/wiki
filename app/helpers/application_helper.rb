module ApplicationHelper

  def return_character_class
    if administrator_signed_in?
      'admin_'
    elsif user_signed_in?
      'user_'
    else
      ''
    end
  end

end
