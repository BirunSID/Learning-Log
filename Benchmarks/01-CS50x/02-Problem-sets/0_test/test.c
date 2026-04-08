#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int n;
    printf("How many characters? ");
    scanf("%d", &n);

    char *s = malloc(n + 1);  // +1 for '\0'

    if (s == NULL) return 1;

    printf("Enter text: ");
    scanf("%ns", s);

    printf("You typed: %s\n", s);

    free(s);
}