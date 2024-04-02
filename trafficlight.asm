 .include "m328pdef.inc"
 .org 0
 rjmp main
 main:
 ldi r16, low(RAMEND) ;set up stack com3
 out spl,r16
 ldi r16, high (RAMEND)
 out sph,r16
 ldi r16, 0xFF ;
 out DDRB,r16 ;I/O mapped (see
 m328pdef.inc)

 L1: ldi r16, 0X21 ;North-South Green for
 50 seconds, East-West Red for 50
 Seconds, uses 00100001 in hex

 out portB,r16
 rcall mydelay
 ldi r16,0x22 ;North-South Yellow for 10
 seconds, East-West Red for 10 seconds,
 uses 00100010 in hex

 out portB,r16
 rcall mydelay
 ldi r16,0X0C ;North-South Red for 50
 seconds, East-West Green for 50 seconds,
 uses 00001100 in hex

 out portB,r16
 rcall mydelay
 ldi r16,0X14 ;North-South Red for 10
 seconds, East-West Yellow for 10 seconds,
 uses 00010100 in hex

 out portB,r16
 rcall mydelay
 rjmp L1
 ldi r17,0x52 ;; outer loop
 L2: ldi r18,0xFF ;; inner loop
 L3: ldi r19,0xFF ;; inner most loop
 L4: dec r19
 brne L4
 L5: dec r18
 brne L3
 dec r17
 brne L2
 ret

 shortdelay: ;calls mydelay ten times create
 ten seconds of delay
 rcall mydelay
 rcall mydelay
 rcall mydelay
 rcall mydelay
 rcall mydelay
 rcall mydelay
 rcall mydelay
 rcall mydelay
 rcall mydelay
 rcall mydelay
 ret

 longdelay: ;calls shortdelay five times to
 create fifty seconds of delay
 rcall shortdelay
 rcall shortdelay
 rcall shortdelay
 rcall shortdelay
 rcall shortdelay
 re