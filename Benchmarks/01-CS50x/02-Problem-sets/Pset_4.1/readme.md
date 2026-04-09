# volume

First we download the files using  `curl --output volume.zip https://cdn.cs50.net/2026/x/psets/4/volume.zip`. and then unzip them and remove the zip folder.  
The distribution files are [here](volume_dist) which includes the `c` file and the `wav` file.

---

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

