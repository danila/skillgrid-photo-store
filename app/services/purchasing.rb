class Purchasing

  def new(user)
    @user = user
    @photo_url = "http://jsonplaceholder.typicode.com/photos/#{rand(1..500)}"
  end

  def proceed
    if can_purchase?
      GuestMailer.purchase_email(@user, photo).deliver_later

      post_url = 'http://jsonplaceholder.typicode.com/todos'
      PostPurchaseWorker.perform_async(post_url, @user.id)
    else
      AdminMailer.purchase_error(@user).deliver_later
      return false
    end
  end

  private
    def can_purchase?
      photo = JSON.parse(HTTP.get(@photo_url).body)

      valid_photo?(photo)
    end

    def valid_photo?(photo)
      thumb_color = photo['thumbnailUrl'].last(6)
      photo_color = photo['url'].last(6)

      thumb_color <= photo_color
    end
end
