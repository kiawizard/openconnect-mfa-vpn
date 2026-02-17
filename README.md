# openconnect-mfa-vpn Client-Server version for Windows

Installation (Windows)

Client
git clone https://github.com/kiawizard/openconnect-mfa-vpn.git
cd openconnect-mfa-vpn
bundle install
Create new shortcut for C:\Ruby40-x64\bin\ruby.exe connect.rb --server="..............." --totp="..............." --password="...............". Set any name for it. Open properties, change "Start in" to the directory where you have connect.rb. Click Advanced button in the same window and turn on "Run as Administrator"

Server
git clone https://github.com/kiawizard/openconnect-mfa-vpn.git
cd openconnect-mfa-vpn/openconnect-token-provider
bundle install
ruby program.rb
