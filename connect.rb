require 'json'
require 'uri'
require 'net/http'
require 'base64'

def get_param(key) 
  arg = ARGV.select{|a| a.include?("--#{key}=")}.first
  if arg
    return arg.split('=')[1..].join('=')
  end
  return nil
end

OPENCONNECT = "C:/Program Files/OpenConnect-GUI/openconnect.exe"
USERNAME = get_param('username') || 'ikokorev@luxoft.com'
PASSWORD = get_param('password') || 'supersecurepassword'
SERVER = get_param('server') || 'vpn-oro.luxoft.com'
TOTP_SECRET = get_param('totp')

uri = URI('http://192.168.10.51:4567/')
http = Net::HTTP.new(uri.host, uri.port)

request = Net::HTTP::Get.new(uri.path)
response = http.request(request).body
if response == 'Hello World!'
  response = Net::HTTP.post_form(uri, {server: SERVER, username: USERNAME, password: Base64.encode64(PASSWORD).split('=').first, secret_2fa: TOTP_SECRET})
  cookie = response.body
else
  puts "Server not responsing right: #{response}"
  return
end

puts "Got MFA cookie #{cookie}"

puts "Closing OpenConnect in case it is running"
IO.popen("taskkill /im openconnect.exe /f")
sleep(5)

puts "Connecting with OpenConnect..."
IO.popen("\"#{OPENCONNECT}\" -u \"#{USERNAME}\" -p \"#{PASSWORD}\" -C \"#{cookie}\" --interface=\"OpenConnect\" \"#{SERVER}\"").each do |line| #
  p line.chomp
end