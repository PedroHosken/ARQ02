#include <stdio.h>
#include <omp.h>

void somar_vetor(int *vetor, int tamanho)
{
    int soma = 0;
#pragma omp parallel for reduction(+ : soma)
    for (int i = 0; i < tamanho; i++)
    {
        soma += vetor[i];
    }
    printf("Soma: %d\n", soma);
}
#define tamanho 100000

int main()
{
    int vetor[tamanho];
    for (int i = 0; i < tamanho; i++)
    {
        vetor[i] = i + 1;
    }
    somar_vetor(vetor, tamanho);
    return 0;
}
