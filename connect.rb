require 'watir'
require 'pry'

def get_param(key) 
  arg = ARGV.select{|a| a.include?("--#{key}=")}.first
  if arg
    return arg.split('=').last
  end
  return nil
end

OPENCONNECT = 'C:/Program Files (x86)/OpenConnect-GUI/openconnect.exe'
USERNAME = get_param('username') || 'ikokorev@luxoft.com'
PASSWORD = get_param('password') || 'supersecurepassword'
SERVER = get_param('server') || 'mfa-vpn.luxoft.com'

browser = Watir::Browser.new #(:chrome, headless: true)
browser.goto("https://#{SERVER}/+CSCOE+/saml/sp/login?tgname=azure2fa")
browser.text_field(name: 'loginfmt').set(USERNAME)
browser.input(type: 'submit').click
browser.text_field(type: 'password').when_present.set(PASSWORD)
browser.span(id: 'submitButton').click
browser.button(value: 'Continue').click
cookie = browser.cookies['webvpn'][:value]
browser.close
puts "Got MFA cookie #{cookie}"

puts "Closing OpenConnect in case it is running"
IO.popen("taskkill /im openconnect.exe /f")
sleep(1)

puts "Connecting with OpenConnect..."
#IO.popen("\"#{OPENCONNECT}\" -u #{USERNAME} -p #{PASSWORD} -C #{cookie} mfa-vpn.luxoft.com").each do |line|
#  p line.chomp
#end

pid = spawn "powershell -Command \"Start-Process -WindowStyle hidden -FilePath \\\"#{OPENCONNECT}\\\" -ArgumentList \\\"-u #{USERNAME} -p #{PASSWORD} -C #{cookie} #{SERVER}\\\" \""
Process.detach(pid)
puts "Done, OpenConnect will establish connection in several seconds. This window will close automatically"
sleep 10
