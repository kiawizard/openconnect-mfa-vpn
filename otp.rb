require 'rotp'

secret = ARGV[0]

key = 'g'
while key == 'g'
  totp = ROTP::TOTP.new(secret, issuer: "ROTP")
  puts totp.now
  puts "Write g[ENTER] to generate again or [ENTER] to exit"
  key = STDIN.gets.chomp
end