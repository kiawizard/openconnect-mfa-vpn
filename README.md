# openconnect-mfa-vpn for Windows

Installation (Windows)

1) Install Chocolatey (https://chocolatey.org/install)
2) > choco install chromedriver
3) > choco install ruby
4) > refreshenv
5) > git clone https://github.com/kiawizard/openconnect-mfa-vpn.git
6) > cd openconnect-mfa-vpn
7) > bundle install
8) Create new shortcut for "ruby connect.rb --username=someone@luxoft.com --password=XxXxXxX --server=mfa-vpn.luxoft.com" without quotes. Set any name for it. Open properties, change "Start in" to the directory where you have connect.rb. Click Advanced button in the same window and turn on "Run as Adinistrator"

Tested on ruby 2.6.5.1, 2.7.1.1
