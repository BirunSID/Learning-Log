# volume

First we download the files using  `curl --output volume.zip https://cdn.cs50.net/2026/x/psets/4/volume.zip`. and then unzip them and remove the zip folder.  
The distribution files are [here](volume_dist) which includes the `c` file and the `wav` file.

---
>[!warning] the fopen code line for opening the files require binary edit. NOT THE NORMAL r/a/w but rather the binary editors rb/ab/wb

# What we have to do:
WAV files are a common file format for representing audio. WAV files store audio as a sequence of “samples”: numbers that represent the value of some audio signal at a particular point in time. WAV files begin with a 44-byte “header” that contains information about the file itself, including the size of the file, the number of samples per second, and the size of each sample. After the header, the WAV file contains a sequence of samples, each a single 2-byte (16-bit) integer representing the audio signal at a particular point in time.

Scaling each sample value by a given factor has the effect of changing the volume of the audio. Multiplying each sample value by 2.0, for example, will have the effect of doubling the volume of the origin audio. Multiplying each sample by 0.5, meanwhile, will have the effect of cutting the volume in half.

In a file called volume.c in a folder called volume, write a program to modify the volume of an audio file.

---

# implementation detail

Complete the implementation of `volume.c`, such that it changes the volume of a sound file by a given `factor`.

The program should accept `three` command-line arguments. The first is input, which represents the name of the original audio file. The second is output, which represents the name of the new audio file that should be generated. The third is factor, which is the amount by which the volume of the original audio file should be scaled.

For example, if factor is `2.0`, then your program should `double` the volume of the audio file in input and save the newly generated audio file in output.

Your program should first read the header from the input file and write the header to the output file.

Your program should then read the rest of the data from the WAV file, one `16-bit (2-byte)` sample at a time. Your program should multiply each sample by the factor and write the new sample to the output file.

You may assume that the WAV file will use `16-bit` `signed values` as samples. In practice, WAV files can have varying numbers of bits per sample, but we’ll assume `16-bit` samples for this problem.

`Your program, if it uses malloc, must not leak any memory.`


---
# First off, understand the code, its very easy!

The header files are `<stdint.h>`, `<stdio.h>` and `<stdlib.h>`. I'm unaware of what `stdint` is. So, I will have to google this.
Then, we have the number of bytes in the .wav file's header. its a `constant` `integer` value of 44 `BYTES` which is given to the variable `"HEADER_SIZE"`.
Now, we have the main() function which will take cli arguments. inside the parenthesis, we have `int argc, char *argv[]`. argv is acting like a pointer to the argv array. the asterisk(*) clearly defines such because we dont have string anymore and instead we have `char`.

Next, we check the command line argument and validate whether it is correct or not.
the cli arguement will be of 4 strings including the main executable file name. `./volume input.wav output.wav factor`
But our work is with the three agruments after the main executable.

There is a IF function that validates the user input, if there are more or less arguments than 4. Then it will return 1.

Next, there is `FILE *input = fopen(argv[1], "r");`. This line of code points to the input and then asks it to open the file in argv[1] which is the input file and the program will only read it.
to make sure that we dont have any unnecessary errors, there is a NULL validator which will check the input against NULL.

The same goes for the `*output` file which will be in argv[2] and the operation would be to write in it. And there comes the same null validator.

There is this line of code `float factor = atof(argv[3]);` its a float data-type. and assigned to a variable called `factor` and it does something amazing, it takes the 4th argument which is argv[3] and then turns it into a floating point value from a string.(*the `factor`, which we need to multiply the bytes with to get the output.wav file is a string since it was given to the program through the cli agrument* AND **we are simply turning the string to a number now**)

And lastly, we are closing the file with `fclose(input)` and `fclose(output)`.

---

## My job is

1.  copy header from input to output file
2.  read samples from the input file and write updated data to output file

---

## TODO

### Copy header from input file to output file

first, we have to work on the header files. this one is simple, as the introduction video gave us a hint, we must use unsigned 8 bit for the headers since they are all positive numbers and not negative. The type is called `uint8_t` and then we declare a memory variable with 44 bytes(*HEADER_SIZE*) of spaces. 

then we read the contents from the input file. `fread(buffer, sizeof(uint8_t), HEADER_SIZE, input);`
the `&buffer` variable is the memory address where we should store the bytes that we have read. and the `sizeof(uint8_t)` refers to the data type which is `1 byte` each or 4 bits of integer. and Header_size means 44 bytes of total data. its the counter or in simpler terms, "how many". and then input at the last of the syntax means the file we will be reading.

Then we have fwrite().     `fwrite(buffer, sizeof(uint8_t), HEADER_SIZE, output);`
This function takes the values and data from the memory of `buffer` and then writes the 1 byte each, totalling 44 bytes header in the output file.


### Read samples from input file and write updated data to output file

In this TODO, we have to use signed integers because, we now have negative and positive numbers.

cs50x's introductory video told us about `int16_t` which means signed 16 bits/2 bytes integer.
and we declarea single variable called `sample_buffer` instead of memory array because we have to do this one by one, write as you read~!

A while loop is used, inside which, we have `fread(&sample_buffer, sizeof(int16_t), 1, input) == 1` and as one can observe, there is an ampesand here. It means that `sample_buffer` is a memory address, we have to make changes in the memory address and not the very variable since it is not an array where we can write or read from indefinitely.
the `sizeof(int16_t)` simply declares the data type size, since we are reading sample data type which are 2 byte neg/pos integers, we will use `int16_t`. and then 1 means, do it once, read once and then check if its returning 1 or 0. Because, there is a magic in C, fread can read things and if successfully reads stuffs, then we get 1 and 0 if reading fails.

Next, we can move on to the writing part and the factor multiplication.

We declare a new variable called `modified_sample`, which will equal to the old `sample_buffer`(where the read 2 bytes sample is saved in) * factor(the user input factor that we will use to set a value of loudness). *basically saved memory times user factor.*

- then we use the fwrite function inside of which we again use the memory address of a variable, which in this case, is `modified_sample`. and then we use the `sizeof(int16_t)` to say that the data you are going to write is 2 bytes in size and do it one by one to the output file.

---

VOILA!