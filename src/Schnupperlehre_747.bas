'
'****************************************************************************************************************
'* (c)  S M A R T R O N I C												       *
'****************************************************************************************************************
'*															       	*
'* Schnupperlehre Print V2											*
'*                         											*
'* Autor: Yannick Bollier 											*
'* 																	*
'* Erstellt: 10 Mai 2022											*
'* 																    *
'* Update:															*
'* 																    *
'* 																    *
'* Dateiname: X747_A21										     	*
'* 																    *
'****************************************************************************************************************

'*********************
'Assembler Directives
'*********************

'Benutzter Controller
Device		16F628

'Fuse settings --> Interner MCLR
Reminders 	False  
Config 	HS_OSC , WDT_OFF , PWRTE_ON , BODEN_ON, MCLRE_OFF, LVP_OFF , CP_OFF
Reminders 	True  

'Deklarationen Allgemein
Declare 	Xtal			20					'Resonator 
Declare	Bootloader		0					'Ohne Bootloader
Declare	Watchdog		Off
  
'************
'Deklaration
'************

'Eing�nge
Symbol GRAU	=	PORTA.0
Symbol GELB	=	PORTA.1
Symbol GRUEN	=	PORTA.2
Symbol BLAU	=	PORTA.3
'symbol    	=	porta.4

'Ausg�nge
Symbol Led1	=	PORTB.0				
Symbol Led2   =	PORTB.1
Symbol Led3	=	PORTB.2
Symbol Led4	=	PORTB.3
Symbol Led5	=	PORTB.4
Symbol Led6	=	PORTB.5
Symbol Led7	=	PORTB.6
Symbol Led8	=	PORTB.7

'Variablen

Dim	TempW	As	Word
Dim 	cnt    As  	Byte
Dim	dir	As	Bit

'Konstanten allgemein
Dim	False	As	0
Dim	True	As	1
Dim	Ein	As	1
Dim	Aus	As	0


'****************		
'Initialisierung
'****************
'tris: 0=Output, 1=Input  

Ini:	TRISA=%00001111						'DIR PortA 
	PORTA=%00000000						'Reset PortA
		
	TRISB=%00000000						'DIR PortB
	PORTB=%00000000						'Reset PortB	

	CMCON=%00000111						'Comparatoren ausschalten
	cnt = 0
	dir = 0

'********************
'Mainloop
'********************
Main:	
	
	gosub ALLESaUS
	delayms 500
 	GoSub AllesEin
 	delayms 500
 	gosub ALLESaUS
	delayms 500
	
	GoSub InnenNachAussenEIN
	GoSub AussenNachInnenAUS
	
	GoSub InnenNachAussenEIN
 	GoSub AussenNachInnenAUS
 	
 	GoSub AussenNachInnenEin
 	Gosub aussenNachInnenAus
 	
 	GoSub Zufall
 	GoSub Zufall2
	
 	GoSub AussenNachInnenEin
 	Gosub aussenNachInnenAus
 	
 	gosub ALLESaUS
	delayms 500
	
       Goto Main		'Mainloop
	
AllesAus:
	Led1 =aus
	Led2 = Aus
	Led3 = Aus
	Led4 =Aus
	Led5 = aus
	Led6 = Aus
	Led7 = Aus
	Led8 = Aus
	return
	
AllesEin:
	Led1 = Ein
	Led2 = Ein
	Led3 = Ein
	Led4 =Ein
	Led5 = Ein
	Led6 = Ein
	Led7 = Ein
	Led8 = Ein
	return
	
InnenNachAussenEIN:	
	'Von innen nach aussen - Ein
	led4 = ein
	led5 = ein
	delayms 500
	Led3 = ein
	Led6 = ein
	delayms 500
	Led2 = ein
	Led7 = ein
	delayms 500
	Led1 = ein
	Led8 = ein
	delayms 500 
	Return	
	
AussenNachInnenAUS:		
	'Von aussen nach innen - Aus
	led8 = aus
	led1 = aus
	delayms 500
	Led7 = aus
	Led2 = aus
	delayms 500
	Led6 = aus
	Led3 = aus
	delayms 500
	Led4 = aus
	Led5 = aus
	delayms 1000	
	Return	
	
AussenNachInnenEIN:
	'Von aussen nach innen - Ein
	led8 = ein
	led1 = ein
	delayms 500
	Led7 = ein
	Led2 = ein
	delayms 500
	Led6 = ein
	Led3 = ein
	delayms 500
	Led5 = ein
	Led4 = ein
	delayms 500 
	Return
	
Zufall:	
	'zufall
      	Led7 = ein
      	delayms 500
 	Led2 = ein
 	Led7 = aus
  	delayms 500
 	Led2 = aus 
 	Led6 = ein  
	delayms 500
	Led6 = aus 
	Led3 = ein
	delayms 500
	Led3 = aus
	Led4 = ein
	delayms 500
	Led4 = aus
	Led5 = ein
	delayms 500
	Led5 = aus
	led8 = ein
	delayms 500
	led8 = aus
	led1 = ein
	delayms 500
	led1 = aus
	delayms 1000
	rETURN	
	
Zufall2:
	'Zufallgenerator
       Led1 = Ein
       delayms 500
       Led1 = Aus
       Led8 = Ein
       delayms 500
       Led8 = Aus
       led4 = Ein
       delayms 500
       Led4 = Aus
       Led2 = Ein
       delayms 500
       Led2 = Aus
       Led6 = Ein
       delayms 500
       Led6 = aus 
       Led3 = Ein
	delayms 500
       Led3 = Aus
       Led7 = Ein
       delayms 500
       Led7 = Aus
       Led5 = Ein
       delayms 500
       Led5 = Aus
       Return
       			
 
		
End		
