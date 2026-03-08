
_servoLeft90:

;MIDTERMS.c,9 :: 		void servoLeft90() {
;MIDTERMS.c,10 :: 		for(i = 0; i < 50; i++) {     // repeat to hold position ~1 second
	CLRF       _i+0
	CLRF       _i+1
L_servoLeft900:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__servoLeft9016
	MOVLW      50
	SUBWF      _i+0, 0
L__servoLeft9016:
	BTFSC      STATUS+0, 0
	GOTO       L_servoLeft901
;MIDTERMS.c,11 :: 		SERVO = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;MIDTERMS.c,12 :: 		delay_us(1000);            // 1ms pulse (-90°)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_servoLeft903:
	DECFSZ     R13+0, 1
	GOTO       L_servoLeft903
	DECFSZ     R12+0, 1
	GOTO       L_servoLeft903
	NOP
	NOP
;MIDTERMS.c,13 :: 		SERVO = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;MIDTERMS.c,14 :: 		delay_us(19000);           // rest of 20ms period
	MOVLW      50
	MOVWF      R12+0
	MOVLW      88
	MOVWF      R13+0
L_servoLeft904:
	DECFSZ     R13+0, 1
	GOTO       L_servoLeft904
	DECFSZ     R12+0, 1
	GOTO       L_servoLeft904
	NOP
;MIDTERMS.c,10 :: 		for(i = 0; i < 50; i++) {     // repeat to hold position ~1 second
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MIDTERMS.c,15 :: 		}
	GOTO       L_servoLeft900
L_servoLeft901:
;MIDTERMS.c,16 :: 		}
L_end_servoLeft90:
	RETURN
; end of _servoLeft90

_servoRight90:

;MIDTERMS.c,18 :: 		void servoRight90() {
;MIDTERMS.c,19 :: 		for(i = 0; i < 50; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_servoRight905:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__servoRight9018
	MOVLW      50
	SUBWF      _i+0, 0
L__servoRight9018:
	BTFSC      STATUS+0, 0
	GOTO       L_servoRight906
;MIDTERMS.c,20 :: 		SERVO = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;MIDTERMS.c,21 :: 		delay_us(2000);            // 2ms pulse (+90°)
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_servoRight908:
	DECFSZ     R13+0, 1
	GOTO       L_servoRight908
	DECFSZ     R12+0, 1
	GOTO       L_servoRight908
	NOP
;MIDTERMS.c,22 :: 		SERVO = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;MIDTERMS.c,23 :: 		delay_us(18000);           // rest of 20ms
	MOVLW      47
	MOVWF      R12+0
	MOVLW      191
	MOVWF      R13+0
L_servoRight909:
	DECFSZ     R13+0, 1
	GOTO       L_servoRight909
	DECFSZ     R12+0, 1
	GOTO       L_servoRight909
	NOP
	NOP
;MIDTERMS.c,19 :: 		for(i = 0; i < 50; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MIDTERMS.c,24 :: 		}
	GOTO       L_servoRight905
L_servoRight906:
;MIDTERMS.c,25 :: 		}
L_end_servoRight90:
	RETURN
; end of _servoRight90

_main:

;MIDTERMS.c,27 :: 		void main() {
;MIDTERMS.c,29 :: 		TRISB = 0x00;        // PORTB as output
	CLRF       TRISB+0
;MIDTERMS.c,30 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MIDTERMS.c,32 :: 		while(1) {
L_main10:
;MIDTERMS.c,34 :: 		servoLeft90();    // Move left
	CALL       _servoLeft90+0
;MIDTERMS.c,35 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;MIDTERMS.c,37 :: 		servoRight90();   // Move right
	CALL       _servoRight90+0
;MIDTERMS.c,38 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;MIDTERMS.c,40 :: 		servoLeft90();    // Move left again
	CALL       _servoLeft90+0
;MIDTERMS.c,41 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;MIDTERMS.c,42 :: 		}
	GOTO       L_main10
;MIDTERMS.c,43 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
