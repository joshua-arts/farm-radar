# # Populate the graph with some random points
# points = []
# (1..10).each do |i|
#   points << { x: i, y: rand(50) }
# end
# last_x = points.last[:x]

# SCHEDULER.every '2s' do
#   points.shift
#   last_x += 1
#   points << { x: last_x, y: rand(50) }

#   send_event('convergence', points: points)
# end

require 'json'
require 'serialport'

file = File.open('out.text', 'r')

data = []
dataTemp = []
seconds = 1

SCHEDULER.every '1s' do

  @input = file.readline
  file.seek(0)

  if(@input == "0")
  	return
  end

  h = @input[@input.index("h") + 1, @input.size()]
  humidity = h[0, h.index("t")]
  t = @input[@input.index("t") + 1, @input.size()];
  temp = t[0, t.index("i")];

  data << {"x" => seconds, "y" => humidity.to_i}
  dataTemp << {"x" => seconds, "y" => temp.to_i}


  send_event('humidity-trend', points: data)
  send_event('temp-trend', points: dataTemp)
  seconds = seconds + 1

end