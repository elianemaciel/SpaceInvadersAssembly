;Autor: Eliane Maciel
;Space Invaders Game

.model small

.stack 4000H

.data
    ; player spaceship
    ; 150 bytes (15x10)
    NAVE_AMIGA  db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 00, 00, 00, 10, 00, 00, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 00, 10, 10, 10, 10, 10, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 00, 10, 10, 10, 10, 10, 00, 00, 00, 00, 00
                db 00, 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00, 00
                db 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00
                db 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00
                db 00, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 00
                
    NAVE_1      db 00, 00, 00, 00, 00, 00, 01, 01, 01, 00, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 00, 01, 01, 01, 01, 01, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00
                db 00, 00, 00, 01, 01, 01, 01, 01, 01, 01, 01, 01, 00, 00, 00
                db 00, 00, 01, 01, 01, 00, 01, 01, 01, 00, 01, 01, 01, 00, 00
                db 00, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 00
                db 00, 00, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 00, 00
                db 00, 00, 00, 01, 00, 01, 00, 00, 00, 01, 00, 01, 00, 00, 00
                db 00, 00, 01, 00, 01, 00, 00, 00, 00, 00, 01, 00, 01, 00, 00
                db 00, 01, 00, 01, 00, 00, 00, 00, 00, 00, 00, 01, 00, 01, 00
    
    NAVE_2      db 00, 00, 00, 00, 14, 00, 00, 00, 00, 00, 14, 00, 00, 00, 00
                db 00, 00, 00, 00, 00, 14, 00, 00, 00, 14, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 00, 00, 14, 00, 14, 00, 00, 00, 00, 00, 00
                db 00, 00, 00, 14, 14, 14, 14, 14, 14, 14, 14, 14, 00, 00, 00
                db 00, 00, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 00, 00
                db 00, 14, 14, 14, 00, 00, 14, 14, 14, 00, 00, 14, 14, 14, 00
                db 00, 00, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 00, 00
                db 00, 00, 00, 14, 14, 14, 14, 14, 14, 14, 14, 14, 00, 00, 00
                db 00, 00, 00, 00, 00, 14, 00, 14, 00, 14, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 14, 00, 00, 00, 00, 00, 14, 00, 00, 00, 00
    
    NAVE_3      db 00, 00, 00, 00, 00, 05, 00, 00, 00, 05, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 00, 00, 05, 00, 05, 00, 00, 00, 00, 00, 00
                db 00, 00, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 00, 00
                db 00, 05, 05, 05, 00, 00, 05, 05, 05, 00, 00, 05, 05, 05, 00
                db 00, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 00
                db 00, 00, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 00, 00
                db 00, 00, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 00, 00
                db 00, 00, 00, 00, 00, 05, 00, 05, 00, 05, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 05, 00, 05, 00, 05, 00, 05, 00, 00, 00, 00
                db 00, 00, 05, 05, 00, 00, 00, 05, 00, 00, 00, 05, 05, 00, 00
    
    NAVE_4      db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 00, 11, 00, 00, 00, 11, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 00, 00, 11, 00, 11, 00, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 11, 11, 11, 11, 11, 11, 11, 00, 00, 00, 00
                db 00, 00, 00, 11, 11, 11, 11, 11, 11, 11, 11, 11, 00, 00, 00
                db 00, 00, 11, 11, 11, 00, 11, 11, 11, 00, 11, 11, 11, 00, 00
                db 00, 11, 00, 11, 11, 11, 11, 11, 11, 11, 11, 11, 00, 11, 00
                db 00, 11, 00, 00, 11, 11, 11, 11, 11, 11, 11, 00, 00, 11, 00
                db 00, 00, 00, 00, 00, 11, 00, 00, 00, 11, 00, 00, 00, 00, 00
                db 00, 00, 00, 11, 11, 00, 00, 00, 00, 00, 11, 11, 00, 00, 00
                
    NAVE_5      db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 00, 04, 04, 04, 04, 04, 00, 00, 00, 00, 00
                db 00, 00, 00, 00, 04, 04, 04, 04, 04, 04, 04, 00, 00, 00, 00
                db 00, 00, 00, 04, 04, 04, 04, 04, 04, 04, 04, 04, 00, 00, 00
                db 00, 00, 04, 04, 00, 04, 04, 04, 04, 04, 00, 04, 04, 00, 00
                db 00, 00, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 00, 00
                db 00, 00, 00, 04, 00, 04, 04, 04, 04, 04, 00, 04, 00, 00, 00
                db 00, 00, 04, 00, 00, 00, 00, 00, 00, 00, 00, 00, 04, 00, 00
                db 00, 00, 00, 04, 00, 00, 00, 00, 00, 00, 00, 04, 00, 00, 00
                db 00, 00, 00, 00, 04, 00, 00, 00, 00, 00, 04, 00, 00, 00, 00
    
    NAVE_6      db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
                db 00, 00, 00, 02, 00, 00, 00, 00, 00, 00, 00, 02, 00, 00, 00
                db 00, 00, 00, 00, 02, 00, 00, 00, 00, 00, 02, 00, 00, 00, 00
                db 00, 00, 00, 00, 02, 00, 00, 00, 00, 00, 02, 00, 00, 00, 00
                db 00, 00, 00, 02, 02, 02, 02, 02, 02, 02, 02, 02, 00, 00, 00
                db 00, 00, 02, 02, 00, 02, 02, 02, 02, 02, 00, 02, 02, 00, 00
                db 00, 02, 00, 02, 00, 02, 02, 02, 02, 02, 00, 02, 00, 02, 00
                db 00, 02, 00, 02, 02, 02, 02, 02, 02, 02, 02, 02, 00, 02, 00
                db 00, 02, 00, 02, 00, 00, 00, 00, 00, 00, 00, 02, 00, 02, 00
                db 00, 02, 00, 00, 02, 02, 02, 00, 02, 02, 02, 00, 00, 02, 00
    
    ; Tiros
    TIRO_SYMBOL  db 15
    tiro         dw 0
    tiro_inimigo dw 0
    pos_tiro_x1   dw 0 
    pos_tiro_y1   dw 0
    pos_tiro_inimigo_x dw 0
    pos_tiro_inimigo_y dw 0
    nave_atira      dw  0
    cont_tiro_x     dw 1
    
    ; naves ativas
    naves_count  dw 60
    
    naveAtiva1   db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    naveAtiva2   db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    naveAtiva3   db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    naveAtiva4   db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    naveAtiva5   db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    naveAtiva6   db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    
    
    ; posicao naves
    pos_max_x    dw ?
    pos_x_in     dw ?
    pos_x        dw 40
    pos_y        dw  0
    loop_nav     equ 10
    pos_x_naveamiga dw 152
    pos_y_naveamiga dw 189
    direcao_naves DB 0
    
    
    ; Pontuacao: Cada nave vale uma pontua??o, a NAVE 1 vale 5 pontos, o valor vai dobrando a cada nave. A ?ltima vale 160
    ; cada vez que acerta o tiro em uma nave ? somado os pontos
    pontos       dw 0
    
    recorde1     dw 0
    recorde2     dw 0
    recorde3     dw 0
    cont_record  dw 0
    
    fim_perdeu   dw 0
    
    PontoNave1   dw 5
    PontoNave2   dw 10
    PontoNave3   dw 20   
    PontoNave4   dw 40
    PontoNave5   dw 80
    PontoNave6   dw 160
    
    ;TELA SCORS
    titulo_scors  db " SCORE "
    live          db " LIVES "
    vidas         dw 3
    
    
    ;TELA FINAL PERDEU
    game_over  db " GAVE OVER "
    pont       db " PONTUACAO "
    
    ;TELA FINAL Ganhou
    ganhou_text  db " PARABENS VOCE GANHOU "
    
    ;TELA Recordes
    record_text  db " RECORDES "
    
    ; teclas de a??o
    move_esq    equ 4B00h
    move_dir    equ 4D00h
    play        equ 6A00h; 4Ah Tecla j e J
    tecla_fim   equ 7300h ; sair
    
 
    ; Tela Inicial
    
    titulo          db   "SPACE INVADERS"
    subtitulo       db   "********************"
    iniciar_jogo    db   "J - Jogar"
    recordes        db   "R - Recordes"
    sair            db   "Sair"
                
                
.code
    EMPILHATUDO macro
        push AX BX CX DX
        push SI DI BP
    endm
    DESEMPILHATUDO macro
        pop BP DI SI
        pop DX CX BX AX
    Endm

    ; Set video mode 320x200 256 colors
    VIDEO_MODE proc
        push ax
        mov ah, 0
        mov al, 13h
        int 10h
        pop ax
        ret
    endp
    
    ; Print char
    ; Registers Params:
    ;   DL: char
    ESC_CHAR proc 
        push AX
        mov AH, 2
        int 21h
        pop AX
        
        ret
    endp
    
   LIMPA_TELA proc; limpa a tela
        EMPILHATUDO
        mov AH, 07h
        mov AL, 00h
        mov CH, 00h
        mov CL, 00h ;linha,coluna do canto superior esquerdo da regi?o
        mov DH, 190
        mov DL, 200 ;linha,coluna do canto inferior direito da regi?o
        int 10h
        DESEMPILHATUDO
        ret
    endp
    
    DESENHA_NAVE_AMIGA proc
        EMPILHATUDO
        xor bx, bx
        xor ax, ax
        mov ax, cx ; guarda valor inicial de cx
        mov bx, dx ; guarda valor de dx
        add bx, 10
        mov DI, 15
        add DI, ax
        
    DESENHAR:
        push ax
        mov AH, 0Ch ;set the interrupt number to print
        mov AL, [SI] ;get the current status of models bit and color
        int 10h ;print pixel on screen
        
        pop ax
        inc SI ;increment model bit
        inc CX ;increment column 
        
        cmp CX, DI ;compare current column with end of ship model
        jb DESENHAR
        
        mov cx, ax
        inc DX ;increment row

        cmp DX, bx ;compare current row with end of ship model
        jb DESENHAR
        
        DESEMPILHATUDO
        ret
    endp
    
    
    DESENHA_TIRO proc
        EMPILHATUDO
        xor bx, bx

        mov AH, 0Ch ;set the interrupt number to print
        mov AL, [SI] ;get the current status of models bit and color
        int 10h ;print pixel on screen
    
        DESEMPILHATUDO
        ret
    endp
    
    
    
    TELA_JOGO proc
        EMPILHATUDO
        xor cx, cx
        xor dx, dx
        xor DI, DI
        
        call TELA_SCORS
        
        mov cx, [pos_x]
        mov bx, loop_nav
        mov DI, offset naveAtiva6 ; Nave
        mov dx, [pos_y] ; Posicao da linha no eixo y
        call FIM_PERDEU_PROC
        
    LINHA1:
        cmp [DI], 00
        je CONTINUA1
        
        mov SI, offset NAVE_6 ; Nave
        call DESENHA_NAVE_AMIGA ; Desenha a nave na posicao (dx, cx)
        mov ax, 6
        call VERIFICA
        call TIRO_INIMIGO_TESTE
    CONTINUA1:
        inc DI
        dec bx
        add cx, 25
        cmp bx, 0
        jnz LINHA1
        
        ; segunda linha de naves
        mov cx, [pos_x]
        mov bx, loop_nav
        add dx, 15
        mov DI, offset naveAtiva5 ; Nave
        call FIM_PERDEU_PROC
    LINHA2:
        cmp [DI], 00
        je CONTINUA2
        mov SI, offset NAVE_5
        call DESENHA_NAVE_AMIGA
        mov ax, 5
        call VERIFICA
        call TIRO_INIMIGO_TESTE
    CONTINUA2:
        inc DI
        dec bx
        add cx, 25
        cmp bx, 0
        jnz LINHA2
    
    ; terceira linha de naves
        mov cx, [pos_x]
        mov bx, loop_nav
        add dx, 15
        mov DI, offset naveAtiva4 ; Nave
        call FIM_PERDEU_PROC
    LINHA3:
        cmp [DI], 00
        je CONTINUA3
        mov SI, offset NAVE_4
        call DESENHA_NAVE_AMIGA
        mov ax, 4
        call VERIFICA
        call TIRO_INIMIGO_TESTE
   CONTINUA3:
        inc DI
        dec bx
        add cx, 25
        cmp bx, 0
        jnz LINHA3
        
    ; Quarta linha de naves
        mov cx, [pos_x]
        mov bx, loop_nav
        add dx, 15
        mov DI, offset naveAtiva3 ; Nave
        call FIM_PERDEU_PROC
    LINHA4:
        cmp [DI], 00
        je CONTINUA4
        mov SI, offset NAVE_3
        call DESENHA_NAVE_AMIGA
        mov ax, 3
        call VERIFICA
        call TIRO_INIMIGO_TESTE
   CONTINUA4:
        inc DI
        dec bx
        add cx, 25
        cmp bx, 0
        jnz LINHA4
        
    ; Quinta linha de naves
        mov cx, [pos_x]
        mov bx, loop_nav
        add dx, 15
        mov DI, offset naveAtiva2 ; Nave
        call FIM_PERDEU_PROC
    LINHA5:
        cmp [DI], 00
        je CONTINUA5
        mov SI, offset NAVE_2
        call DESENHA_NAVE_AMIGA
        mov ax, 2
        call VERIFICA
        call TIRO_INIMIGO_TESTE
   CONTINUA5:
        inc DI
        dec bx
        add cx, 25
        cmp bx, 0
        jnz LINHA5
        
    ; ULtima linha de naves
        mov cx, [pos_x]
        mov bx, loop_nav
        add dx, 15
        mov DI, offset naveAtiva1 ; Nave
        call FIM_PERDEU_PROC
        
    LINHA6:
        cmp [DI], 00
        je CONTINUA6
        mov SI, offset NAVE_1
        call DESENHA_NAVE_AMIGA
        mov ax, 1
        call VERIFICA
        call TIRO_INIMIGO_TESTE
    CONTINUA6:
        inc DI
        dec bx
        add cx, 25
        cmp bx, 0
        jnz LINHA6
        
        
        call DESENHA_TIRO_INIMIGO
        call DESENHAR_TIRO
        xor cx, cx
        xor dx, dx
        mov cx, pos_x_naveamiga
        mov dx, pos_y_naveamiga
        mov SI, offset NAVE_AMIGA
        call DESENHA_NAVE_AMIGA
   ACABA:    
        DESEMPILHATUDO
        ret
    endp
    
    FIM_PERDEU_PROC proc
        EMPILHATUDO
        
        cmp dx, 170
        jb VOLTA
        mov fim_perdeu, 1
    VOLTA:    
        DESEMPILHATUDO
        ret
    endp
    
    DESENHAR_TIRO proc
        EMPILHATUDO   
        cmp [tiro], 0 ; Verifica se tem tiro ativo
        je RETORNO
        mov cx, [pos_tiro_x1] ; linha do tiro
        mov dx, [pos_tiro_y1] ; coluna do tiro
        mov SI, offset TIRO_SYMBOL
        call DESENHA_TIRO ; desenha o tiro
        dec [pos_tiro_y1]
        mov [pos_tiro_x1], cx
        cmp [pos_tiro_y1], 0
        je REMOVE_TIRO
        jmp RETORNO

    REMOVE_TIRO:
        dec tiro ; remove o tiro quando este est? fora da tela
   
    RETORNO:
        DESEMPILHATUDO
        ret
    endp
    
    DESENHA_TIRO_INIMIGO proc
        EMPILHATUDO   
        cmp [tiro_inimigo], 0 ; Verifica se tem tiro ativo
        je RETORNO
        
        mov cx, [pos_tiro_inimigo_x] ; linha do tiro
        mov dx, [pos_tiro_inimigo_y] ; coluna do tiro
        mov SI, offset TIRO_SYMBOL
        call DESENHA_TIRO ; desenha o tiro
        call VERIFICA_COLISAO
        
        inc [pos_tiro_inimigo_y]

        cmp [pos_tiro_inimigo_y], 200
        jae REMOVE_TIRO_INIMIGO
        jmp RETORNO_INIMIGO

    REMOVE_TIRO_INIMIGO:
        mov tiro_inimigo, 0 ; remove o tiro quando este est? fora da tela
        inc nave_atira
        
    RETORNO_INIMIGO:
        DESEMPILHATUDO
        ret
    endp
    
    VERIFICA_COLISAO proc
        EMPILHATUDO
        mov ax, pos_y_naveamiga
        cmp pos_tiro_inimigo_y, ax
        je BATEU
        jmp LA
    BATEU:
        mov bx, pos_x_naveamiga
        cmp pos_tiro_inimigo_x, bx
        jb LA
        add bx, 15
        cmp pos_tiro_inimigo_x, bx
        ja LA
        dec vidas
        mov tiro_inimigo, 0 ; remove o tiro quando este est? fora da tela
        inc nave_atira
    LA:
        DESEMPILHATUDO
        ret
    endp
    
    VERIFICA proc
        EMPILHATUDO
        
        cmp tiro, 0 ; Verifica se tem tiro ativo
        je SAI
        
        mov bx, dx 
        add bx, 10
             
        cmp bx, [pos_tiro_y1] ; compara a base da linha
        jne SAI
        
        mov bx, 15
   
   LACOCOLUNA:     
        cmp cx, [pos_tiro_x1]
        je PULA
        inc cx
        dec bx
        cmp bx, 0
        jnz LACOCOLUNA
        
        jmp SAI
        
   PULA:      
        mov [DI], 0
        mov tiro, 0
        dec naves_count
        
        call CALCULA_PONTOS
        
   SAI:
        DESEMPILHATUDO
        ret
    endp
    
    CALCULA_PONTOS proc
        EMPILHATUDO
        cmp ax, 1
        je SOMA_PONTOS1
        
        cmp ax, 2
        je SOMA_PONTOS2
        
        cmp ax, 3
        je SOMA_PONTOS3
        
        cmp ax, 4
        je SOMA_PONTOS4
        
        cmp ax, 5
        je SOMA_PONTOS5
        
        cmp ax, 6
        je SOMA_PONTOS6
        
        jmp FINAL
        
    SOMA_PONTOS1:
        mov dx, [PontoNave1]
        add [pontos], dx
        jmp FINAL
        
    SOMA_PONTOS2:
        mov dx, PontoNave2
        add pontos, dx
        jmp FINAL
    
    SOMA_PONTOS3:
        mov dx, PontoNave3
        add pontos, dx
        jmp FINAL
    
    SOMA_PONTOS4:
        mov dx, PontoNave4
        add pontos, dx
        jmp FINAL
        
    SOMA_PONTOS5:
        mov dx, PontoNave5
        add pontos, dx
        jmp FINAL
        
    SOMA_PONTOS6:
        mov dx, PontoNave6
        add pontos, dx
        jmp FINAL
    
    FINAL:
        DESEMPILHATUDO
        ret
    endp
    
    TIRO_INIMIGO_TESTE proc
        EMPILHATUDO
        
        cmp tiro_inimigo, 1
        je NAO_FAZ_NADA
        
        cmp ax, cont_tiro_x
        jne NAO_FAZ_NADA
        
        mov tiro_inimigo, 1
        
        inc nave_atira
        
        cmp nave_atira, 10
        jb NAO_TROCA_LINHA
  
        ;TROCA_LINHA:
        mov nave_atira, 0
        inc cont_tiro_x

    NAO_TROCA_LINHA:    
        add dx, 10
        
        mov pos_tiro_inimigo_y, dx        
        add cx, 8
        add pos_tiro_inimigo_x, cx
        call DESENHA_TIRO_INIMIGO
   
    NAO_FAZ_NADA:    
        DESEMPILHATUDO
        ret
    endp
        
    
    LE_TECLADO proc
        EMPILHATUDO
            
        mov AH, 01h
        int 16h
        
        jz FORA ;check if have something in buffer
        
        cmp ax, move_esq
        je MOVE_LEFT
        
        cmp ax, move_dir
        je MOVE_RIGHT
        
        cmp ax, 3920h
        je ATIRAR
        
        jmp CHECK_KEY_CONTINUE
        
    MOVE_LEFT:
        mov AH, 00h
        int 16h
        cmp [pos_x_naveamiga], 5
        jbe FORA
        sub [pos_x_naveamiga], 4
        jmp FORA
        
    MOVE_RIGHT:
        mov AH, 00h
        int 16h
        cmp [pos_x_naveamiga], 300
        jae FORA
        
        add [pos_x_naveamiga], 4
        jmp FORA
        
    ATIRAR:
        cmp [tiro], 1
        je FORA
        inc [tiro]
        mov dx, [pos_x_naveamiga]
        mov cx, [pos_y_naveamiga]
        add dx, 7 ; soma 7 para o tiro sair no meio da nave amiga
        dec cx
        mov [pos_tiro_x1], dx
        mov [pos_tiro_y1], cx
   
   CHECK_KEY_CONTINUE:
        mov AH, 00h
        int 16h
        
   FORA:  
        DESEMPILHATUDO
        ret
        
   endp
   
   DELAY proc
        push CX
        
        mov CX, 64
        DELAYLOOP:
        loop DELAYLOOP
        
        pop CX
        ret
    endp
    
    
    MOVE_ALIENS proc
        cmp pos_x, 80
        jb RIGHT
        
        cmp pos_x, 80
        je LEFT
        
        jmp CAIFORA
    
    RIGHT:
        cmp direcao_naves, 1
        je LEFT
        
        mov direcao_naves, 0 ; move para direita
        inc pos_x
        jmp CAIFORA
        
    LEFT:
        mov direcao_naves, 1
        dec pos_x
        cmp pos_x, 0
        jz ALTERA_DIRECTION
        jmp CAIFORA
    
   ALTERA_DIRECTION:
        mov direcao_naves, 0
        add pos_y, 5
        
    CAIFORA:
        ret
    endp
    
    ESCREVE_STRING proc
        EMPILHATUDO
        mov ax,@data        ; programa ax com o segmento de dados
        mov es,ax
        mov ah,13h          ; fun??o 13 - escrever string
        mov al,01h          ; p?gina de v?deo 0
        xor bh,bh           ; atributo em bl,move cursor
        int 10h  
        
        DESEMPILHATUDO
        ret
    endp
    
    TELA_INICIAL proc
        EMPILHATUDO
        mov dh,2 ; linha
        mov dl,12 ; coluna
        mov cx,14  ; tamanho da string
        mov bl,5
        mov bp,OFFSET titulo
        call ESCREVE_STRING
        
        mov dh,4 ; linha
        mov dl,9 ; coluna
        mov cx,20  ; tamanho da string
        mov bp,OFFSET subtitulo
        call ESCREVE_STRING
        
        mov dh,8 ; linha
        mov dl,15 ; coluna
        mov cx,9  ; tamanho da string
        mov bl,7
        mov bp,OFFSET iniciar_jogo
        call ESCREVE_STRING
        
        mov dh,10 ; linha
        mov dl,15 ; coluna
        mov cx,12  ; tamanho da string
        mov bl,7
        mov bp,OFFSET recordes
        call ESCREVE_STRING
        
        mov dh,12 ; linha
        mov dl,15 ; coluna
        mov cx,12  ; tamanho da string
        mov bl,7
        mov bp,OFFSET sair
        call ESCREVE_STRING
        
        DESEMPILHATUDO
        ret
    endp
    
    TELA_FINAL proc
        EMPILHATUDO
        mov dh,10 ; linha
        mov dl,12 ; coluna
        mov cx,11  ; tamanho da string
        mov bl,7
        mov bp,OFFSET game_over
        call ESCREVE_STRING
        
        mov dh,12; linha
        mov dl,12 ; coluna
        mov cx,11  ; tamanho da string
        mov bl,5
        mov bp,OFFSET pont
        call ESCREVE_STRING
        
        mov dh,13 ; linha
        mov dl,15 ; coluna
        mov cx,7  ; tamanho da string
        mov bl,7
        mov ax, pontos
        call ESC_UINT16
        
        DESEMPILHATUDO
        ret
    endp
    
    TELA_FINAL_GANHOU proc
        EMPILHATUDO
        mov dh,10 ; linha
        mov dl,12 ; coluna
        mov cx,22  ; tamanho da string
        mov bl,7
        mov bp,OFFSET ganhou_text
        call ESCREVE_STRING
        
        mov dh,12; linha
        mov dl,12 ; coluna
        mov cx,11  ; tamanho da string
        mov bl,5
        mov bp,OFFSET pont
        call ESCREVE_STRING
        
        mov dh,13 ; linha
        mov dl,15 ; coluna
        mov cx,7  ; tamanho da string
        mov bl,7
        mov ax, pontos
        call ESC_UINT16
        
        DESEMPILHATUDO
        ret
    endp
    
    TELA_RECORDES proc
        EMPILHATUDO
        mov dh,10 ; linha
        mov dl,12 ; coluna
        mov cx,9  ; tamanho da string
        mov bl,7
        mov bp,OFFSET record_text
        call ESCREVE_STRING
         
        mov dh,13 ; linha
        mov dl,15 ; coluna
        mov cx,7  ; tamanho da string
        mov bl,7
        mov ax, recorde1
        call ESC_UINT16
        
        mov dh,14 ; linha
        mov dl,15 ; coluna
        mov cx,7  ; tamanho da string
        mov bl,7
        mov ax, recorde2
        call ESC_UINT16
        
        mov dh,15 ; linha
        mov dl,15 ; coluna
        mov cx,7  ; tamanho da string
        mov bl,7
        mov ax, recorde3
        call ESC_UINT16
        
        DESEMPILHATUDO
        ret
    endp
    
    GAME proc
        EMPILHATUDO
        
        mov [pos_y], 30
        mov [pos_x], 40
        mov pontos, 0
        call LIMPA_TELA
        call TELA_JOGO
        mov BX, 0
    LOOP1:
        call DELAY
        call LIMPA_TELA
        call TELA_JOGO
        
        call LE_TECLADO
        cmp BX, 2
        jne CONTINUE
        mov BX, 0
        call MOVE_ALIENS
        
    CONTINUE:
        inc BX
            
        cmp [vidas], 0
        jz PERDEU1
        cmp fim_perdeu, 1
        je PERDEU1
        jmp LOOP1
    
    GANHOU:
        call LIMPA_TELA
        call TELA_FINAL_GANHOU
        xor AX, AX
        int 16h
        jmp END_GAME
        
    PERDEU1:
        call LIMPA_TELA
        call TELA_FINAL
        xor AX, AX
        int 16h
        
        mov bx, pontos
        cmp recorde1, bx
        jb REC1
        cmp recorde2, bx
        jb REC2
        cmp recorde3, bx
        jb REC3
        jmp END_GAME
     REC1:
        mov recorde1, bx
        jmp END_GAME
     REC2:
        mov recorde2, bx
        jmp END_GAME
     REC3:
        mov recorde3, bx
        
    END_GAME:
        DESEMPILHATUDO
        ret
    endp
    
    TELA_SCORS proc
        EMPILHATUDO
       
        mov dh,1 ; linha
        mov dl,1 ; coluna
        mov cx,7  ; tamanho da string
        mov bl,7
        mov bp,OFFSET titulo_scors
        call ESCREVE_STRING
        
        mov dh,1 ; linha
        mov dl,10 ; coluna
        mov cx,7  ; tamanho da string
        mov bl,7
        mov ax, pontos
        call ESC_UINT16
        
        mov dh,1 ; linha
        mov dl,100 ; coluna
        mov cx,7  ; tamanho da string
        mov bl,7
        mov bp,OFFSET live
        call ESCREVE_STRING
        
        mov ax, [vidas]
        mov cx, 215
        
     LOOP_VIDAS:   
        
        mov dx, 8
        mov SI, offset NAVE_AMIGA
        call DESENHA_NAVE_AMIGA
        dec ax
        add cx, 20
        cmp ax, 0
        jnz LOOP_VIDAS
        
        DESEMPILHATUDO
        ret
    endp
    
    ESC_UINT16 PROC   ; Escreve um numero armazenado em AX
        EMPILHATUDO
        
        xor cx, cx
        mov bx,10
    DIVIDE:
        xor dx,dx
    
        div bx      ; obtem a unidade do n?mero
        add dl,'0'  ; transforma em caractere
        push dx     ; empilha caractere
        inc cx
        or ax, ax
        jnz DIVIDE

    ESCREVE:
        pop dx     ; La?o que escreve os caracteres empilhados
        call ESC_CHAR
        loop ESCREVE
        
        DESEMPILHATUDO
        ret
    endp
    
          
    START:
        ;init data segment
        mov AX, @DATA
        mov DS, AX
        
        ;set video mode
        call VIDEO_MODE
   INIT:
        call TELA_INICIAL
        
        xor AX, AX
        int 16h
        
        cmp AL, 6Ah
        je CALL_GAME
        
        cmp AL, 72h
        je RECORDES_TELA
        
        jmp FIM_GAME
        
    RECORDES_TELA:
        call LIMPA_TELA
        call TELA_RECORDES
        xor AX, AX
        int 16h
        call LIMPA_TELA
        jmp INIT
        
    CALL_GAME:
        call GAME
        
        
   FIM_GAME:     ;end program
   
        ;return to text mode
        xor ah, ah
        mov al, 3
        int 10h
    
        mov al, 0h
        mov ah, 4Ch
        int 21h 
end START