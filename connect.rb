require 'watir'
#require 'pry'

OPENCONNECT = 'C:/Program Files (x86)/OpenConnect-GUI/openconnect.exe'
USERNAME = 'ikokorev@luxoft.com'
PASSWORD = 'supersecurepassword'

browser = Watir::Browser.new #(:chrome, headless: true)
browser.goto('https://mfa-vpn.luxoft.com/+CSCOE+/saml/sp/login?tgname=azure2fa')
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
IO.popen("\"#{OPENCONNECT}\" -u #{USERNAME} -p #{PASSWORD} -C #{cookie} mfa-vpn.luxoft.com").each do |line|
  p line.chomp
end
