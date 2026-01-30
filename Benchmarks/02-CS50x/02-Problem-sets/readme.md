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