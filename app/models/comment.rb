class Comment < ActiveRecord::Base
  validates :content, :presence => true
  belongs_to :post
  belongs_to :user

  after_create :send_sms

  def send_sms
    if self.post.user.phone != nil
      begin
        response = RestClient::Request.new(
          method: :post,
          url: "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
          user: ENV['TWILIO_ACCOUNT_SID'],
          password: ENV['TWILIO_AUTH_TOKEN'],
          payload: { Body: 'Someone commented on your post: ' + content,
                     To: self.post.user.phone,
                     From: 5032134044 }
        ).execute
      rescue
        false
      end
    end
  end

end
