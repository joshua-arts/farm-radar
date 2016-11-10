//user don't have DHT library should install the following library: https://github.com/adafruit/DHT-sensor-library
#include <DHT.h>
const int DHTpin = 19;
DHT dht(DHTpin, DHT11);
const int liquidlevpin = 20;
const int motionpin = 23;
const int lightpin = 6;
const int airqualpin = 7;
const int firepin = 9;
int airqualityval;
int airqual;
int lightval;
int light;
String data;
void setup() 
{
  Serial.begin(9600);
  dht.begin();
}
void loop() 
  {
  airqualityval = analogRead(airqualpin);       // read analog input pin 0
  if (airqualityval < 200){
    airqual = 0;
    
  }else{
    airqual = 1;
  }
  //air quality, 1 means bad, 0 means normal
  data =  data + 'a';
  data = data + airqual;
  
  //humidity(h), temperature(t), and heat index(i), exact value
  int humid = dht.readHumidity();
  int temp = dht.readTemperature();
  int heatindex = dht.computeHeatIndex(temp, humid, false);
  data = data + "h";
  data = data + humid;
  data = data + "t";
  data = data + temp;
  data = data + "i";
  data = data + heatindex;
  //liquid water level, 1 means out of water, 0 means in the water
  data = data + "l";
  data = data + digitalRead(liquidlevpin);
  //bringness, 0 means not enough light, 1 means normal, 2 means too much light
  
  data = data + "b";
 
  lightval = analogRead(lightpin);
  if (lightval < 300){
    light = 0;
  }else if (lightval > 900){
    light = 2;
  }else {
    light = 1;
  }
  data = data + light;
  //motion, 0 means nothing moves, 1 means something moves
  data = data + "m";
  data = data + digitalRead(motionpin);
  //soil mosture, 0 means too dry, 1 means normal, 2 means too wet
  
  data = data + "s";
  int thresholdUp = 400;
  int thresholdDown = 250;
  int mosture;
   if (analogRead(8) < thresholdDown){
    mosture = 0;
  }else if (analogRead(8) > thresholdUp){
    mosture = 2;
  }else{
    mosture = 1;
  }
  data = data + mosture;
  //fire 0 means no fire, 1 means fire
  data = data + "f";
  int fireval = analogRead(firepin);
  if (fireval > 100){
    data = data + "1";
  }else{
    data = data + "0";
  }
  
  
  data = data + "\n";
  Serial.flush();
  Serial.print(data);
  Serial.flush();
  data = "";
  
  }
