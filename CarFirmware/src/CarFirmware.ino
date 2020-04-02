/*
 * Project CarFirmware
 * Description: This firmware drives car and captures photos 
 * Author: Rohit Saidugari
 * Date: 
 */

// setup() runs once, when the device is first turned on.
void setup()
{
  pinMode(D0, OUTPUT);
  pinMode(D1, OUTPUT);
  pinMode(D2, OUTPUT);
  pinMode(D3, OUTPUT);
  Particle.subscribe("driveFront", driveFrontHandler, MY_DEVICES);
  Particle.subscribe("driveBack", driveBackHandler, MY_DEVICES);
  Particle.subscribe("steerLeft", steerLeftHandler, MY_DEVICES);
  Particle.subscribe("steerRight", steerRightHandler, MY_DEVICES);
  // Put initialization like pinMode and begin functions here.
}

// loop() runs over and over again, as quickly as it can execute.
void loop()
{
}

void driveFrontHandler(const char *event, const char *data)
{
  digitalWrite(D0, HIGH);
  delay(1000);
  digitalWrite(D0, LOW);
}
void driveBackHandler(const char *event, const char *data)
{
  digitalWrite(D1, HIGH);
  delay(1000);
  digitalWrite(D1, LOW);
}
void steerLeftHandler(const char *event, const char *data)
{
  digitalWrite(D2, HIGH);
  delay(1000);
  digitalWrite(D2, LOW);
}
void steerRightHandler(const char *event, const char *data)
{
  digitalWrite(D3, HIGH);
  delay(1000);
  digitalWrite(D3, LOW);
}