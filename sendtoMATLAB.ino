//#include <SPI.h>
//#include <RF24.h>

#include <Wire.h>

int16_t x = 5;
char val = 0;

void setup() {

  Wire.begin();
  Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(A0, INPUT);

}

void loop() {

// check the serial connection for messages
  if(Serial.available())
  {
    // read the value sent via serial connection
    val = Serial.read();

    // do something if there is a match
    if(val=='R') // from the matlab code

    // record analog value from pin A0
    x = analogRead(A0);

    //send data back to MATLAB through the serial connection
    Serial.println(x);

    // Blink to confirm
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
    delay(1000);    
      
  }

  // don't lock up the arduino
  delay(20);
  
}
