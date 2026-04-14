# Linear Dependence and Independence in Matrices

**Tags:** #math/linear-algebra #math #math/matrices #math/linear-dependence

## 💡 The Core Concept
You can determine if a matrix is **Singular** or **Non-Singular** directly by looking for **linear dependence** between its rows (or columns). If one row can be created by multiplying, adding, or averaging other rows, the system carries redundant information and is **Singular**. If no such relation exists, the rows are **linearly independent**, and the matrix is **Non-Singular**.

> [!important] The Rule of Linear Dependence
> - **Linearly Dependent:** At least one row can be obtained by a mathematical combination (a *linear combination*) of the other rows. This matrix is **Singular**.
> - **Linearly Independent:** No row can be formed from the other rows. Every equation provides completely unique information. This matrix is **Non-Singular**.

---

## 🛠️ Linear Dependence in $2 \times 2$ Matrices
In small systems, linear dependence is easy to spot: you simply look for direct scalar multiples. 

### Non-Singular (Linearly Independent)
$$ 
\begin{cases} 
a + b = 0 \\ 
a + 2b = 0 
\end{cases} 
\implies 
\begin{bmatrix} 
1 & 1 \\ 
1 & 2 
\end{bmatrix} 
$$
* **Observation:** No equation is a multiple of the other.
* **Status:** Rows are **Linearly Independent** $\rightarrow$ **Non-Singular**.

### Singular (Linearly Dependent)
$$ 
\begin{cases} 
a + b = 0 \\ 
2a + 2b = 0 
\end{cases} 
\implies 
\begin{bmatrix} 
1 & 1 \\ 
2 & 2 
\end{bmatrix} 
$$
* **Observation:** The second row is exactly $2 \times$ the first row ($R_2 = 2R_1$).
* **Status:** Rows are **Linearly Dependent** $\rightarrow$ **Singular**.

---

## 🔍 Linear Dependence in larger $3 \times 3$ Matrices
In larger systems, dependence becomes more complex. A row might not just be a direct multiple of one other row; it could be the sum, difference, or average of multiple rows combined.

### Example 1: Direct Sums
$$ 
\begin{cases} 
a + 0b + 0c = 1 \\ 
0a + b + 0c = 2 \\
a + b + 0c = 3
\end{cases} 
\implies 
\begin{bmatrix} 
1 & 0 & 0 \\ 
0 & 1 & 0 \\
1 & 1 & 0
\end{bmatrix} 
$$
* **Relation:** Row $3$ is the exact sum of the first two rows ($R_1 + R_2 = R_3$). 
* **Status:** Linearly Dependent (Singular).

### Example 2: Multiples and Sums
$$ 
\begin{cases} 
a + b + c = 0 \\ 
2a + 2b + 2c = 0 \\
3a + 3b + 3c = 0
\end{cases} 
\implies 
\begin{bmatrix} 
1 & 1 & 1 \\ 
2 & 2 & 2 \\
3 & 3 & 3
\end{bmatrix} 
$$
* **Relation:** This is highly singular with multiple dependencies. $R_2 = 2R_1$, and $R_3 = 3R_1$. Furthermore, $R_1 + R_2 = R_3$.
* **Status:** Linearly Dependent (Singular).

### Example 3: Averages
Linear combinations can be subtle. 
$$ 
\begin{cases} 
a + b + c = 0 \\ 
a + b + 2c = 0 \\
a + b + 3c = 0
\end{cases} 
\implies 
\begin{bmatrix} 
1 & 1 & 1 \\ 
1 & 1 & 2 \\
1 & 1 & 3
\end{bmatrix} 
$$
* **Relation:** If you add Row $1$ and Row $3$, you get $[2, 2, 4]$. Dividing that by $2$ gives you $[1, 1, 2]$, which is exactly Row $2$. 
* **Equation:** $\frac{R_1 + R_3}{2} = R_2$ (Row 2 is the average of Rows 1 and 3).
* **Status:** Linearly Dependent (Singular).

---

## 🧠 Quiz: Identifying Dependency
Evaluate these matrices purely by looking for linear combinations between their rows.

> [!warning] Correction on Matrix 1
> It's easy to look at columns or make assumptions, but linear combinations must be proven mathematically. In Matrix 1, the relation is specifically derived from scaling and adding rows, not just matching columns.

### Matrix 1
$$ \begin{bmatrix} 1 & 0 & 1 \\ 0 & 1 & 0 \\ 3 & 2 & 3 \end{bmatrix} $$
* **Relation:** $3(R_1) + 2(R_2) = R_3$ $\implies 3(1,0,1) + 2(0,1,0) = (3,2,3)$
* **Status:** **Dependent (Singular)**

### Matrix 2
$$ \begin{bmatrix} 1 & 1 & 1 \\ 1 & 1 & 2 \\ 0 & 0 & -1 \end{bmatrix} $$
* **Relation:** $R_1 - R_2 = R_3$ $\implies (1-1, 1-1, 1-2) = (0, 0, -1)$
* **Status:** **Dependent (Singular)**

### Matrix 3
$$ \begin{bmatrix} 1 & 1 & 1 \\ 0 & 2 & 2 \\ 0 & 0 & 3 \end{bmatrix} $$
* **Relation:** Absolutely no linear combinations exist between the rows.
* **Status:** **Independent (Non-Singular)**

### Matrix 4
$$ \begin{bmatrix} 1 & 2 & 5 \\ 0 & 3 & -2 \\ 2 & 4 & 10 \end{bmatrix} $$
* **Relation:** $2(R_1) = R_3$ $\implies 2(1,2,5) = (2,4,10)$
* **Status:** **Dependent (Singular)**

---

## 🎯 Main Takeaways
- **Bypass Solving Equations:** You do not need to solve a system to know if it has a unique solution; simply check the matrix for row relationships.
- **Multiples = Singular:** In a $2 \times 2$ matrix, if one row is a scalar multiple of the other, the matrix is **Singular**.
- **Combinations = Singular:** In larger matrices, if any row can be derived by adding, subtracting, or scaling other rows (a **linear combination**), the matrix is **Singular**.
- **Unique Information = Non-Singular:** A matrix is **Non-Singular** strictly when all rows are **Linearly Independent**—meaning no row can be constructed mathematically from the others.