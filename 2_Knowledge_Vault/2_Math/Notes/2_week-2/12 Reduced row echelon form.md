# Reduced Row Echelon Form (RREF)
**Tags:** #math/rref #math/reduced-row-echelon-form #math/gaussian-elimination #math/dimensionality-reduction

## 💡 The Core Concept
**Reduced Row Echelon Form (RREF)** is the final destination of matrix row reduction. While Row Echelon Form (REF) provides an upper-diagonal structure that simplifies a system, RREF completely isolates the variables by ensuring that each pivot is the *only* non-zero entry in its column. For a non-singular system, the RREF is effectively the solved state of the system where each variable is isolated on one side of the equation.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. From System to RREF
Consider a non-singular system of equations. The process of reaching the solution $a=3, b=2$ is reflected in the matrix transformation to RREF.

**Original System & Matrix:**
$$ \begin{cases} 5a + b = 17 \\ 4a - 3b = 6 \end{cases} \implies \begin{bmatrix} 5 & 1 \\ 4 & -3 \end{bmatrix} $$

**Intermediate Step (REF):**
$$ \begin{bmatrix} 1 & 0.2 \\ 0 & 1 \end{bmatrix} $$

**Final Step (RREF):**
To reach RREF, we must eliminate the entry above the second pivot ($0.2$). We perform the operation $R_1 \leftarrow R_1 - 0.2(R_2)$.
$$ \begin{bmatrix} 1 & 0.2 \\ 0 & 1 \end{bmatrix} \xrightarrow{R_1 - 0.2R_2} \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} $$

This corresponds to the solved equations:
$$ \begin{cases} 1a + 0b = 3 \\ 0a + 1b = 2 \end{cases} $$

### 2. General Rules for RREF
A matrix is in Reduced Row Echelon Form only if it satisfies these three criteria:
1. It is already in **Row Echelon Form (REF)**.
2. Every **pivot** must be exactly $1$.
3. Any entry **above a pivot** in its column must be $0$.

> [!important] Structure Comparison
> - **REF:** Pivots are leading entries; zeros exist only *below* pivots.
> - **RREF:** Pivots are leading entries; zeros exist both *below and above* pivots.

### 3. Step-by-Step Procedure for a $3 \times 3$ Matrix
Given a matrix already in REF:
$$ \begin{bmatrix} 1 & 2 & 3 \\ 0 & 1 & 4 \\ 0 & 0 & 1 \end{bmatrix} $$

**Step 1: Clear entries above the second pivot**
Subtract 2 times the second row from the first row ($R_1 - 2R_2$):
$$ \begin{bmatrix} 1 & 0 & -5 \\ 0 & 1 & 4 \\ 0 & 0 & 1 \end{bmatrix} $$

**Step 2: Clear entries above the third pivot**
Add 5 times the third row to the first row ($R_1 + 5R_3$):
$$ \begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & 4 \\ 0 & 0 & 1 \end{bmatrix} $$
Subtract 4 times the third row from the second row ($R_2 - 4R_3$):
$$ \begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix} $$

---

## 🎯 Key Takeaways

> [!note] Rank Consistency
> Just like in REF, the **Rank** of a matrix in RREF is equal to the number of pivots ($1$s). 
> - A $5 \times 5$ Identity Matrix has Rank 5.
> - A singular matrix where rows collapsed to zero during reduction will have fewer pivots and thus lower rank.

*   **Pivot Normalization:** If your row reduction leaves you with a pivot other than $1$ (e.g., $3$), you must divide the entire row by that value to satisfy the RREF requirement for this course.
*   **Unique Representation:** While a matrix can have multiple different REFs depending on the row operations used, the **Reduced Row Echelon Form of a matrix is unique**.
*   **Machine Learning Utility:** RREF is the most "compressed" form of the linear system, revealing the absolute minimum number of independent variables required to represent the data.