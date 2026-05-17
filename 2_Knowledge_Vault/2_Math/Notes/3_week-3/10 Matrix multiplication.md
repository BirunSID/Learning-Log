# Matrix Multiplication
**Tags:** #math/matrix-multiplication #math/linear-transformations #math/dimensionality

## 💡 The Core Concept
Matrix multiplication is far more than a simple arithmetic operation; it represents the **composition of linear transformations**. When you multiply two matrices $A$ and $B$, you are essentially finding a single new matrix that performs the action of both transformations in sequence. 

> [!warning] The Order Matters
> Transformations act on vectors from right to left. If you perform transformation $A$ first, then transformation $B$, the resulting matrix is written as $B \cdot A$. 

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. Geometric Interpretation: Combining Space
If Matrix $A$ transforms the standard grid into a skewed parallelogram, and Matrix $B$ transforms that parallelogram into a third shape, the product matrix $C = B \cdot A$ maps the original standard grid directly to that final third shape.

### 2. The Calculation Algorithm: Row-Column Dot Products
To find the value of any specific cell in the resulting matrix:
1.  Identify the **Row** number ($i$) and **Column** number ($j$) of the cell you want to fill.
2.  Take the **dot product** of the $i$-th **row** of the first matrix and the $j$-th **column** of the second matrix.

**Example (2x2):**
$$ \begin{bmatrix} 2 & -1 \\ 0 & 2 \end{bmatrix} \cdot \begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix} = \begin{bmatrix} (2\cdot3 + -1\cdot1) & (2\cdot1 + -1\cdot2) \\ (0\cdot3 + 2\cdot1) & (0\cdot1 + 2\cdot2) \end{bmatrix} = \begin{bmatrix} 5 & 0 \\ 2 & 4 \end{bmatrix} $$

### 3. Dimensionality Rules (Inner and Outer)
Matrices do not have to be square to be multiplied, but they must follow strict "compatibility" rules based on their dimensions.

**The Compatibility Rule:**
For a matrix product $A \cdot B$ to exist, the **columns of the first** must match the **rows of the second**. 
- $A: (m \times \mathbf{n})$
- $B: (\mathbf{n} \times p)$
- The "inner" numbers ($n$) must be identical.

**The Resulting Size:**
The product matrix takes its "height" from the first matrix and its "width" from the second.
- Resulting Matrix: $(m \times p)$

> [!example] Rectangular Example
> Multiplying a $(2 \times 3)$ matrix by a $(3 \times 4)$ matrix:
> 1. **Check Compatibility:** 3 columns in first = 3 rows in second. (✅ Compatible)
> 2. **Result Size:** 2 rows from first, 4 columns from second $\to$ Result is a $(2 \times 4)$ matrix.

---

## 🎯 Key Takeaways
*   **Composition:** $C = B \cdot A$ is the mathematical shortcut for "Do $A$, then do $B$."
*   **Calculated via Dot Products:** Every single entry in the output matrix is the result of a dot product between a row (left matrix) and a column (right matrix).
*   **Dimension Constraint:** The "inner" dimensions must match. If they don't, the multiplication is mathematically undefined because the dot products would have unequal lengths.
*   **Machine Learning Context:** This is how data flows through a Neural Network. The input vector is multiplied by weight matrices layer by layer, essentially "transforming" the data into higher-dimensional representations.