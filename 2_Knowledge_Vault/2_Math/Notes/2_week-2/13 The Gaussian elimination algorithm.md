# The Gaussian Elimination Algorithm
**Tags:** #math/gaussian-elimination #math/augmented-matrix #math/back-substitution #math/identity-matrix

## 💡 The Core Concept
**Gaussian Elimination** is a formalized algorithm used to solve systems of linear equations by representing them as an **Augmented Matrix**. The process involves two primary phases: **Forward Elimination** (transforming the matrix into Row Echelon Form) and **Back Substitution** (simplifying to Reduced Row Echelon Form). This method is the foundational logic used by computational solvers (like NumPy) to find unique solutions or identify singular systems.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. The Augmented Matrix
To solve a system, we combine the coefficient matrix and the column of constants into a single structure.

**Original System:**
$$
\begin{cases} 
2a - b + c = 1 \\ 
2a + 2b + 4c = -2 \\ 
4a + b = -1 
\end{cases}
$$

**Augmented Form:**
$$
\begin{bmatrix} 
2 & -1 & 1 & \mid & 1 \\ 
2 & 2 & 4 & \mid & -2 \\ 
4 & 1 & 0 & \mid & -1 
\end{bmatrix}
$$

### 2. Phase 1: Forward Elimination (To REF)
The goal is to create a "staircase" of pivots (1s) with zeros below them.

*   **Normalize Pivot 1 ($R_1$):** Divide $R_1$ by 2.
    $$ \begin{bmatrix} 1 & -1/2 & 1/2 & \mid & 1/2 \\ 2 & 2 & 4 & \mid & -2 \\ 4 & 1 & 0 & \mid & -1 \end{bmatrix} $$
*   **Clear Below Pivot 1:** Perform $R_2 \leftarrow R_2 - 2R_1$ and $R_3 \leftarrow R_3 - 4R_1$.
    $$ \begin{bmatrix} 1 & -1/2 & 1/2 & \mid & 1/2 \\ 0 & 3 & 3 & \mid & -3 \\ 0 & 3 & -2 & \mid & -3 \end{bmatrix} $$
*   **Normalize Pivot 2 ($R_2$):** Divide $R_2$ by 3.
    $$ \begin{bmatrix} 1 & -1/2 & 1/2 & \mid & 1/2 \\ 0 & 1 & 1 & \mid & -1 \\ 0 & 3 & -2 & \mid & -3 \end{bmatrix} $$
*   **Clear Below Pivot 2:** Perform $R_3 \leftarrow R_3 - 3R_2$.
    $$ \begin{bmatrix} 1 & -1/2 & 1/2 & \mid & 1/2 \\ 0 & 1 & 1 & \mid & -1 \\ 0 & 0 & -5 & \mid & 0 \end{bmatrix} $$
*   **Normalize Pivot 3 ($R_3$):** Divide $R_3$ by -5.
    $$ \begin{bmatrix} 1 & -1/2 & 1/2 & \mid & 1/2 \\ 0 & 1 & 1 & \mid & -1 \\ 0 & 0 & 1 & \mid & 0 \end{bmatrix} $$

### 3. Phase 2: Back Substitution (To RREF)
We work from the bottom up to clear the values *above* the pivots, resulting in an **Identity Matrix** on the left.

*   **Clear Above Pivot 3:** $R_2 \leftarrow R_2 - R_3$ and $R_1 \leftarrow R_1 - \frac{1}{2}R_3$.
    $$ \begin{bmatrix} 1 & -1/2 & 0 & \mid & 1/2 \\ 0 & 1 & 0 & \mid & -1 \\ 0 & 0 & 1 & \mid & 0 \end{bmatrix} $$
*   **Clear Above Pivot 2:** $R_1 \leftarrow R_1 + \frac{1}{2}R_2$.
    $$ \begin{bmatrix} 1 & 0 & 0 & \mid & 0 \\ 0 & 1 & 0 & \mid & -1 \\ 0 & 0 & 1 & \mid & 0 \end{bmatrix} $$

**Final Solution:** $a = 0, b = -1, c = 0$.

---

## 🎯 Key Takeaways

> [!important] Handling Singular Systems
> If row reduction produces a row of zeros in the coefficient section ($0a + 0b + 0c$), you must check the constant column to determine the solution type:
> 1. **Infinitely Many Solutions:** The constant is also $0$. 
>    *   *Logic:* $0 = 0$ is always true.
>    *   *Example Matrix Row:* $\begin{bmatrix} 0 & 0 & 0 & \mid & 0 \end{bmatrix}$
> 2. **No Solution (Contradiction):** The constant is non-zero (e.g., $4$).
>    *   *Logic:* $0 = 4$ is impossible.
>    *   *Example Matrix Row:* $\begin{bmatrix} 0 & 0 & 0 & \mid & 4 \end{bmatrix}$

*   **Identity Matrix:** Successful Gaussian elimination on a non-singular square matrix always results in the identity matrix $I$, where the diagonal is 1s and all other entries are 0s.
*   **Algorithmic Efficiency:** Whatever row operations you perform on the variables must be performed identically on the constant column.
*   **ML Relevance:** This algorithm is the "under-the-hood" engine for solving weights in linear models and is essential for understanding how libraries like NumPy handle matrix inversions and linear solvers.