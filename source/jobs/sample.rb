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
  i = @input[@input.index("i") + 1, @input.size()];
  heatindex = i[0, i.index("l")];
  l = @input[@input.index("l") + 1, @input.size()];
  waterlevel = l[0, l.index("b")];
  b = @input[@input.index("b") + 1, @input.size()];
  brightness = b[0, b.index("m")];
  m = @input[@input.index("m") + 1, @input.size()];
  motion = m[0, m.index("s")];
  s = @input[@input.index("s") + 1, @input.size()];
  soil_moisture = s[0, s.index("f")];
  fire = @input[@input.size() - 2];

  puts fire

  if (fire.to_i == 1)
  	send_event('fire', {text: "DANGER LEVELS!"})
  else
  	send_event('fire', {text: "NO HAZARDS."})
  end

  if (motion.to_i == 1)
  	send_event('motion', {text: "MOTION DETECTED!"})
  else
  	send_event('motion', {text: "NO MOTION."})
  end

  if (soil_moisture.to_i == 0)
    send_event('moisture', {text: "TOO DRY."})
  elsif (soil_moisture.to == 1)
    send_event('moisture', {text: "NORMAL."})
  else 
    send_event('moisture',{text: "LOW."})
  end

  if (brightness.to_i == 1)
  	send_event('bright', {text: "MODERATE."})
  elsif (brightness.to_i == 2)
  	send_event('bright', {text: "BRIGHT."})
  else
  	send_event('bright', {text: "DIM."})
  end

  if (waterlevel.to_i == 0)
  	send_event('water', {text: "HIGH."})
  else
  	send_event('water', {text: "NORMAL."})
  end

  send_event('humidity-meter', {value: humidity})
  send_event('temp-meter', {value: temp})

end
