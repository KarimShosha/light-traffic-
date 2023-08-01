
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;light traffic .c,2 :: 		void interrupt (){
;light traffic .c,3 :: 		if(porta.b4==0){
	BTFSC      PORTA+0, 4
	GOTO       L_interrupt0
;light traffic .c,4 :: 		if(intf_bit==1){
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt1
;light traffic .c,5 :: 		intf_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;light traffic .c,6 :: 		if(portd.b2==1){
	BTFSS      PORTD+0, 2
	GOTO       L_interrupt2
;light traffic .c,7 :: 		portd.b2=0;
	BCF        PORTD+0, 2
;light traffic .c,8 :: 		portd.b0=1;
	BSF        PORTD+0, 0
;light traffic .c,9 :: 		portd.B3=0;
	BCF        PORTD+0, 3
;light traffic .c,10 :: 		portd.b4=1;
	BSF        PORTD+0, 4
;light traffic .c,11 :: 		counter2=16;
	MOVLW      16
	MOVWF      _counter2+0
	MOVLW      0
	MOVWF      _counter2+1
;light traffic .c,12 :: 		counter1=24;
	MOVLW      24
	MOVWF      _counter1+0
	MOVLW      0
	MOVWF      _counter1+1
;light traffic .c,13 :: 		}
L_interrupt2:
;light traffic .c,14 :: 		if(portd.b5==1){
	BTFSS      PORTD+0, 5
	GOTO       L_interrupt3
;light traffic .c,15 :: 		portd.b5=0;
	BCF        PORTD+0, 5
;light traffic .c,16 :: 		portd.b3=1;
	BSF        PORTD+0, 3
;light traffic .c,17 :: 		portd.b0=0;
	BCF        PORTD+0, 0
;light traffic .c,18 :: 		portd.B1=1;
	BSF        PORTD+0, 1
;light traffic .c,19 :: 		counter1=24;
	MOVLW      24
	MOVWF      _counter1+0
	MOVLW      0
	MOVWF      _counter1+1
;light traffic .c,20 :: 		counter2=16;
	MOVLW      16
	MOVWF      _counter2+0
	MOVLW      0
	MOVWF      _counter2+1
;light traffic .c,21 :: 		}
L_interrupt3:
;light traffic .c,22 :: 		}
L_interrupt1:
;light traffic .c,23 :: 		}
L_interrupt0:
;light traffic .c,26 :: 		}
L_end_interrupt:
L__interrupt40:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;light traffic .c,27 :: 		void main() {
;light traffic .c,28 :: 		trisa.b4=1;
	BSF        TRISA+0, 4
;light traffic .c,29 :: 		trisb.b0=1;
	BSF        TRISB+0, 0
;light traffic .c,30 :: 		trisc=0;
	CLRF       TRISC+0
;light traffic .c,31 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;light traffic .c,32 :: 		inte_bit=1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;light traffic .c,33 :: 		intedg_bit=1;
	BSF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;light traffic .c,34 :: 		portc=0;
	CLRF       PORTC+0
;light traffic .c,35 :: 		trisd=0;
	CLRF       TRISD+0
;light traffic .c,36 :: 		counter2=16;
	MOVLW      16
	MOVWF      _counter2+0
	MOVLW      0
	MOVWF      _counter2+1
;light traffic .c,37 :: 		counter1=24;
	MOVLW      24
	MOVWF      _counter1+0
	MOVLW      0
	MOVWF      _counter1+1
;light traffic .c,38 :: 		for(;;){
L_main4:
;light traffic .c,39 :: 		portd=0b11000000;
	MOVLW      192
	MOVWF      PORTD+0
;light traffic .c,41 :: 		for(counter=15; counter>=0; counter--){
	MOVLW      15
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_main7:
	MOVLW      128
	XORWF      _counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main42
	MOVLW      0
	SUBWF      _counter+0, 0
L__main42:
	BTFSS      STATUS+0, 0
	GOTO       L_main8
;light traffic .c,43 :: 		counter2--;
	MOVLW      1
	SUBWF      _counter2+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter2+1, 1
;light traffic .c,44 :: 		if(counter==15){
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main43
	MOVLW      15
	XORWF      _counter+0, 0
L__main43:
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;light traffic .c,45 :: 		portd.B3=1;
	BSF        PORTD+0, 3
;light traffic .c,46 :: 		portd.b1=1;
	BSF        PORTD+0, 1
;light traffic .c,47 :: 		}if(counter==12) {
L_main10:
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVLW      12
	XORWF      _counter+0, 0
L__main44:
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;light traffic .c,48 :: 		portd.b1=0;
	BCF        PORTD+0, 1
;light traffic .c,49 :: 		portd.B2=1;
	BSF        PORTD+0, 2
;light traffic .c,50 :: 		}if(counter2==12&&portd.b2==0){
L_main11:
	MOVLW      0
	XORWF      _counter2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVLW      12
	XORWF      _counter2+0, 0
L__main45:
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	BTFSC      PORTD+0, 2
	GOTO       L_main14
L__main38:
;light traffic .c,51 :: 		if(portd.b4==1){
	BTFSS      PORTD+0, 4
	GOTO       L_main15
;light traffic .c,52 :: 		portd.b4=0;
	BCF        PORTD+0, 4
;light traffic .c,53 :: 		portd.b5=1;
	BSF        PORTD+0, 5
;light traffic .c,54 :: 		}if(portd.b1==1){
L_main15:
	BTFSS      PORTD+0, 1
	GOTO       L_main16
;light traffic .c,55 :: 		portd.B1=0;
	BCF        PORTD+0, 1
;light traffic .c,56 :: 		portd.b2=1;
	BSF        PORTD+0, 2
;light traffic .c,57 :: 		}
L_main16:
;light traffic .c,58 :: 		}
L_main14:
;light traffic .c,59 :: 		left=counter /10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _left+0
	MOVF       R0+1, 0
	MOVWF      _left+1
;light traffic .c,60 :: 		right=counter %10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _right+0
	MOVF       R0+1, 0
	MOVWF      _right+1
;light traffic .c,61 :: 		for (i=0; i<=50; i++){
	CLRF       _i+0
	CLRF       _i+1
L_main17:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVF       _i+0, 0
	SUBLW      50
L__main46:
	BTFSS      STATUS+0, 0
	GOTO       L_main18
;light traffic .c,62 :: 		portd.b6=0;
	BCF        PORTD+0, 6
;light traffic .c,63 :: 		portd.b7=1;
	BSF        PORTD+0, 7
;light traffic .c,64 :: 		portc=right;
	MOVF       _right+0, 0
	MOVWF      PORTC+0
;light traffic .c,65 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	NOP
;light traffic .c,66 :: 		portd.b6=1;
	BSF        PORTD+0, 6
;light traffic .c,67 :: 		portd.B7=0;
	BCF        PORTD+0, 7
;light traffic .c,68 :: 		portc=left;
	MOVF       _left+0, 0
	MOVWF      PORTC+0
;light traffic .c,69 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	NOP
;light traffic .c,61 :: 		for (i=0; i<=50; i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;light traffic .c,70 :: 		}
	GOTO       L_main17
L_main18:
;light traffic .c,41 :: 		for(counter=15; counter>=0; counter--){
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
;light traffic .c,71 :: 		}portd=0b11000000;
	GOTO       L_main7
L_main8:
	MOVLW      192
	MOVWF      PORTD+0
;light traffic .c,72 :: 		for(counter=23; counter>=0; counter--){
	MOVLW      23
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_main22:
	MOVLW      128
	XORWF      _counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVLW      0
	SUBWF      _counter+0, 0
L__main47:
	BTFSS      STATUS+0, 0
	GOTO       L_main23
;light traffic .c,73 :: 		counter1--;
	MOVLW      1
	SUBWF      _counter1+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter1+1, 1
;light traffic .c,74 :: 		if(counter==23){
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVLW      23
	XORWF      _counter+0, 0
L__main48:
	BTFSS      STATUS+0, 2
	GOTO       L_main25
;light traffic .c,75 :: 		portd.B0=1;
	BSF        PORTD+0, 0
;light traffic .c,76 :: 		portd.b4=1;
	BSF        PORTD+0, 4
;light traffic .c,77 :: 		}if(counter==20) {
L_main25:
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVLW      20
	XORWF      _counter+0, 0
L__main49:
	BTFSS      STATUS+0, 2
	GOTO       L_main26
;light traffic .c,78 :: 		portd.b4=0;
	BCF        PORTD+0, 4
;light traffic .c,79 :: 		portd.B5=1;
	BSF        PORTD+0, 5
;light traffic .c,80 :: 		}if(counter1==20&&portd.B5==0){
L_main26:
	MOVLW      0
	XORWF      _counter1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVLW      20
	XORWF      _counter1+0, 0
L__main50:
	BTFSS      STATUS+0, 2
	GOTO       L_main29
	BTFSC      PORTD+0, 5
	GOTO       L_main29
L__main37:
;light traffic .c,81 :: 		if(portd.b4==1){
	BTFSS      PORTD+0, 4
	GOTO       L_main30
;light traffic .c,82 :: 		portd.b4=0;
	BCF        PORTD+0, 4
;light traffic .c,83 :: 		portd.b5=1;
	BSF        PORTD+0, 5
;light traffic .c,84 :: 		}if(portd.b1==1){
L_main30:
	BTFSS      PORTD+0, 1
	GOTO       L_main31
;light traffic .c,85 :: 		portd.B1=0;
	BCF        PORTD+0, 1
;light traffic .c,86 :: 		portd.b2=1;
	BSF        PORTD+0, 2
;light traffic .c,87 :: 		}
L_main31:
;light traffic .c,88 :: 		}
L_main29:
;light traffic .c,90 :: 		left=counter /10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _left+0
	MOVF       R0+1, 0
	MOVWF      _left+1
;light traffic .c,91 :: 		right=counter %10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _right+0
	MOVF       R0+1, 0
	MOVWF      _right+1
;light traffic .c,92 :: 		for (i=0; i<=50; i++){
	CLRF       _i+0
	CLRF       _i+1
L_main32:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVF       _i+0, 0
	SUBLW      50
L__main51:
	BTFSS      STATUS+0, 0
	GOTO       L_main33
;light traffic .c,93 :: 		portd.b6=0;
	BCF        PORTD+0, 6
;light traffic .c,94 :: 		portd.b7=1;
	BSF        PORTD+0, 7
;light traffic .c,95 :: 		portc=right;
	MOVF       _right+0, 0
	MOVWF      PORTC+0
;light traffic .c,96 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	NOP
;light traffic .c,97 :: 		portd.b6=1;
	BSF        PORTD+0, 6
;light traffic .c,98 :: 		portd.B7=0;
	BCF        PORTD+0, 7
;light traffic .c,99 :: 		portc=left;
	MOVF       _left+0, 0
	MOVWF      PORTC+0
;light traffic .c,100 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	NOP
;light traffic .c,92 :: 		for (i=0; i<=50; i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;light traffic .c,101 :: 		}
	GOTO       L_main32
L_main33:
;light traffic .c,72 :: 		for(counter=23; counter>=0; counter--){
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
;light traffic .c,102 :: 		}
	GOTO       L_main22
L_main23:
;light traffic .c,103 :: 		}
	GOTO       L_main4
;light traffic .c,104 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
