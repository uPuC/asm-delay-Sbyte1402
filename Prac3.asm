;------------- definiciones e includes ------------------------------
.INCLUDE "m1280def.inc" ; Incluir definiciones de Registros para 1280
;.INCLUDE "m2560def.inc" ; Incluir definiciones de Registros para 2560

.equ INIT_VALUE = 0 ; Valor inicial R24

;------------- inicializar ------------------------------------------
ldi R24,INIT_VALUE
;------------- implementar ------------------------------------------
;call delay20uS
CALL delay20uS

;call delay4mS
CALL delay4mS

;call delay1S
CALL delay1S

;call myRand ; Retorna valor en R25
;------------- ciclo principal --------------------------------------
delay20uS:
    LDI R20, 62

    next:   NOP
            DEC R20
            CPI R20, 0
            BRNE next
RET

delay4mS:
    LDI R20, 90

    next2:  LDI R21, 101
        next3:  NOP
                NOP
                NOP
                DEC R21
                CPI R21, 0
                BRNE next3
        DEC R20
        CPI R20, 0
        BRNE next2
RET

delay1S:
    LDI R20, 241

    next4:  LDI R21, 144
            NOP
            NOP

        next5:  LDI R22, 114
                NOP

            next6:  DEC R22
                        CPI R22, 0
                        BRNE next6

                DEC R21
                CPI R21, 0
                BRNE next5

            DEC R20
            CPI R20, 0
            BRNE next4
RET

arriba: inc R24
	cpi R24,10
	breq abajo
	out PORTA,R24
	rjmp arriba

abajo: dec R24
	cpi R24,0
	breq arriba
	out PORTA,R24
	rjmp abajo
