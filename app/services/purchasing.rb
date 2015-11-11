class Purchasing
  attr_accessor :photo
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def photo
    @photo ||= JSON.parse(HTTP.get("http://jsonplaceholder.typicode.com/photos/#{rand(1..500)}").body)
  end

  def proceed
    if can_purchase?
      GuestMailer.purchase_email(user, photo).deliver_later
      PostPurchaseWorker.perform_async(user.id)
      return true
    else
      AdminMailer.purchase_error(user).deliver_later
      return false
    end
  end

  private

    def can_purchase?
      photo['thumbnailUrl'].last(6) <= photo['url'].last(6)
    end
end
