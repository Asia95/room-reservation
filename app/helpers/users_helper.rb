module UsersHelper  

  def user_reservations_show_partial_path(user_reservations)
    if !user_reservations.empty?
      @reservations = user_reservations
      @only_user_reservations = true
      'reservations/show'
    else
      'reservations/no_reservations'
    end
  end

end
