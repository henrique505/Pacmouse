#include <stdio.h>

/*Este programa calcula a duracao de uma nota em milisegundos. Funciona apenas para compassos simples.*/

int main (){
int unidade_de_tempo, bpm, miliseg_por_minuto;
double duracao_da_ut, duracao_da_nota, nota;
miliseg_por_minuto = 60*1000; 

    printf("Digite a unidade de tempo:\n Semibreve = 1\n Minima = 2\n Seminima = 4\n");
    scanf("%d", &unidade_de_tempo); 
    printf("Digite o andamento em BPM\n");
    scanf("%d", &bpm);
    printf("Digite a figura:\n Semibreve = 1\n Minima = 2\n Seminima = 4\n Colcheia = 8\n Semicolcheia = 16\n Fusa = 32\n Semifusa = 64\n");

duracao_da_ut = miliseg_por_minuto/bpm; 

do{
    scanf("%lf", &nota);

    nota = unidade_de_tempo/nota; 
    duracao_da_nota = duracao_da_ut*nota;

    printf("A duracao da nota em milisegundos eh de %.0lf\n", duracao_da_nota); 
    
}while(nota != 0); 

    return 0; 
}