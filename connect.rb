require 'watir'
require 'rotp'

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
SERVER = get_param('server') || 'vpn.luxoft.com'
TOTP_SECRET = get_param('totp')

Watir.default_timeout = 300
browser = Watir::Browser.new(:edge) #(:chrome, headless: true)
browser.goto("https://#{SERVER}")
browser.text_field(name: 'loginfmt').set(USERNAME)
browser.input(type: 'submit').click
sleep(5)
browser.text_field(type: 'password').set(PASSWORD)
browser.input(type: 'submit').click


if TOTP_SECRET
  totp = ROTP::TOTP.new(TOTP_SECRET, issuer: "ROTP")
  browser.text_field(name: 'otc').set(totp.now)
  browser.input(type: 'submit').click
end

browser.button(value: 'Continue').click

cookie = browser.cookies['webvpn'][:value]
browser.close
puts "Got MFA cookie #{cookie}"

puts "Closing OpenConnect in case it is running"
IO.popen("taskkill /im openconnect.exe /f")
sleep(1)

puts "Connecting with OpenConnect..."
IO.popen("\"#{OPENCONNECT}\" -u #{USERNAME} -p #{PASSWORD} -C #{cookie} #{SERVER}").each do |line| #
  p line.chomp
end