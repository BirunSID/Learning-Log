// Modifies the volume of an audio file

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

// Number of bytes in .wav header
const int HEADER_SIZE = 44;

int main(int argc, char *argv[])
{
    // Check command-line arguments
    if (argc != 4)
    {
        printf("Usage: ./volume input.wav output.wav factor\n");
        return 1;
    }

    // Open files and determine scaling factor
    FILE *input = fopen(argv[1], "r");
    if (input == NULL)
    {
        printf("Could not open file.\n");
        return 1;
    }

    FILE *output = fopen(argv[2], "w");
    if (output == NULL)
    {
        printf("Could not open file.\n");
        return 1;
    }

    float factor = atof(argv[3]);

    // TODO: Copy header from input file to output file

    unsigned char buffer[HEADER_SIZE];
    size_t read = fread(buffer, 1, HEADER_SIZE, input);
    size_t written = fwrite(buffer, 1, read, output);

    // TODO: Read samples from input file and write updated data to output file

    fseek(input, 0, SEEK_END);
    long totalsize = ftell(input);  //total bytes in file
    long rest_of_byte_size = totalsize - 44; //remaining bytes
    fseek(input, 44, SEEK_SET);

    unsigned char rest_buffer[rest_of_byte_size];
    size_t READ_rest_of_the_bytes = fread(rest_buffer, 1, rest_of_byte_size, input);


    size_t factored_new_byte_size = (size_t) (READ_rest_of_the_bytes * factor);
    unsigned char factored_buffer[factored_new_byte_size];
    for (size_t i = 0; i < factored_new_byte_size; i++)
    {
        size_t map_scaled_index = (size_t) (i / factor); //scaled the bytes
        factored_buffer[i] = rest_buffer[map_scaled_index];
    }

    size_t WRITTEN_rest_of_the_bytes = fwrite(factored_buffer, 1, factored_new_byte_size, output);

    // Close files
    fclose(input);
    fclose(output);
}
