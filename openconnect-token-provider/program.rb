require 'sinatra'
require 'watir'
require 'rotp'
require 'base64'

configure { 
  set :server, :puma
  set :environment, :production
}

get '/' do
  "Hello World!"
end

post '/' do
  content_type :json
  Watir.default_timeout = 300
  browser = Watir::Browser.new(:edge)

  browser.goto("https://#{params[:server]}")
  browser.text_field(name: 'loginfmt').set(params[:username])
  browser.input(type: 'submit').click
  sleep(5)
  browser.text_field(type: 'password').set(Base64.decode64(params[:password]))
  browser.input(type: 'submit').click
  
  totp = ROTP::TOTP.new(params[:secret_2fa], issuer: 'ROTP')
  browser.text_field(name: 'otc').set(totp.now)
  browser.input(type: 'submit').click
  
  browser.button(value: 'Continue').click
  
  cookie = browser.cookies['webvpn'][:value]
  browser.close
  cookie
end