require 'json'
require 'serialport'

port_str = "/dev/cu.usbmodem1421"  
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

while true do
  file = File.open('dash-int/out.text', File::RDWR)
  file.seek(0)
  file.write(sp.readline)
  file.seek(0)
  puts file.readline
  file.close
end