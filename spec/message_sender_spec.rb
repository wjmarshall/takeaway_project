require "message_sender"

RSpec.describe MessageSender do
  let(:client) { double(:client) }
  let(:order_confirmation) { double(:order_confirmation, message: "Thank you! Your order was placed and will be delivered before 20:10") }
  subject(:message_sender) { MessageSender.new(order_confirmation, client) }

  it "sends an order confirmation message to a given phone number" do
    expect(client).to receive(:new).with(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]).and_return(dbl_1 = double(:dbl_1))
    expect(dbl_1).to receive(:messages).and_return(dbl_2 = double(:dbl_2))
    expect(dbl_2).to receive(:create).with({ from: "+16093625213",
    to: "+447777777777", body: "Thank you! Your order was placed and will be delivered before 20:10"})
    expect(message_sender.send_confirmation("+447777777777")).to eq("Sent: Thank you! Your order was placed and will be delivered before 20:10")
  end
end

