# openconnect-mfa-vpn for Windows

Installation (Windows)

1) Install Chocolatey (https://chocolatey.org/install)
2) > choco install openconnect-gui git chromedriver -y (remove openconnect from the list if you've installed it manually with "Console" checkbox checked when selecting components)
3) > choco install ruby --version=2.7.2.1 -y
4) > refreshenv (if git still fails, reboot your pc)
5) > git clone https://github.com/kiawizard/openconnect-mfa-vpn.git
6) > cd openconnect-mfa-vpn
7) > gem install bundler:1.17.2
8) > bundle install
9) Create new shortcut for "ruby connect.rb --username=someone@luxoft.com --password=XxXxXxX --server=mfa-vpn.luxoft.com" without quotes. Set any name for it. Open properties, change "Start in" to the directory where you have connect.rb. Click Advanced button in the same window and turn on "Run as Administrator"

!Important!
After Chrome updates itself:
> choco upgrade chromedriver -y

Tested on ruby 2.6.5.1, 2.7.1.1, 2.7.2.1
