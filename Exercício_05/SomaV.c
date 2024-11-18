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
    double start, end;
    omp_set_num_threads(1); // Define 4 threads
    for (int i = 0; i < tamanho; i++)
    {
        vetor[i] = i + 1;
    }
    start = omp_get_wtime();
    somar_vetor(vetor, tamanho);
    end = omp_get_wtime();
    printf("Tempo : %lf", end - start);
    return 0;
}
