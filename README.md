# Farm Radar

Farm Radar a modular remote sensing system built by Joshua Arts, Jason Cheung, Mohammed Ridwanul and Simon Guo Zirui. It was developed over thirty-six hours for [Electric City Hacks 2016](http://2016.echacks.xyz) at Trent University. The project was highly successful, winning both the SAP award for project management and third place overall.

You can also checkout the [devpost](https://devpost.com/software/farm-radar) for this project!

![alt text](http://oi68.tinypic.com/15rm52b.jpg "Farm Rader Module")

Farm Radar uses an [Arduino](https://www.arduino.cc) and multiple sensors to track environmental data such as moisture, humidity, light levels, etc. It is also equipped with a nestcam so it can provide a video feed wherever it is set up. All of this data is then sent to a server where it is logged every few seconds. You can then access this data and track trends and potential hazards using an online dashboard web app developed using [Sinatra](https://github.com/sinatra/sinatra) and [Dashing](http://dashing.io). One of the key features is that it is designed to be 100% modular, so you can remove and add new sensors as you wish (up to eight total).

![alt text](http://oi66.tinypic.com/30a5krm.jpg "Wiring")
The wiring for the Farm Rader module.

![alt text](http://oi65.tinypic.com/2isur1e.jpg "Dashboard")
An early development version of UI for dashboard web app.

![alt text](http://oi66.tinypic.com/16kdf2w.jpg "Team")
Left to Right: Mohammed Ridwanul, Jason Cheung, Simon Guo Zirui, Joshua Arts.
