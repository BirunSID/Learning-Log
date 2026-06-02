# Matrix Inverse
**Tags:** #math/matrix-inverse #math/singular-matrices #math/systems-of-equations

## 💡 The Core Concept
The **inverse** of a matrix $A$ (denoted as $A^{-1}$) is the matrix equivalent of a reciprocal (multiplicative inverse) of a number. In scalar arithmetic, multiplying a number by its reciprocal yields $1$ (e.g., $2 \times \frac{1}{2} = 1$). In matrix algebra, multiplying a matrix by its inverse yields the **Identity Matrix** ($I$):
$$ A \cdot A^{-1} = I $$

Geometrically, if a matrix $A$ acts as a linear transformation that rotates or stretches space, its inverse $A^{-1}$ is the transformation that **undoes** that action, returning the entire coordinate system back to its original state.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. Algebraic Definition
For a square matrix $A$, its inverse $A^{-1}$ satisfies:
$$ A \cdot A^{-1} = A^{-1} \cdot A = I $$

### 2. Finding an Inverse Using Systems of Equations
To find the entries of an unknown inverse matrix, we can set up and solve a system of linear equations.

**Example:** Find the inverse of $A = \begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix}$.

Let the inverse be $A^{-1} = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$. By definition:
$$ \begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix} \begin{bmatrix} a & b \\ c & d \end{bmatrix} = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} $$

Using row-column dot products, this yields a system of four equations with four variables:
$$
\begin{cases} 
3a + 1c = 1 \\ 
3b + 1d = 0 \\ 
1a + 2c = 0 \\ 
1b + 2d = 1 
\end{cases}
$$

Solving this system using standard elimination methods yields:
$$ a = \frac{2}{5}, \quad b = -\frac{1}{5}, \quad c = -\frac{1}{5}, \quad d = \frac{3}{5} $$

Thus:
$$ A^{-1} = \begin{bmatrix} 2/5 & -1/5 \\ -1/5 & 3/5 \end{bmatrix} $$

---

### 3. Practice Example (With Solution)
Find the inverse of $B = \begin{bmatrix} 5 & 2 \\ 1 & 2 \end{bmatrix}$.

Setting up the system:
$$ \begin{bmatrix} 5 & 2 \\ 1 & 2 \end{bmatrix} \begin{bmatrix} a & b \\ c & d \end{bmatrix} = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} \implies \begin{cases} 5a + 2c = 1 \\ 5b + 2d = 0 \\ a + 2c = 0 \\ b + 2d = 1 \end{cases} $$

Solving the system yields:
$$ a = \frac{1}{4}, \quad b = -\frac{1}{4}, \quad c = -\frac{1}{8}, \quad d = \frac{5}{8} $$
$$ B^{-1} = \begin{bmatrix} 1/4 & -1/4 \\ -1/8 & 5/8 \end{bmatrix} $$

---

### 4. Non-Existent Inverses (Singular Matrices)
Just like the number $0$ has no multiplicative inverse (since $\frac{1}{0}$ is undefined), some matrices do not have inverses.

**Example:** Find the inverse of $C = \begin{bmatrix} 1 & 1 \\ 2 & 2 \end{bmatrix}$.

Setting up the system of equations:
$$ \begin{bmatrix} 1 & 1 \\ 2 & 2 \end{bmatrix} \begin{bmatrix} a & b \\ c & d \end{bmatrix} = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} \implies \begin{cases} a + c = 1 \\ 2b + 2d = 1 \\ 2a + 2c = 0 \\ b + d = 0 \end{cases} $$

This system contains a clear contradiction:
*   Equation 1 states: $a + c = 1$
*   Equation 3 states: $2a + 2c = 0 \implies a + c = 0$

Since $a+c$ cannot be both $1$ and $0$ simultaneously, no solution exists. Thus, the matrix $C$ is **singular** and has no inverse.

---

## 🎯 Key Takeaways
*   **Inverse Existence:** A matrix has an inverse if and only if it is **non-singular** (meaning it has full rank and its determinant is non-zero).
*   **Undoing Transformations:** If a transformation squashes a 2D plane into a 1D line (which happens in singular matrices like Case 4), information is permanently lost. You cannot reconstruct a 2D plane from a 1D line, which is the geometric reason why singular matrices cannot be inverted.
*   **Notation:** The inverse is denoted as $A^{-1}$. Do not confuse this with element-wise division.