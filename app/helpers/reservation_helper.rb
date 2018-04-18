module ReservationHelper

  def all_reservations_show_partial_path(reservations)
    if !reservations.empty?
      @reservations = reservations
      'reservations/show'
    else
      'reservations/no_reservations'
    end
  end

  def get_all_or_just_user_reservations
    referer = request.referrer
    host = request.env["HTTP_HOST"]
    if referer != nil
      puts "]]]]]]]]]]]]]]]]]]]]]]]]]] #{referer}"
      puts "]]]]]]]]]]]]]]]]]]]]]]]]]] #{request.path}"
      referer_uri = referer.split(host).last
      if request.path == '/users/reservations' or referer_uri == '/users/reservations'
        return Reservation.recent.where(user_id: current_user.id)
      else
        return Reservation.recent
      end
    else
      puts "[[[[[[[[[[[[[[[[[[[[[[[[[[ #{request.path}"
      if request.path == '/users/reservations'

        return Reservation.recent.where(user_id: current_user.id)
      else
        return Reservation.recent
      end
    end
  end
  
end
