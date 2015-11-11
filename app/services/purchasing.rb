module Purchasing
  module_function

  def purchase_photo(user)
    photo = get_photo
    valid_photo = valid_photo?(photo)
    if valid_photo
      purchase = post_purchase
      GuestMailer.purchase_email(user, photo).deliver_later
      AdminMailer.new_purchase(user, purchase).deliver_later
    else
      AdminMailer.purchase_error(user).deliver_later
      false
    end
  end

  def valid_photo?(photo)
    thumb_color = photo['thumbnailUrl'][-6, 6].to_i
    photo_color = photo['url'][-6, 6].to_i

    thumb_color <= photo_color
  end

  def get_photo
    JSON.parse(
      HTTP.get("http://jsonplaceholder.typicode.com/photos/#{rand(1..500)}").body)
  end

  def post_purchase
    JSON.parse(HTTP.post('http://jsonplaceholder.typicode.com/todos').body)
  end

end
