class PostPurchaseWorker
  include Sidekiq::Worker

  def perform(post_url, user_id)
    user = User.find(user_id)
    purchase = JSON.parse(
                HTTP.post('http://jsonplaceholder.typicode.com/todos').body)
    AdminMailer.new_purchase(user, purchase).deliver_now
  end
end
