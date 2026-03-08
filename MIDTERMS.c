// PIC16F877A Servo Control
// MikroC PRO for PIC

sbit SERVO at RB0_bit;
sbit SERVO_Direction at TRISB0_bit;

unsigned int i;

void servoLeft90() {
   for(i = 0; i < 50; i++) {     // repeat to hold position ~1 second
      SERVO = 1;
      delay_us(1000);            // 1ms pulse (-90°)
      SERVO = 0;
      delay_us(19000);           // rest of 20ms period
   }
}

void servoRight90() {
   for(i = 0; i < 50; i++) {
      SERVO = 1;
      delay_us(2000);            // 2ms pulse (+90°)
      SERVO = 0;
      delay_us(18000);           // rest of 20ms
   }
}

void main() {

   TRISB = 0x00;        // PORTB as output
   PORTB = 0x00;

   while(1) {

      servoLeft90();    // Move left
      delay_ms(1000);

      servoRight90();   // Move right
      delay_ms(1000);

      servoLeft90();    // Move left again
      delay_ms(1000);
   }
}