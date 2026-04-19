#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./recover card.raw\n");
        return 1;
    }

    FILE *card = fopen(argv[1], "rb");
    if (card == NULL)
    {
        printf("File cannot be opened\n");
        return 1;
    }

    unsigned char buffer[512];
    FILE *img = NULL;
    bool writing_state = false;
    int file_count = 0;

    while (fread(buffer, 1, 512, card) == 512)
    {
        bool is_jpeg =
            buffer[0] == 0xff &&
            buffer[1] == 0xd8 &&
            buffer[2] == 0xff &&
            (buffer[3] & 0xe0) == 0xe0;

        if (is_jpeg)
        {
            if (writing_state)
            {
                fclose(img);
            }
            else
            {
                writing_state = true;
            }

            char filename[8];
            sprintf(filename, "%03i.jpg", file_count++);
            img = fopen(filename, "wb");
        }

        if (writing_state)
        {
            fwrite(buffer, 1, 512, img);
        }
    }

    if (img != NULL)
    {
        fclose(img);
    }

    fclose(card);
    return 0;
}