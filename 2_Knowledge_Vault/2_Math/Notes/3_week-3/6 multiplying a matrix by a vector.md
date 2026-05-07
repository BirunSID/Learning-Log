# Multiplying a Matrix by a Vector
**Tags:** #math/matrix-vector-product #math/linear-systems #math/dimensionality-constraints

## 💡 The Core Concept
Multiplying a matrix by a vector is essentially performing a series of **dot products** simultaneously. Each row of the matrix acts as a separate vector that "dots" with the input vector. This is the primary way we represent complex systems of linear equations in a compact, manageable format ($Ax = b$).

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. From Individual Dot Products to a Matrix
Consider a system of three linear equations. Each equation can be viewed as an individual dot product between a **coefficient row** and a **variable vector**:

$$
\begin{cases} 
1a + 1b + 1c = 10 \\ 
1a + 2b + 1c = 15 \\ 
1a + 1b + 2c = 12 
\end{cases}
\implies
\begin{bmatrix} 1 & 1 & 1 \\ 1 & 2 & 1 \\ 1 & 1 & 2 \end{bmatrix} \cdot \begin{bmatrix} a \\ b \\ c \end{bmatrix} = \begin{bmatrix} 10 \\ 15 \\ 12 \end{bmatrix}
$$

In this form:
- The **Matrix** represents the coefficients (the "weights").
- The **Vector** represents the unknowns (the "features").
- The **Result** is a new vector containing the solutions for each specific equation.

### 2. The Dimensionality Rule
For matrix-vector multiplication to be mathematically defined, the dimensions must align perfectly.

> [!important] The Fundamental Constraint
> The **number of columns** in the matrix must equal the **length (number of rows)** of the vector.
> - If Matrix $A$ is $M \times N$, then Vector $x$ must be $N \times 1$.

### 3. Rectangular Matrices
A matrix does not have to be square ($3 \times 3$) to multiply by a vector. 
- If you have 4 equations and 3 unknowns, you use a **$4 \times 3$ matrix**.
- Multiplying a $4 \times 3$ matrix by a $3 \times 1$ vector results in a **$4 \times 1$ result vector**.
- The result vector always has a length equal to the number of **rows** in the matrix.

---

## 🎯 Key Takeaways
- **Efficiency:** Matrix-vector multiplication allows us to compute an entire system of equations in a single mathematical step.
- **Visualizing Rows:** When you see $Ax$, imagine each row of $A$ "landing" on the vector $x$ to perform a dot product.
- **Python implementation:** In libraries like NumPy, this is typically handled by the `@` operator or the `np.dot()` / `np.matmul()` functions.
- **Dimensionality Matching:** If the matrix columns don't match the vector rows, you are essentially trying to take a dot product of two vectors with different lengths, which is impossible.