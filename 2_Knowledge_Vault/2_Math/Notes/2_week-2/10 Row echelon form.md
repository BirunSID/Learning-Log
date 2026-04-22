# Row Echelon Form
**Tags:** #math/linear-algebra #math/deeplearning-ai #math #math/matrix-rank

## 💡 The Core Concept
**Row Echelon Form (REF)** is a simplified version of a matrix obtained through a series of elementary row operations. Transforming a matrix into REF is the standard method for determining the **Rank** of a matrix and evaluating whether a system is **Singular** or **Non-Singular**. 

> [!important] The Rank Shortcut
> Once a matrix is in Row Echelon Form, its **Rank** is simply the number of $1$s appearing on the main diagonal.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. Algorithm for Non-Singular Matrices
To transform a matrix into REF, the goal is to create $1$s along the diagonal and $0$s below them.

**Original Matrix:**
$$ \begin{bmatrix} 5 & 1 \\ 4 & -3 \end{bmatrix} $$

**Step 1: Normalize Leading Coefficients**
Divide each row by its leftmost non-zero coefficient (the leading entry).
$$ \xrightarrow{R_1/5, R_2/4} \begin{bmatrix} 1 & 0.2 \\ 1 & -0.75 \end{bmatrix} $$

**Step 2: Eliminate Bottom-Left Entry**
Subtract the first row from the second row to create a zero.
$$ \xrightarrow{R_2 - R_1} \begin{bmatrix} 1 & 0.2 \\ 0 & -0.95 \end{bmatrix} $$

**Step 3: Normalize Second Row Leading Entry**
Divide the second row by its current leftmost non-zero coefficient ($-0.95$).
$$ \xrightarrow{R_2 / -0.95} \begin{bmatrix} 1 & 0.2 \\ 0 & 1 \end{bmatrix} $$
*This is the Row Echelon Form. Since there are **two** $1$s on the diagonal, the Rank is **2**.*

---

### 2. Algorithm for Singular Matrices
Singular matrices contain redundant information, which causes rows to "disappear" (turn into zeros) during reduction.

**Original Matrix:**
$$ \begin{bmatrix} 5 & 1 \\ 10 & 2 \end{bmatrix} $$

**Step 1: Normalize Leading Coefficients**
$$ \xrightarrow{R_1/5, R_2/10} \begin{bmatrix} 1 & 0.2 \\ 1 & 0.2 \end{bmatrix} $$

**Step 2: Eliminate Bottom-Left Entry**
$$ \xrightarrow{R_2 - R_1} \begin{bmatrix} 1 & 0.2 \\ 0 & 0 \end{bmatrix} $$
*At this point, we cannot divide the second row by a non-zero coefficient. We stop here. Since there is only **one** $1$ on the diagonal, the Rank is **1**.*

---

### 3. The Null Case (Zero Matrix)
A matrix containing only zeros cannot be manipulated further because division by zero is undefined.
$$ \text{Original Matrix: } \begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix} \implies \text{REF: } \begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix} $$
*Rank = **0**.*

---

## 🎯 Key Takeaways

> [!note] Rank & Diagonal Rule
> - **Rank 2:** Two $1$s on the diagonal $\implies$ Non-singular.
> - **Rank 1:** One $1$ on the diagonal $\implies$ Singular.
> - **Rank 0:** Zero $1$s on the diagonal $\implies$ Singular.

- **Singularity Check:** A square matrix is singular if and only if its Row Echelon Form contains at least one row of zeros (or fewer $1$s on the diagonal than the total number of rows).
- **Redundancy Discovery:** Row reduction reveals exactly which equations in a system are redundant.
- **Dimensionality Reduction:** In ML, if we find a matrix has a low rank relative to its size, we know the data can be represented in a lower-dimensional space without losing information.