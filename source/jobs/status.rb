require 'json'
require 'serialport'

file = File.open('out.text', 'r')

SCHEDULER.every '1s' do

  @input = file.readline
  file.seek(0)

  if(@input == "0")
    return;
  end

  moisture = @input[1];
  h = @input[@input.index("h") + 1, @input.size()];
  humidity = h[0, h.index("t")];
  t = @input[@input.index("t") + 1, @input.size()];
  temp = t[0, t.index("i")];
  

  send_event('humidity_score', {value: humidity})
  send_event('temp_score', {value: temp})
  
  if (moisture.to_i ==0)
    send_event('moisture_score',{value: 50})
  elsif(moisture.to_i ==1)
    send_event('moisture_score',{value:100})
  end
end
