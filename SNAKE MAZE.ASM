	MOV	AL,FF		;reiniciar jogo
	OUT	04		;copia o conteúdo de al para a porta 04
	MOV	AL,01		;Distancia 01 em AL
	MOV	BL,01		;copiando a distancia para BL
	OUT	04		;copiando o conteúdo de AL para a porta 04

START:	
	IN	00		;espera o usuário digitar um caracter		
	CMP	AL,32		;verifica se o usuário digitou o numero 2
	JZ	DOWN		;caso tenha digitado o número 2, pula para a parte "DOWN"
	CMP	AL,34		;verifica se o usuário digitou o número 4
	JZ	LEFT		;caso tenha digitado o número 4, pula para a parte "LEFT"
	CMP	AL,36		;verifica se o usuário digitou o número 6
	JZ	RIGHT		;caso tenha digitado o número 6, pula para a parte "RIGHT"
	CMP	AL,38		;verifica se o usuário digitou o número 8
	JZ	UP		;caso tenha digitado o número 8, pula para a parte "UP"
	CMP	AL,39		;verifica se o usuário digitou o número 9
	JZ	SPEEDUP		;caso tenha digitado o número 9, pula para a parte "SPEEDUP"
	CMP	AL,33		;verifica se o usuário digitou o número 3
	JZ	SPEEDDOWN	;caso tenha digitado o número 3, pula para a parte "SPEEDDOWN"
	JNZ	START		;caso nenhuma das verificações acima tenha sido verdadeira, retorna para o começo, pois nao foi inserido caracter válido

DOWN:
	MOV	AL,00		;zera o valor de AL
	ADD	AL,BL		;passa o valor de BL para AL
	OR	AL,40		;realiza um or de AL com o valor 40, para que a bolinha desça
	OUT	04		;copia o conteúdo de AL para a porta 04
	JMP	START		;realizado o processo, retorna para "START"

RIGHT:
	MOV	AL,00		;zera o valor de AL
	ADD	AL,BL		;passa o valor de BL para AL
	OR	AL,10		;realiza um or de AL com o valor 10, para que a bolinha vá para direita
	OUT	04		;copia o conteúdo de AL para a porta 04
	JMP	START		;realizado o processo, retorna para "START"
LEFT:
	MOV	AL,00		;zera o valor de AL
	ADD	AL,BL		;passa o valor de BL para AL
	OR	AL,20		;realiza um or de AL com o valor 20, para que a bolinha vá para esquerda
	OUT	04		;copia o conteúdo de AL para a porta 04
	JMP	START		;realizado o processo, retorna para "START"
UP:
	MOV	AL,00		;zera o valor de AL
	ADD	AL,BL		;passa o valor de BL para AL
	OR	AL,80		;realiza um or de AL com o valor 80, para que a bolinha vá para cima
	OUT	04		;copia o conteúdo de AL para a porta 04
	JMP	START		;realizado o processo, retorna para "START"
SPEEDUP:
	ADD	BL,02		;acrescenta 02 em BL para que a distancia seja aumentada em 1
	JMP	START		;retorna para "START"
SPEEDDOWN:
	SUB	BL,02		;subtrai 02 em BL para que a distancia seja diminuida em 1
	JMP	START		;retorna para "START"

END
		