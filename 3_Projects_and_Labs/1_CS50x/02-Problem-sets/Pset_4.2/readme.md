# Filter (Just the introduction and understanding is quite long)
>[!note] I have copied some text snippet because there were no better way to explain the problem to myself and others who'd view this.

>[!warning]  not complaining about the difficulty, but fuck!! this is insanely heavy and cs50x didnt even tell us about the new stuffs they have used. they never even showed us switch function or getopt either.

Perhaps the simplest way to represent an image is with a grid of pixels (i.e., dots), each of which can be of a different color. For black-and-white images, we thus need 1 bit per pixel, as 0 could represent black and 1 could represent white, as in the below.  

![bitmap image](<99 misc/bitmap.png>)

In this sense, then, is an image just a bitmap (i.e., a map of bits). For more colorful images, you simply need more bits per pixel. A file format (like BMP, JPEG, or PNG) that supports “24-bit color” uses 24 bits per pixel. (BMP actually supports 1-, 4-, 8-, 16-, 24-, and 32-bit color.)

A 24-bit BMP uses 8 bits to signify the amount of red in a pixel’s color, 8 bits to signify the amount of green in a pixel’s color, and 8 bits to signify the amount of blue in a pixel’s color. If you’ve ever heard of RGB color, well, there you have it: red, green, blue.

If the R, G, and B values of some pixel in a BMP are, say, 0xff, 0x00, and 0x00 in hexadecimal, that pixel is purely red, as 0xff (otherwise known as 255 in decimal) implies “a lot of red,” while 0x00 and 0x00 imply “no green” and “no blue,” respectively. In this problem, you’ll manipulate these R, G, and B values of individual pixels, ultimately creating your very own image filters.

In a file called helpers.c in a folder called filter-more, I need to write a program to apply filters to BMPs.

---

# Background

## Bit(map)

A file is just a sequence of bits. a `24-bit BMP` file is also a sequence of `24 bits` only all 24 of which represents some pixel color. BMP's also contain metadata, such as, height and width. It is stored at the top of the file in the form of `two data structures` known as headers.

The first of these headers, called BITMAPFILEHEADER, is `14 bytes` long. (Recall that 1 byte equals 8 bits.) The second of these headers, called BITMAPINFOHEADER, is `40 bytes` long. Immediately following these headers is the actual bitmap: an array of bytes, `triples of which` represent a pixel’s color. However, BMP stores these triples backwards (BGR), with 8 bits for blue, then green, then red. (Some BMPs also store the entire bitmap backwards, with an image’s top row at the end of the BMP file. But we’ve stored this problem set’s BMPs as described herein, with each bitmap’s top row first and bottom row last.) In other words, were we to convert the 1-bit smiley above to a 24-bit smiley, substituting red for black, a 24-bit BMP would store this bitmap as follows, where 0000ff signifies red and ffffff signifies white; we’ve highlighted in red all instances of 0000ff.

![alt text](<99 misc/red_smile.png>)

Because we’ve presented these bits from left to right, top to bottom, in 8 columns, you can actually see the red smiley if you take a step back.

To be clear, recall that a hexadecimal digit represents `4 bits`. Accordingly, `ffffff` in hexadecimal actually signifies `111111111111111111111111` in binary.

Notice that you could represent a bitmap as a 2-dimensional array of pixels: where the image is an array of rows, each row is an array of pixels. Indeed, that’s how we’ve chosen to represent bitmap images in this problem.

---

## Image Filtering
What does it even mean to filter an image? You can think of filtering an image as taking the pixels of some original image, and modifying each pixel in such a way that a particular effect is apparent in the resulting image.

## Grayscale
A very common filter is the grayscaling which turns an image to black-white only.

If all RGB values are set to `0x00`(Hexadecimal 0), the resulting bit will be black. and if its `0xff`, then white. So, if rgb values are set to equal, the result would be varying shades of grey, basically higher grey means white and lower means black.

to get greyscale, we have to make Red Green Blue values are equalized. But how do we know what value to make them? well, it's expected that if the old values were high, new ones should be high and vise versa(orig value low, new value low).

Hence, to ensure each pixel of the new image still has the same general brightness or darkness as the old image, we can take the average of the red, green, and blue values to determine what shade of grey to make the new pixel.

If you apply that to each pixel in the image, the result will be an image converted to grayscale.

---
## Reflection
Some filters might also move pixels around. Reflecting an image, for example, is a filter where the resulting image is what you would get by placing the original image in front of a mirror. So any pixels on the left side of the image should end up on the right, and vice versa.

Note that all of the original pixels of the original image will still be present in the reflected image, it’s just that those pixels may have rearranged to be in a different place in the image.

This one is quite confusing as hell.

---

## Blur
There are a number of ways to create the effect of blurring or softening an image. For this problem, we’ll use the “box blur,” which works by taking each pixel and, for each color value, giving it a new value by averaging the color values of neighboring pixels.

Consider the following grid of pixels, where we’ve numbered each pixel.  
![alt text](<99 misc/grid.png>)

The new value of each pixel would be the average of the values of all of the pixels that are within `1 row` and column of the original pixel (forming a `3x3` box). For example, each of the color values for pixel 6 would be obtained by averaging the original color values of pixels `1`, `2`, `3`, `5`, `6`, `7`, `9`, `10`, and `11` (note that pixel 6 itself is included in the average). Likewise, the color values for pixel 11 would be be obtained by averaging the color values of pixels `6`, `7`, `8`, `10`, `11`, `12`, `14`, `15` and `16`.

For a pixel along the edge or corner, like pixel 15, we would still look for all pixels within `1` row and column: in this case, pixels `10`, `11`, `12`, `14`, `15`, and `16`.

## Edges
In artificial intelligence algorithms for image processing, it is often useful to detect edges in an image: lines in the image that create a boundary between one object and another. One way to achieve this effect is by applying the `Sobel operator` to the image.

Like image blurring, edge detection also works by taking each pixel, and modifying it based on the 3x3 grid of pixels that surrounds that pixel. But instead of just taking the average of the nine pixels, the Sobel operator computes the new value of each pixel by taking a weighted sum of the values for the surrounding pixels. And since edges between objects could take place in both a vertical and a horizontal direction, you’ll actually compute two weighted sums: one for detecting edges in the x direction, and one for detecting edges in the y direction. In particular, you’ll use the following two “kernels”:

![alt text](<99 misc/sobel.png>)

How to interpret these kernels? In short, for each of the three color values for each pixel, we’ll compute two values Gx and Gy. To compute Gx for the red channel value of a pixel, for instance, we’ll take the original red values for the nine pixels that form a 3x3 box around the pixel, multiply them each by the corresponding value in the Gx kernel, and take the sum of the resulting values.

Why these particular values for the kernel? In the `Gx direction`, for instance, we’re multiplying the pixels to the `right of the target pixel` by a `positive number`, and multiplying the pixels to the `left of the target pixel by a negative number`. When we take the sum, if the pixels on the `right are a similar color` to the `pixels on the left`, the result will be close to `0` (`the numbers cancel out`). But if the pixels on the right are very different from the pixels on the left, then the resulting value will be very positive or very negative, indicating `a change in color that likely is the result of a boundary` between objects. And a similar argument holds true for calculating edges in the y direction.

Using these kernels, we can generate a `Gx and Gy `value for each of the red, green, and blue channels for a pixel. But each channel can only take on one value, not two: so we need some way to combine Gx and Gy into a single value. The Sobel filter algorithm combines Gx and Gy into a final value by calculating the `square root of Gx^2 + Gy^2`. And since channel values can only take on integer values from 0 to 255, be sure the resulting value is rounded to the nearest integer and `capped at 255!`

And what about handling pixels at the edge, or in the corner of the image? There are many ways to handle pixels at the edge, but for the purposes of this problem, we’ll ask you to treat the image as if there was a `1 pixel solid black border` around the edge of the image: therefore, trying to access a pixel past the edge of the image should be treated as a solid black pixel (values of 0 for each of red, green, and blue). This will effectively ignore those pixels from our calculations of Gx and Gy.

---

# specification (Objective)

Implement the functions in helpers.c such that a user can apply grayscale, reflection, blur, or edge detection filters to their images.

- The function grayscale should take an image and turn it into a black-and-white version of the same image.
- The reflect function should take an image and reflect it horizontally.
- The blur function should take an image and turn it into a box-blurred version of the same image.
- The edges function should take an image and highlight the edges between objects, according to the Sobel operator.

You should not modify any of the function signatures, nor should you modify any other files other than helpers.c.

---

# understanding the distributed codes.

## [bmp.h](filter-more_dist/filter-more/bmp.h)

Open up `bmp.h` (as by double-clicking on it in the file browser) and have a look.

You’ll see definitions of the headers we’ve mentioned (`BITMAPINFOHEADER` and `BITMAPFILEHEADER`). In addition, that file defines `BYTE`, `DWORD`, `LONG`, and `WORD`, data types normally found in the world of Windows programming. Notice how they’re just aliases for primitives with which you are (hopefully) already familiar. It appears that `BITMAPFILEHEADER` and `BITMAPINFOHEADER` make use of these types.

Perhaps most importantly for you, this file also defines a `struct` called `RGBTRIPLE` that, quite simply, “encapsulates” three bytes: one blue, one green, and one red (the order, recall, in which we expect to find RGB triples actually on disk).

Why are these `structs` useful? Well, recall that a file is just a sequence of bytes (or, ultimately, bits) on disk. But those bytes are generally ordered in such a way that the first few represent something, the next few represent something else, and so on. “File formats” exist because the world has standardized what bytes mean what. Now, we could just read a file from disk into RAM as one big array of bytes. And we could just remember that the byte at `array[i]` represents one thing, while the byte at `array[j]` represents another. But why not give some of those bytes names so that we can retrieve them from memory more easily? That’s precisely what the structs in `bmp.h` allow us to do. Rather than think of some file as one long sequence of bytes, we can instead think of it as a sequence of structs.

---

## [filter.c](filter-more_dist/filter-more/filter.c)

### I'm using the cs50x's explanation for this one, for now.

Now, let’s open up filter.c. This file has been written already for you, but there are a couple important points worth noting here.

First, notice the definition of filters on line 10. That string tells the program what the allowable command-line arguments to the program are: b, e, g, and r. Each of them specifies a different filter that we might apply to our images: blur, edge detection, grayscale, and reflection.

The next several lines open up an image file, make sure it’s indeed a BMP file, and read all of the pixel information into a 2D array called image.

Scroll down to the switch statement that begins on line 101. Notice that, depending on what filter we’ve chosen, a different function is called: if the user chooses filter b, the program calls the blur function; if e, then edges is called; if g, then grayscale is called; and if r, then reflect is called. Notice, too, that each of these functions take as arguments the height of the image, the width of the image, and the 2D array of pixels.

These are the functions you’ll (soon!) implement. As you might imagine, the goal is for each of these functions to edit the 2D array of pixels in such a way that the desired filter is applied to the image.

The remaining lines of the program take the resulting image and write them out to a new image file.

## [helper.h](filter-more_dist/filter-more/helpers.h)

Next, take a look at helpers.h. This file is quite short, and just provides the function prototypes for the functions you saw earlier.

Here, take note of the fact that each function takes a 2D array called image as an argument, where image is an array of height many rows, and each row is itself another array of width many RGBTRIPLEs. So if image represents the whole picture, then image[0] represents the first row, and image[0][0] represents the pixel in the upper-left corner of the image.

## [helpers.c](filter-more_dist/filter-more/helpers.c)

Now, open up helpers.c. Here’s where the implementation of the functions declared in helpers.h belong. But note that, right now, the implementations are missing! This part is up to you.

## [makefile](filter-more_dist/filter-more/Makefile)

Finally, let’s look at Makefile. This file specifies what should happen when we run a terminal command like make filter. Whereas programs you may have written before were confined to just one file, filter seems to use multiple files: filter.c and helpers.c. So we’ll need to tell make how to compile this file.

Try compiling filter for yourself by going to your terminal and running

`$ make filter`
Then, you can run the program by running:

`$ ./filter -g images/yard.bmp out.bmp`

which takes the image at images/yard.bmp, and generates a new image called out.bmp after running the pixels through the grayscale function. grayscale doesn’t do anything just yet, though, so the output image should look the same as the original yard.

---

# Yeah. cs50x, nice, didn't even explain wtf `getopt` is. 


---

# Function TODO begins(helpers.c)

# Grayscale

Following the CS50x approach, grayscaling is done by averaging the Red, Green, and Blue values of a pixel and rounding that average to the nearest integer. We apply this to every pixel until the image is fully processed.


## Logic & Implementation
**Header**: Included `<math.h>` to access the `round()` function.
**Navigation**: Since images are 2D planes, I used nested `for` loops with `i` (Y-coordinate/height) and `j` (X-coordinate/width) to navigate between every individual pixel.
**Variable Handling**: Inside the loops, I declared `r`, `g`, and `b` as `float` variables. This ensures that when they are added, they aren't prematurely treated as integers.
**The Calculation**: The average was calculated as `(r + g + b) / 3.0`. Using `3.0` is critical to ensure the division remains a floating-point operation.
**Rounding**: Declared a `rounded_average` integer. Using `round(average)` ensures the value is accurate before assigning it back to the `rgbtRed`, `rgbtGreen`, and `rgbtBlue` components of the pixel.

## Environment Fixes (The Windows "STUPIDITY")
Even with perfect logic and code, the code initially fails on Windows(shows incompatiable file error) due to two specific OS behaviors:

1. Binary File Handling (`filter.c`)
Unlike Linux, Windows distinguishes between text and binary files. If not specified, it treats the BMP as text, which corrupts the data.
The Fix: Modified `filter.c` (Lines 39 and 47) to use `rb` (read binary) and `wb` (write binary) in the `fopen` function.

2. Struct Padding (bmp.h)
The Windows GCC compiler adds "invisible bytes" (padding) to structs for memory alignment. Even though the BMP header should be exactly 14 bytes, Windows tries to make it 16, which breaks the file reading.

The Nuclear Option: Wrapped the structs in `bmp.h` with `#pragma pack(push, 1)` at the top and `#pragma pack(pop)` at the bottom. This forces the compiler to respect the exact byte count and ignore the default padding.

---

# Reflect

The function objective is to flip the image horizontally. Every row of pixels must be reversed, so the left side moves to the right and vice versa, creating a mirror image.

**1. The Swap(The "Temporary variable")**
In C, you cannot swap two values directly without losing one. To swap the pixel at the start of the row with the pixel at the end, I used a "temporary variable" strategy:
*   Store the first pixel in a `temp` variable of type `RGBTRIPLE`.(DATA TYPE MUST BE `RGBTRIPLE`, this is very important)
*   Move the last pixel into the first pixel’s position.
*   Move the `temp` value into the last pixel’s position.

**2. Navigation**
I used nested `for` loops to process the image:
*   **Outer Loop ($i$):** Iterates through every row from `0` to `height`.
*   **Inner Loop ($j$):** Iterates through the columns. However, unlike Grayscale, this loop only goes from `0` to `width / 2`.

**3. The Index Math**
To find the pixel on the opposite side of the row, I used the formula: `width - 1 - j`.
*   If `width` is 600 and we are at `j = 0`, the opposite is `599`.(this is using common sense cause arrays start at 0.)
*   If `j = 1`, the opposite is `598`.

### **Solving the "Halfway" Issue (Odd vs. Even Widths)**

A major concern was whether `width / 2` would break the image if the width was an odd number (example: 501 pixels). Because C uses **Integer Division**, the math handles this perfectly.(which was unexpected by me)

#### **Case 1: Even Width (4 pixels)**
*   Indices: `[0] [1] [2] [3]`
*   Loop Limit: `j < 4 / 2` → `j < 2`
*   **j = 0:** Swaps `[0]` with `[3]`.
*   **j = 1:** Swaps `[1]` with `[2]`.
*   **Result:** All pixels swapped once. Loop ends.

#### **Case 2: Odd Width (e.g., 5 pixels)**
*   Indices: `[0] [1] [2] [3] [4]`
*   Loop Limit: `j < 5 / 2` → `j < 2` (The `.5` is truncated by C)(positive behav).
*   **j = 0:** Swaps `[0]` with `[4]`.
*   **j = 1:** Swaps `[1]` with `[3]`.
*   **j = 2:** The condition `2 < 2` is **False**. The loop stops.
*   **Result:** The middle pixel at index `[2]` stays exactly where it is. This is mathematically correct for a reflection—the center point of a mirror image should not move.

### **Environmental issues**
Since I am working on a local Windows machine, this filter relies on the previously established **Binary Mode** fixes in `filter.c` and **Struct Packing** in `bmp.h` to ensure the image data is read and written without corruption.

---

# blur (inefficient-deleted)

## The "Manual Build" Approach

Blurring is the most complex filter in this set. Unlike Grayscale (which looks at one pixel) or Reflect (which swaps two), Blur requires looking at a "Box Blur" logic: taking the average of a pixel and all its surrounding neighbors in a $3 \times 3$ grid.

**1. The "Clean Slate" Problem (The Copy)**
The biggest realization was that I couldn't modify the image directly as I went. If I blur Pixel A and then move to Pixel B, I’d be calculating Pixel B’s average using the *already blurred* version of Pixel A. That would result in a "smear" rather than a blur.
- **My Solution:** I created a full-sized `RGBTRIPLE copy[height][width]`. I manually looped through every single pixel and copied the original colors over first. I read the neighbor colors from the `copy` and wrote the final result into the actual `image`.

**2. The Manual Mapping ($r_0$ to $r_8$)**
Instead of using complex loops, I chose to manually map out every possible neighbor for a pixel at coordinates `(i, j)`:
*   **$r_0$:** The center pixel itself.
*   **$r_1, r_2$:** The pixels directly above and below.
*   **$r_3, r_4$:** The pixels to the right and left.
*   **$r_5, r_6, r_7, r_8$:** The four diagonal corners.

This resulted in a lot of code, but it allowed me to visualize exactly where the computer was looking on the 2D plane.

**3. Corner and Edge Protection (The Boundary Checks)**
A pixel in the middle has 8 neighbors, but a pixel on the corner only has 3. If I tried to check for a neighbor that didn't exist (like looking for a pixel at row `-1`), the program would crash.
- **The Logic:** For every neighbor from $r_1$ to $r_8$, I wrote an `if` statement to check if the coordinates were valid:
    -   Is the row between `0` and `height - 1`?
    -   Is the column between `0` and `width - 1`?
-   **The Counter:** I used a `float counter` that started at `1` (for the center pixel) and increased every time an `if` statement found a valid neighbor.

**4. The Final Math**
After checking all 8 neighbors, I added all the color values together. Even though I had 9 variables ($r_0$ through $r_8$), the ones that didn't exist stayed at `0`. By dividing the total sum by my `counter` (the number of neighbors actually found) and using the `round()` function, I achieved a perfect average for every pixel, whether it was in the center, on an edge, or in a corner.

### BUT THIS WAS NOT IT.
Is it the most efficient way to write it? No. It’s nearly 100 lines of code just for one filter. However, by writing out every single `if` statement and every coordinate by hand, I forced myself to understand exactly how 2D array navigation works. I didn't take any shortcuts; I built the logic brick by brick until it worked.

---

# Blur (efficient code) (re-documentation)

The Box Blur effect is achieved by taking a pixel and making it the average of its own color and the colors of every pixel immediately surrounding it. In a perfect scenario, this is a $3 \times 3$ grid involving 9 pixels.

#### **2. The "Buffer" Strategy (Image Duplication)**
A common trap in image processing is the **"Smear Bug."** If you modify a pixel's color and then move to its neighbor, that neighbor will calculate its own average using the *already blurred* color of the previous pixel.
-   **The Solution:** I first created an exact duplicate of the image called `copy`. 
-   **Logic:** The algorithm **reads** original color data from the `copy` but **writes** the newly calculated averages back into the original `image`. This ensures the blur is calculated based on the untouched source data.

#### **3. The "Window co-ordination Loop" Algorithm**
Instead of writing separate logic for all 8 possible neighbors, this implementation uses a nested loop to create a relative "window" around the target pixel $(i, j)$.

*   **Height Offset:** Ranges from `-1` (row above) to `1` (row below).
*   **Width Offset:** Ranges from `-1` (column left) to `1` (column right).

This effectively creates a coordinate system where $(0, 0)$ is the pixel we are currently blurring.

#### **4. Dynamic Boundary Handling**
The most difficult part of blurring is handling **corners** and **edges**, where some neighbors simply do not exist. So, we try to calculate the co-ordinate of the pixels around the main pixel!. remember, we are NOT using the offsets to do this math, if we use offset, we will be using minus 1 and 0 which are invalid!! so, we do addition and substraction to calculate the co-ordinate of a pixel and then we work on it! 
-   **The Math:** For every step in the window loop, we calculate the absolute address:
    -   `neighbor_i = i + height_offset`
    -   `neighbor_j = j + width_offset`
-   **The Check:** Before adding a pixel's color to the total, we pass it through a "Shield" (an `if` statement):
    -   Is `neighbor_i` between $0$ and `height - 1`?
    -   Is `neighbor_j` between $0$ and `width - 1`?
-   **The Result:** If the neighbor is off-map (like trying to look at row -1), the code simply skips it. This allows the same code to handle a middle pixel (9 neighbors), an edge (6 neighbors), or a corner (4 neighbors) perfectly.

#### **5. Color Accumulation and Precision**
*   **Buckets:** I declared four `float` variables: `total_Red`, `total_Green`, `total_Blue`, and `counter`. 
*   **Reset:** These reset to $0$ for every new pixel $(i, j)$ before the window loop starts.(the 3rd --> 4th loop)
*   **Rounding:** Once the window loop finishes, the totals are divided by the `counter` (the number of valid pixels actually found). Using the `round()` function ensures that the resulting integer is the most accurate representation of the average brightness.

---

### **Why this is better than Manual Mapping**

| Feature | Manual Implementation | Window Loop Implementation |
| :--- | :--- | :--- |
| **Code Length** | ~100 lines | ~20 lines |
| **Scalability** | Must rewrite everything to increase blur size. | Just change the loop range (e.g., -2 to 2). |
| **Error Risk** | High (easy to mix up `i+1` or `j-1`). | Low (math handles coordinates automatically). |
| **Maintenance** | Hard to read and debug. | Clean & algorithmic and scalable. |

### **Final Logic Flow Summary**
1.  **Copy** the image.
2.  **Iterate** through every pixel $(i, j)$.
3.  **Open a Window** from $-1$ to $+1$ around that pixel.
4.  **Validate** if the neighbor exists within the image bounds.
5.  **Sum** the colors of all valid neighbors and **Increment** the counter.
6.  **Average** the sums by the counter, **Round** them, and **Save** them to the original image.

---

# edge detection (The Sobel Operator)

The Edges filter is designed to highlight the boundaries within an image. It works by detecting areas of high contrast—where colors change sharply from one pixel to the next. This is achieved using the **Sobel Operator**, which calculates the "gradient" (the rate of change) in both the horizontal ($G_x$) and vertical ($G_y$) directions.

#### **2. The Sobel Kernels**
To detect these changes, I utilized two $3 \times 3$ grids of weights, known as **Kernels** as ryan hinted to me in those introductory videos:

*   **$G_x$ (Horizontal):** Designed to ignore vertical lines and highlight horizontal changes (left vs. right).
*   **$G_y$ (Vertical):** Designed to ignore horizontal lines and highlight vertical changes (top vs. bottom).

In the code, these are represented as 2D arrays:
```c
int Gx[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};
int Gy[3][3] = {{-1, -2, -1}, {0, 0, 0}, {1, 2, 1}};
```

#### **3. Treating the Borders**
Unlike the Blur filter, which averages only the neighbors that exist, the Sobel operator assumes that any pixel outside the bounds of the image is **pure black** (all color values = 0).
*   **The Implementation:** I used a "Shield" (`if` statement) to check if the neighbor's coordinates were valid. If they were valid, I multiplied the color by the kernel weight. If they were invalid, the code does nothing—effectively adding "zero" to the total, which perfectly satisfies the requirement of treating borders as black.

#### **4. The Window Loop Algorithm**
Building on the "Window Loop" logic from the Blur filter, I used four nested loops:
1.  **Image Navigation ($i, j$):** To visit every pixel in the original image.
2.  **Window Navigation (offsets):** To visit the $3 \times 3$ neighborhood around each pixel.

**Kernel Mapping:** I mapped the relative offsets ($-1, 0, 1$) to the array indices ($0, 1, 2$) by adding $1$ to the offset: `Gx[1 + height_offset][1 + width_offset]`. This allows the loop to automatically pick the correct multiplier for every neighbor.

#### **5. The Combined Gradient Math**
For every pixel, I calculated six independent values: $G_x$ and $G_y$ for Red, Green, and Blue. To find the final magnitude of the edge, I combined the horizontal and vertical components using a formula similar to the Pythagorean theorem:

$$\text{Final Color} = \sqrt{G_x^2 + G_y^2}$$

*   **Accumulators:** Used `float` variables to prevent rounding errors during the summation of $G_x$ and $G_y$.
*   **Finalization:** Used `round(sqrt(...))` to convert the magnitude back to a whole number.
*   **Capping:** Since the Sobel math can result in values much higher than a byte can hold, I implemented a strict "Cap" to ensure no value exceeds **255**.

#### **6. Logic Flow Summary**
1.  **Copy** the image to preserve original data during the process.
2.  **Iterate** through every pixel.
3.  **Reset** the $G_x$ and $G_y$ "buckets" to zero for every new pixel.
4.  **Sweep** a $3 \times 3$ window around the pixel.
5.  **Multiply** valid neighbors by the kernel weights and add them to the $G_x/G_y$ totals.
6.  **Combine** $G_x$ and $G_y$ using the square-root formula.
7.  **Cap** the final value at 255 and update the original image.

---
`


VOILA~~~!!!