
# This is what they said in the jupyter notebook. Quite a challenge for a first time numpy user, i didnt even knew it existed.

>[!note]-
>> it seems, i didnt had to learn about jupyter that much and waste 3 days after it and could have just started this workshop of deeplearning.ai

Welcome to your first notebook of this specialization! In this notebook, you will use NumPy to create 2-D arrays and easily compute mathematical operations. NumPy (Numerical Python) is an open-source package that is widely used in science and engineering. Feel free to skip this notebook if you are already fluent with NumPy.

**After this assignment you will be able to:**
- Use Jupyter Notebook and its features.
- Use NumPy functions to create arrays and NumPy array operations.
- Use indexing and slicing for 2-D arrays.
- Find the shape of an array, reshape it and stack it horizontally and vertically.

**Instructions**
You will be using Python 3.
Follow along the cells using Shift+Enter. Alternatively, you can press Run in the menu.

---

# Table of Contents

[[#About Jupyter Notebooks]]
- [[#1 - Basics of NumPy]]
    - [[#1.1 - Packages]]
    - [[#1.2 - Advantages of using NumPy arrays]]
    - [[#1.3 - How to create NumPy arrays]]
    - [[#1.4 - More on NumPy arrays]]
- [[2 - Multidimensional arrays]]
    -[[ 2.1 - Finding size, shape and dimension]]
- [[3 - Array math operations]]
    - [[3.1 - Multiplying vector with a scalar (broadcasting)]]
- [[4 - Indexing and slicing]]
    - [[4.1 - Indexing]]
    - [[4.2 - Slicing]]
- [[5 - Stacking]]
- [[6 - Exercises]]

---

## About Jupyter Notebooks

Jupyter Notebooks are interactive coding journals that integrate live code, explanatory text, equations, visualizations and other multimedia resources, all in a single document. As a first exercise, run the test snippet below and the print statement cell for "Hello World".
```python
# Run the "Hello World" in the cell below to print "Hello World". 
test = "hello worlddd"
```

```python
print(test)
```
## # 1 - Basics of NumPy

NumPy is the main package for scientific computing in Python. It performs a wide variety of advanced mathematical operations with high efficiency. In this practice lab you will learn several key NumPy functions that will help you in future assignments, such as creating arrays, slicing, indexing, reshaping and stacking.

### 1.1 - Packages

Before you get started, you have to import NumPy to load its functions. As you may notice, even though there is no expected output, when you run this cell, the Jupyter Notebook imports the package (often referred to as the library) and its functions. Try it for yourself and run the following cell.

```python
import numpy as np
```

### 1.2 - Advantages of using NumPy arrays

Arrays are one of the core data structures of the NumPy library, essential for organizing your data. You can think of them as a grid of values, all of the same type. If you have used Python lists before, you may remember that they are convenient, as you can store different data types. However, Python lists are limited in functions and take up more space and time to process than NumPy arrays.

NumPy provides an array object that is much faster and more compact than Python lists. Through its extensive API integration, the library offers many built-in functions that make computing much easier with only a few lines of code. This can be a huge advantage when performing math operations on large datasets.

The array object in NumPy is called `ndarray` meaning 'n-dimensional array'. To begin with, you will use one of the most common array types: the one-dimensional array ('1-D'). A 1-D array represents a standard list of values entirely in one dimension. Remember that in NumPy, all of the elements within the array are of the same type.

```python
one_dimensional_arr = np.array([10, 12])
print(one_dimensional_arr)
```


### 1.3 - How to create NumPy arrays

There are several ways to create an array in NumPy. You can create a 1-D array by simply using the function `array()` which takes in a list of values as an argument and returns a 1-D array.

```python
# Create and print a NumPy array 'a' containing the elements 1, 2, 3.
a = np.array([1, 2, 3])
print(a)
```

Another way to implement an array is using `np.arange()`. This function will return an array of evenly spaced values within a given interval. To learn more about the arguments that this function takes, there is a powerful feature in Jupyter Notebook that allows you to access the documentation of any function by simply pressing `shift+tab` on your keyboard when clicking on the function. Give it a try for the built-in documentation of `np.arange()`.

```python
# Create an array with 3 integers, starting from the default integer 0.
b = np.arange(3)
print(b)
```

```python
# Create an array that starts from the integer 1, ends at 20, incremented by 3.
c = np.arange(1, 20, 3)
print(c)
```


What if you wanted to create an array with five evenly spaced values in the interval from 0 to 100? As you may notice, you have 3 parameters that a function must take. One paremeter is the starting number, in this case 0, the final number 100 and the number of elements in the array, in this case, 5. NumPy has a function that allows you to do specifically this by using `np.linspace()`.

```python
lin_spaced_arr = np.linspace(0, 100, 5,)
print(lin_spaced_arr)
```

Did you notice that the output of the function is presented in the float value form (e.g. "... 25. 50. ...")? The reason is that the default type for values in the NumPy function `np.linspace` is a floating point (`np.float64`). You can easily specify your data type using `dtype`. If you access the built-in documentation for the functions, you will notice that most numpy functions take an optional parameter `dtype`. In addition to float, NumPy has several other data types such as `int`, and `char`.

To change the type to integers, you need to set the dtype to `int`. You can do so, even in the previous functions. Feel free to try it out and modify the cells to output your desired data type.

```python
lin_spaced_arr_int = np.linspace(0, 100, 5, dtype=int)
print(lin_spaced_arr_int)
```

```python
c_int = np.arange(1, 20, 3, dtype=int)
print(c_int)
```

```python
b_float = np.arange(3, dtype=float)
print(b_float)
```

```python
char_arr = np.array(['Welcome to Math for ML!'])
print(char_arr)
print(char_arr.dtype) # Prints the data type of the array
```

Did you notice that the output of the data type of the `char_arr` array is `<U23`? This means that the string (`'Welcome to Math for ML!'`) is a 23-character (23) unicode string (`U`) on a little-endian architecture (`<`). You can learn more about data types [here](https://numpy.org/doc/stable/user/basics.types.html).

### 1.4 - More on NumPy arrays

One of the advantages of using NumPy is that you can easily create arrays with built-in functions such as:

- `np.ones()` - Returns a new array setting values to one.
- `np.zeros()` - Returns a new array setting values to zero.
- `np.empty()` - Returns a new uninitialized array.
- `np.random.rand()` - Returns a new array with values chosen at random.

```python
# Return a new array of shape 3, filled with ones. 
ones_arr = np.ones(3)
print(ones_arr)
```

```python
# Return a new array of shape 3, filled with zeroes.
zeros_arr = np.zeros(3)
print(zeros_arr)
```

```python
# Return a new array of shape 3, without initializing entries.
empt_arr = np.empty(3)
print(empt_arr)
```

```python
# Return a new array of shape 3 with random numbers between 0 and 1.
rand_arr = np.random.rand(3,3,3)
print(rand_arr)
```

