# 🛠️ Local Setup & Compatibility

    ### **Note on `cs50.h` and `cs50.c`**
    You will notice the CS50 library files located in this directory. While these are usually pre-installed in the `cs50.dev` cloud environment, I have included them here to support **local compilation and execution** on Windows machines.

    ### **Cross-Platform Compatibility Fix**
    Standard CS50 headers uses certain Linux/GCC attributes that are often unrecognized by Windows compilers, leading to "unrecognized token" errors. 

    To fix this, I have modified `cs50.h` to include a preprocessor macro that ensures compatibility across different environments:

    ```c
    #if !defined(__GNUC__)
    #define __attribute__(x)
    #endif
    ```

    This adjustment allows the code to respect the original Harvard source while remaining fully functional on a local Windows setup.

    ### **Usage**
    To compile any problem set locally, ensure you link the source file to the library in the parent directory:
    `gcc program.c ../cs50.c -o program`

---


### 🛠️ Local Compilation Guide

If you are running these programs on a local machine (not the CS50 Sandbox but rather windows as im using), you will encounter a "Linker Error" if you try to run the code normally. This is because the programs depend on the `cs50.c` library located in the parent directory or just about any directory you are working on or will associate with so on. This surely is a hassle. Here's the solution below.

#### **The Command**
To compile properly, you must manually link both your source code and the library source:
```bash
gcc mario.c ../cs50.c -o mario
```
#### **Why is this necessary instead of normal `gcc mario.c -o mario` ?**
When you use `#include "cs50.h"`, you are only telling the compiler what the functions *look like*. You are not giving it the actual **code** inside those functions. By adding `../cs50.c` to the command, you are handing the compiler the actual "toolset" it needs to build the final exe file that we can run. These might sound very complex but are very easy once you learn the core concept.

#### **Command Breakdown:**
*   **`gcc`**: The compiler used to turn C code into an exe.
*   **`mario.c`**: Your main source code file.
*   **`../cs50.c`**: Tells the compiler to look one folder up to find the implementation of the CS50 functions (like `get_int`).
*   **`-o mario`**: Tells the compiler to **Output** the result as a file named "mario".

#### **How to Run**
Once compiled, run the program directly from your terminal:
```powershell
./mario
```
ALSO
for more advanced use case, you can directly just add multiple `../` in order for the compiler to search through and find the relevant library to make use of , to compile the final output as intended. 

---