#line 1 "D:/COLLEGE/CPE/O3A/SEM 2/CpElect1/MIDTERMS/MIDTERMS.c"



sbit SERVO at RB0_bit;
sbit SERVO_Direction at TRISB0_bit;

unsigned int i;

void servoLeft90() {
 for(i = 0; i < 50; i++) {
 SERVO = 1;
 delay_us(1000);
 SERVO = 0;
 delay_us(19000);
 }
}

void servoRight90() {
 for(i = 0; i < 50; i++) {
 SERVO = 1;
 delay_us(2000);
 SERVO = 0;
 delay_us(18000);
 }
}

void main() {

 TRISB = 0x00;
 PORTB = 0x00;

 while(1) {

 servoLeft90();
 delay_ms(1000);

 servoRight90();
 delay_ms(1000);

 servoLeft90();
 delay_ms(1000);
 }
}
