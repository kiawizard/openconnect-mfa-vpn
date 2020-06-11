# openconnect-mfa-vpn for Windows

Installation (Windows)

1) Install Chocolatey (https://chocolatey.org/install)
2) > choco install git
3) > choco install chromedriver
4) > choco install ruby
5) > refreshenv (if git still fails, reboot your pc)
6) > git clone https://github.com/kiawizard/openconnect-mfa-vpn.git
7) > cd openconnect-mfa-vpn
8) > bundle install
9) Create new shortcut for "ruby connect.rb --username=someone@luxoft.com --password=XxXxXxX --server=mfa-vpn.luxoft.com" without quotes. Set any name for it. Open properties, change "Start in" to the directory where you have connect.rb. Click Advanced button in the same window and turn on "Run as Adinistrator"

Tested on ruby 2.6.5.1, 2.7.1.1
