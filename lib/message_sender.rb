require "twilio-ruby"

class MessageSender

  def initialize(order_confirmation, client=Twilio::REST::Client)
    @order_confirmation = order_confirmation
    @client = client
  end

  def send_confirmation(phone_number)
    twilio_send(phone_number, @order_confirmation.message)
    "Sent: #{@order_confirmation.message}"
  end

  private

  def twilio_send(phone_number, body)
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = @client.new(account_sid, auth_token)
    twilio_number = "+16093625213"

    client.messages.create(
    from: twilio_number,
    to: phone_number,
    body: body
    )
  end
  
end



