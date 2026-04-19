# Recover

![alt text](<99 Misc/recovered_image.png>)

# Problem to Solve

*In anticipation of this problem, we spent the past several days taking photos around campus, all of which were saved on a digital camera as JPEGs on a memory card. Unfortunately, we somehow deleted them all! Thankfully, in the computer world, “deleted” tends not to mean “deleted” so much as “forgotten.” Even though the camera insists that the card is now blank, we’re pretty sure that’s not quite true. Indeed, we’re hoping (er, expecting!) you can write a program that recovers the photos for us!*

In a file called recover.c in a folder called recover, write a program to recover JPEGs from a memory card.

# distribution code

check [recover_dist](<recover dist>) for the distribution code.

# Background

Even though JPEGs are more complicated than BMPs, JPEGs have “signatures,” patterns of bytes that can distinguish them from other file formats. Specifically, the first three bytes of JPEGs are

```
0xff 0xd8 0xff
```

from first byte to third byte, left to right. The fourth byte, meanwhile, is either `0xe0`, `0xe1`, `0xe2`, `0xe3`, `0xe4`, `0xe5`, `0xe6`, `0xe7`, `0xe8`, `0xe9`, `0xea`, `0xeb`, `0xec`, `0xed`, `0xee`, or `0xef`. Put another way, the fourth byte’s first four bits are `1110`.

*Odds are, if you find this pattern of four bytes on media known to store photos (e.g., my memory card), they demarcate the start of a JPEG. To be fair, you might encounter these patterns on some disk purely by chance, so data recovery isn’t an exact science.*

Fortunately, digital cameras tend to store photographs contiguously on memory cards, whereby each photo is stored immediately after the previously taken photo. Accordingly, the start of a JPEG usually demarks the end of another. However, digital cameras often initialize cards with a FAT file system whose “block size” is 512 bytes (B). The implication is that these cameras only write to those cards in units of 512 B. A photo that’s 1 MB (i.e., 1,048,576 B) thus takes up 1048576 ÷ 512 = 2048 “blocks” on a memory card. But so does a photo that’s, say, one byte smaller (i.e., 1,048,575 B)! The wasted space on disk is called “slack space.” Forensic investigators often look at slack space for remnants of suspicious data.

The implication of all these details is that you, the investigator, can probably write a program that iterates over a copy of my memory card, looking for JPEGs’ signatures. Each time you find a signature, you can open a new file for writing and start filling that file with bytes from my memory card, closing that file only once you encounter another signature. Moreover, rather than read my memory card’s bytes one at a time, you can read 512 of them at a time into a buffer for efficiency’s sake. Thanks to FAT, you can trust that JPEGs’ signatures will be “block-aligned.” That is, you need only look for those signatures in a block’s first four bytes.

Realize, of course, that JPEGs can span contiguous blocks. Otherwise, no JPEG could be larger than 512 B. But the last byte of a JPEG might not fall at the very end of a block. Recall the possibility of slack space. But not to worry. Because this memory card was brand-new when I started snapping photos, odds are it’d been “zeroed” (i.e., filled with 0s) by the manufacturer, in which case any slack space will be filled with 0s. It’s okay if those trailing 0s end up in the JPEGs you recover; they should still be viewable.

Now, I only have one memory card, but there are a lot of you! And so I’ve gone ahead and created a “forensic image” of the card, storing its contents, byte after byte, in a file called card.raw. So that you don’t waste time iterating over millions of 0s unnecessarily, I’ve only imaged the first few megabytes of the memory card. But you should ultimately find that the image contains 50 JPEGs.

# Specification

Implement a program called recover that recovers JPEGs from a forensic image.

- Implement your program in a file called recover.c in a directory called recover.
- Your program should accept exactly one command-line argument, the name of a forensic image from which to recover JPEGs.
- If your program is not executed with exactly one command-line argument, it should remind the user of correct usage, and main should return 1.
- If the forensic image cannot be opened for reading, your program should inform the user as much, and main should return 1.
- The files you generate should each be named ###.jpg, where ### is a three-digit decimal number, starting with 000 for the first image and counting up.
- Your program, if it uses malloc, must not leak any memory.


# beginning of the documentary

Understood. I’ll match your format exactly and stay on path.

---

# recover

In order to do this pset, we need the help of extra 2 libraries: stdlib, and stdbool.

we get user input using CLI arguments: `main(int argc, char *argv[])`
We will take 1 cli argument & the recover.exe is the first one, so that doesn't count, 
but nontheless, we need to check if the user has put 2 arguments onto the CLI or more or less. and we need to return 1 and print the user on how to use this. and so we do a `if function` where we compare it like : `argc != 2`. argc here asks if the user given input is 2 or not, if its 2, then the if statement becomes false and the code doesn't stop and keeps going.

`FILE *card = fopen(argv[1], "rb");`
this line of code is to open the 2nd argument which the user inputs, it basically means that the user has named the file that is to be opened in argument[1] which is the 2nd argument with [1] being the executable.

and if it cannot be opened, then *card pointed equals to NULL* and we do a if statement and print the error message.

then we declare unsigned char buffer[512] which makes buffer in memory that can have 512 bytes and then is positive because all the  bytes are positive here and even the negative ones are represented with only 0s and 1s.

then we declare `FILE *img = NULL;`. What this does is declare an img pointer to the memory and points to to NULL in order to avoid junk values.

and the most important part `bool writing_state = false;` this makes the writing state false, this will come in handy later.

`while (fread(buffer, 1, 512, card) == 512)`
The program reads the source file in **512-byte chunks**. This is because the FAT filesystem stores data in "blocks" of this size. `fread` attempts to read 512 units of 1 byte into the `buffer`. The loop continues as long as `fread` successfully returns `512`. If it returns less, the end of the memory card has been reached.

`bool is_jpeg = buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xe0) == 0xe0;`

JPEGs always start with a specific 4-byte signature. The first three are static: `0xff`, `0xd8`, and `0xff`. The fourth byte is variable, ranging from `0xe0` to `0xef`.

**BITWISE BREAKDOWN: `(buffer[3] & 0xe0) == 0xe0`**
To identify a range using a single check, we use the **Bitwise AND (`&`)** operator as a "mask."
1.  **The Goal:** Check if the first 4 bits of `buffer[3]` are `1110` (which is `e` in hex).
2.  **The Mask (`0xe0`):** In binary, `0xe0` is `1110 0000`.
3.  **The Operation:** The `&` operator compares the bits of `buffer[3]` against the mask. It "keeps" the bits where the mask has a `1` and "zeros out" the bits where the mask has a `0`.
    *   *Example A (Input `0xe3`):*
        *   `0xe3` (Binary): `1110 0011`
        *   `0xe0` (Mask): `1110 0000`
        *   **Result:** `1110 0000` (This equals `0xe0`. **MATCH.**)
    *   *Example B (Input `0xf1`):*
        *   `0xf1` (Binary): `1111 0001`
        *   `0xe0` (Mask): `1110 0000`
        *   **Result:** `1110 0000` (Wait—this also equals `0xe0`, but the original byte was `0xf`. This confirms the first four bits match the requirement).
        *   
4.  **The Result:** By masking the last 4 bits (the "lower nibble") to zero, we can verify if the first 4 bits (the "upper nibble") are exactly `1110`. This covers all 16 possibilities from `0xe0` to `0xef` in a single calculation.

`if (is_jpeg)`
This block triggers only when a new image start-point is detected.
- **Closing Previous Files:** If `writing_state` is `true`, it means we were already writing a JPEG. Since a new header was just found, the previous JPEG must be finished. `fclose(img)` is called.
- **Toggling State:** If this is the first JPEG found, `writing_state` is changed from `false` to `true`.
- **Dynamic Naming:** 
    - `char filename[8];` allocates memory for a string like `"000.jpg\0"`.
    - `sprintf(filename, "%03i.jpg", file_count++);` creates the filename string. `%03i` ensures the integer is 3 digits long with leading zeros. `file_count++` uses the current count then increments it for the next file.
- **Opening for Write:** `img = fopen(filename, "wb")` creates the new file in "write binary" mode.

`if (writing_state)`
This logic governs the actual movement of data.
- It ensures we do not start writing until the **first** JPEG header is found (ignoring any "slack space" or garbage data at the start of the card).
- `fwrite(buffer, 1, 512, img);` copies the 512 bytes currently in the buffer into the currently open image file.

- `if (img != NULL)`: Before the program exits, it checks if an image file is still open (the last JPEG found). If so, it closes it.
- `fclose(card)`: Closes the original raw memory card file to prevent memory leaks.
- `return 0`: Standard exit code indicating the program finished without errors.