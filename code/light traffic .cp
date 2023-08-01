#line 1 "D:/College/2st_Summer training/project/code/light traffic .c"
int counter, left, right, i, counter2, counter1;
void interrupt (){
 if(porta.b4==0){
 if(intf_bit==1){
 intf_bit=0;
 if(portd.b2==1){
 portd.b2=0;
 portd.b0=1;
 portd.B3=0;
 portd.b4=1;
 counter2=16;
 counter1=24;
 }
 if(portd.b5==1){
 portd.b5=0;
 portd.b3=1;
 portd.b0=0;
 portd.B1=1;
 counter1=24;
 counter2=16;
 }
 }
 }


}
void main() {
 trisa.b4=1;
 trisb.b0=1;
 trisc=0;
 gie_bit=1;
 inte_bit=1;
 intedg_bit=1;
 portc=0;
 trisd=0;
 counter2=16;
 counter1=24;
 for(;;){
 portd=0b11000000;

 for(counter=15; counter>=0; counter--){

 counter2--;
 if(counter==15){
 portd.B3=1;
 portd.b1=1;
 }if(counter==12) {
 portd.b1=0;
 portd.B2=1;
 }if(counter2==12&&portd.b2==0){
 if(portd.b4==1){
 portd.b4=0;
 portd.b5=1;
 }if(portd.b1==1){
 portd.B1=0;
 portd.b2=1;
 }
 }
 left=counter /10;
 right=counter %10;
 for (i=0; i<=50; i++){
 portd.b6=0;
 portd.b7=1;
 portc=right;
 delay_ms(10);
 portd.b6=1;
 portd.B7=0;
 portc=left;
 delay_ms(10);
 }
 }portd=0b11000000;
 for(counter=23; counter>=0; counter--){
 counter1--;
 if(counter==23){
 portd.B0=1;
 portd.b4=1;
 }if(counter==20) {
 portd.b4=0;
 portd.B5=1;
 }if(counter1==20&&portd.B5==0){
 if(portd.b4==1){
 portd.b4=0;
 portd.b5=1;
 }if(portd.b1==1){
 portd.B1=0;
 portd.b2=1;
 }
 }

 left=counter /10;
 right=counter %10;
 for (i=0; i<=50; i++){
 portd.b6=0;
 portd.b7=1;
 portc=right;
 delay_ms(10);
 portd.b6=1;
 portd.B7=0;
 portc=left;
 delay_ms(10);
 }
 }
 }
}
