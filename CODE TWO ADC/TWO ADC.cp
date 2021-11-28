#line 1 "E:/Software and Electronic wilcom/PROGRAMS/16f676 two ADC/CODE TWO ADC/TWO ADC.c"
int set_ch,main_ch;
sbit LED1_1 at RC0_BIT;
void led_blinking(char ch_0_1)
{
 if (main_ch >= set_ch)
 {
 LED1_1=1;
 }
 else if (main_ch < set_ch)
 {
 LED1_1=0;
 }
}

void main()
{
 ADCON1=4;
 ANSEL=0;
 ANSEL.ANS0=1;
 ANSEL.ANS3=1;

 TRISC=0;
 PORTC=0;

 PORTA=255;
 PORTA=0;

 ADC_Init();
 while(1)
 {
 main_ch = ADC_Read(0);
 set_ch = ADC_Read(3);
 led_blinking(1);
 DELAY_MS(500);
 }
}
