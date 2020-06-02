require 'twilio-ruby'

account_sid = 'ACdfed4ce7853e134f0236e22adde5f256'
auth_token = '49fdb9f226c7b51ee57d5b6fe2e4c75c'

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+33649207448",    # Replace with your phone number
    from: "+15005550006")  # Use this Magic Number for creating SMS

puts message.sid
