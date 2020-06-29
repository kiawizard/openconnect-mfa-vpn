# openconnect-mfa-vpn for Windows

Installation (Windows)

1) Install Chocolatey (https://chocolatey.org/install)
2) > choco install openconnect-gui (or you've installed it manually with "Console" checkbox checked when selecting components)
3) > choco install git
4) > choco install chromedriver
5) > choco install ruby
6) > refreshenv (if git still fails, reboot your pc)
7) > git clone https://github.com/kiawizard/openconnect-mfa-vpn.git
8) > cd openconnect-mfa-vpn
9) > bundle install
10) Create new shortcut for "ruby connect.rb --username=someone@luxoft.com --password=XxXxXxX --server=mfa-vpn.luxoft.com" without quotes. Set any name for it. Open properties, change "Start in" to the directory where you have connect.rb. Click Advanced button in the same window and turn on "Run as Adinistrator"

Tested on ruby 2.6.5.1, 2.7.1.1
