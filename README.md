# luxoft-mfa-vpn

Installation (Windows)

1) Install Chocolatey (https://chocolatey.org/install)
2) > choco install chromedriver
3) > choco install ruby --version '2.6.5.1'
4) > refreshenv
5) > git clone https://github.com/kiawizard/openconnect-mfa-vpn.git
6) > cd openconnect-mfa-vpn
7) > bundle install
8) Edit connect.rb to ensure variables have correct values
9) Ensure your command prompt runs with Administrator privileges, or create a shortcut, click rmb on it, Properties, Advanced, Run as administrator
10) > ruby connect.rb
11) Do not close the console window, it will cause disconnect
