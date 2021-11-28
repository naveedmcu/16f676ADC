
_led_blinking:

;TWO ADC.c,3 :: 		void led_blinking(char ch_0_1)
;TWO ADC.c,5 :: 		if (main_ch >= set_ch)
	MOVLW      128
	XORWF      _main_ch+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _set_ch+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__led_blinking7
	MOVF       _set_ch+0, 0
	SUBWF      _main_ch+0, 0
L__led_blinking7:
	BTFSS      STATUS+0, 0
	GOTO       L_led_blinking0
;TWO ADC.c,7 :: 		LED1_1=1;
	BSF        RC0_bit+0, 0
;TWO ADC.c,8 :: 		}
	GOTO       L_led_blinking1
L_led_blinking0:
;TWO ADC.c,9 :: 		else if (main_ch < set_ch)
	MOVLW      128
	XORWF      _main_ch+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _set_ch+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__led_blinking8
	MOVF       _set_ch+0, 0
	SUBWF      _main_ch+0, 0
L__led_blinking8:
	BTFSC      STATUS+0, 0
	GOTO       L_led_blinking2
;TWO ADC.c,11 :: 		LED1_1=0;
	BCF        RC0_bit+0, 0
;TWO ADC.c,12 :: 		}
L_led_blinking2:
L_led_blinking1:
;TWO ADC.c,13 :: 		}
L_end_led_blinking:
	RETURN
; end of _led_blinking

_main:

;TWO ADC.c,15 :: 		void main()
;TWO ADC.c,17 :: 		ADCON1=4;
	MOVLW      4
	MOVWF      ADCON1+0
;TWO ADC.c,18 :: 		ANSEL=0;
	CLRF       ANSEL+0
;TWO ADC.c,19 :: 		ANSEL.ANS0=1;
	BSF        ANSEL+0, 0
;TWO ADC.c,20 :: 		ANSEL.ANS3=1;
	BSF        ANSEL+0, 3
;TWO ADC.c,22 :: 		TRISC=0;
	CLRF       TRISC+0
;TWO ADC.c,23 :: 		PORTC=0;
	CLRF       PORTC+0
;TWO ADC.c,25 :: 		PORTA=255;
	MOVLW      255
	MOVWF      PORTA+0
;TWO ADC.c,26 :: 		PORTA=0;
	CLRF       PORTA+0
;TWO ADC.c,28 :: 		ADC_Init();
	CALL       _ADC_Init+0
;TWO ADC.c,29 :: 		while(1)
L_main3:
;TWO ADC.c,31 :: 		main_ch = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _main_ch+0
	MOVF       R0+1, 0
	MOVWF      _main_ch+1
;TWO ADC.c,32 :: 		set_ch = ADC_Read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _set_ch+0
	MOVF       R0+1, 0
	MOVWF      _set_ch+1
;TWO ADC.c,33 :: 		led_blinking(1);
	MOVLW      1
	MOVWF      FARG_led_blinking_ch_0_1+0
	CALL       _led_blinking+0
;TWO ADC.c,34 :: 		DELAY_MS(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;TWO ADC.c,35 :: 		}
	GOTO       L_main3
;TWO ADC.c,36 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
