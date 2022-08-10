int pos = 100;
 
void setup() 
{ 
  delay(1000);
  Serial.begin(115200);
} 
 
void loop() 
{ 
  if (Serial.available() > 0) {
  Serial.print(pos);  //模拟传感器输出
  delay(1500);
  }
}
