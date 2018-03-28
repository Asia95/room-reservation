module ApplicationHelper
  def check_if_only_user_reservations
    referer = request.referrer
    host = request.env["HTTP_HOST"]
    if referer != nil
      puts "]]]]]]]]]]]]]]]]]]]]]]]]]] #{referer}"
      puts "]]]]]]]]]]]]]]]]]]]]]]]]]] #{request.path}"
      referer_uri = referer.split(host).last
      if request.path == '/users/reservations' or referer_uri == '/users/reservations'
        return true
      else
        return false  
      end
    else
      puts "[[[[[[[[[[[[[[[[[[[[[[[[[[ #{request.path}"
      if request.path == '/users/reservations'

        return true
      else
        return false
      end
    end
  end
end
