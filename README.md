# openconnect-mfa-vpn for Windows

Installation (Windows)

1) Install https://www.infradead.org/openconnect-gui/download/openconnect-gui-1.5.3-win32.exe (later versions use tun instead of tap, it can cause problems, try yourself)
2) Install https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.4.3-1/rubyinstaller-devkit-3.4.3-1-x64.exe (or latest with devkit from https://rubyinstaller.org/downloads/)
3) > git clone https://github.com/kiawizard/openconnect-mfa-vpn.git
4) > cd openconnect-mfa-vpn
5) > bundle install
6) Create new shortcut for "ruby connect.rb --username=someone@luxoft.com --password=XxXxXxX --server=vpn.luxoft.com --totp=abcdefghijkl" without quotes. Set any name for it. Open properties, change "Start in" to the directory where you have connect.rb. Click Advanced button in the same window and turn on "Run as Administrator"

Tested on ruby 2.6.5.1, 2.7.1.1, 2.7.2.1, 3.3.5