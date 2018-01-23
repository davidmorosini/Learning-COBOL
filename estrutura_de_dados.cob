      ******************************************************************
      * Author:    David Morosini
      * Date:      22-01-2018
      ******************************************************************

      *=================================================================
       IDENTIFICATION                      DIVISION.
      *=================================================================

       PROGRAM-ID. PROG-ED.
      *Programa para testar as formas de estruturação de dados em memória

      *=================================================================
       ENVIRONMENT                         DIVISION.
      *=================================================================



      *=================================================================
       DATA                                DIVISION.
      *=================================================================


      *-----------------------------------------------------------------
       FILE                    SECTION.
      *-----------------------------------------------------------------

      *----------------------------------------------------------------*
       WORKING-STORAGE         SECTION.
      *local onde serão declaradas as variáveis utilizadas no programa
      *----------------------------------------------------------------*
      *<Nível> <Identificador> <Tipo(Tamanho)>

      *Tipos: NUMERICO, ALFABETICO, ALPHANUMERICO
      *Ident:    9    ,     A     ,      X
      *TAM MAX:  18   ,     ?     ,      ?
      *Aceita:  0..9  , a..z A..Z , letras números e outros caracteres especiais
       77 WRK-NUMERO           PIC 9(04).
      *S9 armazena o número com o sinal
       77 WRK-NUMERO-SINAL     PIC S9(4).
      *Armazenar um número como 10,568
      *Cada 9 representa um digito e o V a virgula, es: 99V99 9(12)V99
       77 WRK-NUMERO-DECIMAL   PIC 9(02)V9(03).
       77 WRK-STRING           PIC A(20).
       77 WRK-NUM-STRING       PIC X(30).

      *Registros, ex: Cliente
      *Todos os Itens de grupo são alfanuméricos por definição
       01  WRK-STRUCT-CLIENTE.
           02 WRK-CLIENTE-NOME          PIC X(50)   VALUE "David".
           02 WRK-CLIENTE-RG            PIC X(9)    VALUE "000000000".
           02 WRK-CLIENTE-CPF           PIC X(11)   VALUE "11111111111".
           02 WRK-CLIENTE-ENDERECO      PIC X(20)   VALUE "Nao sei".
           02 WRK-CLIENTE-DATA-NASC.
               03 WRK-CLIENTE-DATA-NASC-DIA  PIC XX VALUE "05".
               03 WRK-CLIENTE-DATA-NASC-MES  PIC XX VALUE "12".
               03 WRK-CLIENTE-DATA-NASC-ANO  PIC X(04) VALUE "1996".
               66 WRK-CLIENTE-DATA-NASC-MES-ANO RENAMES  WRK-CLIENTE-DAT
      -         A-NASC-MES THRU WRK-CLIENTE-DATA-NASC-ANO.
      *Usando o - para continuar na próxima linha

      *Nivel 78 são constantes
       78  WRK-CONST-PI VALUE 3.14.

       01  WRK-BOOLEANO PIC X.
           88 V-CHAR VALUE "V".
           88 F-CHAR VALUE "F".
           88 V-NUM  VALUE 1.
           88 F-NUM  VALUE 0.

      *WRK de WORKING-STORAGE SECTION
       77 WRK-VARIAVEL-TESTE       PIC X(20)    VALUE SPACES.
       77 WRK-DATA-ATUAL           PIC 9(6)     VALUE ZEROS.
       77 WRK-DATA-FORMAT          PIC ZZ/ZZ/ZZ VALUE ZEROS.
       77 WRK-DATA-ATUAL-JULIANA   PIC 9(5)     VALUE ZEROS.
       77 WRK-DIA-SEMANA           PIC 9(1)     VALUE ZEROS.
       77 WRK-HORA                 PIC 9(8)     VALUE ZEROS.
       77 WRK-HORA-FORMAT          PIC ZZBZZBZZBZZ VALUE ZEROS.



      *=================================================================
       PROCEDURE                           DIVISION.
      *=================================================================
       MAIN-PROCEDURE.

           DISPLAY "Testando as estruturas de dados do COBOL..".

           DISPLAY "Digite algo, ".
           ACCEPT WRK-VARIAVEL-TESTE.
           DISPLAY "A entrada e: " WRK-VARIAVEL-TESTE.

           IF WRK-VARIAVEL-TESTE IS NOT ALPHABETIC-UPPER
               DISPLAY "Apenas CAIXA ALTA.."
           END-IF

      *Entrada de dados a partir do sistema
           ACCEPT WRK-DATA-ATUAL           FROM DATE.
           ACCEPT WRK-DATA-ATUAL-JULIANA   FROM DAY.
           ACCEPT WRK-DIA-SEMANA           FROM DAY-OF-WEEK.
           ACCEPT WRK-HORA                 FROM TIME.
           ACCEPT WRK-DATA-FORMAT          FROM DATE.
           ACCEPT WRK-HORA-FORMAT          FROM TIME.
      *Dias da semana: 1 - Segunda, ..., 7 - Domingo

           DISPLAY "Data Atual: "WRK-DATA-ATUAL.
           DISPLAY "Data atual formatada: " WRK-DATA-FORMAT.
           DISPLAY "Data Atual Juliana: "WRK-DATA-ATUAL-JULIANA.
           DISPLAY "Dia da Semana: " WRK-DIA-SEMANA.
           DISPLAY "Hora: " WRK-HORA.
           DISPLAY "Hora formatada: " WRK-HORA-FORMAT.
           STOP RUN.

       END PROGRAM PROG-ED.
