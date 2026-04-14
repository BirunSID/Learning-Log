# Singular vs Non-Singular Matrices

**Tags:** #math/linear-algebra #math #math/matrices #math/systems-of-equations

## 💡 The Core Concept
By stripping away the zeroed-out constants from a linear system, you can extract the remaining variable coefficients and organize them into a rectangular array called a **matrix**. A matrix is fundamentally tied to its underlying equations and directly inherits its **Singular** or **Non-Singular** status from that system.

> [!important] Matrix Structure
> In a matrix representing a linear system:
> - **Rows** correspond to the individual equations.
> - **Columns** correspond to the coefficients of each specific variable (e.g., the first column for $a$, the second for $b$, the third for $c$).

---

## 🛠️ Deriving Matrices from $2 \times 2$ Systems
When constants are set to $0$, we can ignore them entirely and focus solely on the coefficients. Here is how $2 \times 2$ systems translate into matrices:

### System 1: Non-Singular
$$ 
\begin{cases} 
1a + 1b = 0 \\ 
1a + 2b = 0 
\end{cases} 
\implies 
\begin{bmatrix} 
1 & 1 \\ 
1 & 2 
\end{bmatrix} 
$$
* **Solution Behavior:** Unique solution (only at the origin).
* **Status:** **Non-Singular System $\rightarrow$ Non-Singular Matrix**

### System 2: Singular
$$ 
\begin{cases} 
1a + 1b = 0 \\ 
2a + 2b = 0 
\end{cases} 
\implies 
\begin{bmatrix} 
1 & 1 \\ 
2 & 2 
\end{bmatrix} 
$$
* **Solution Behavior:** Infinitely many solutions (the second equation is just a multiple of the first).
* **Status:** **Singular System $\rightarrow$ Singular Matrix**

---

## 🔍 Extending the Zero-Constant Rule to $3 \times 3$ Systems
The exact same logic applies to larger systems with 3 equations and 3 unknowns ($a$, $b$, and $c$). By setting the constants to $0$, we can quickly extract the matrix and determine its singularity based on the solutions.

### System 1: Complete & Non-Singular
$$ 
\begin{cases} 
a + b + c = 0 \\ 
a + 2b + c = 0 \\
a + b + 2c = 0
\end{cases} 
\implies 
\begin{bmatrix} 
1 & 1 & 1 \\ 
1 & 2 & 1 \\
1 & 1 & 2
\end{bmatrix} 
$$
* **Solution:** Unique solution. Setting $a=0, b=0, c=0$ is the *only* way to satisfy the equations.

### Systems 2 & 3: Redundant & Singular
*(Note: When constants are zeroed out, Systems 2 and 3 merge into the exact same equations).*
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
* **Solution:** Infinite solutions. Solving this yields $c=0$, which leaves $a+b=0$ (or $a = -b$). Any point where $a$ is the negative of $b$ works.

### System 4: Redundant & Singular
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
* **Solution:** Infinite solutions. The 2nd and 3rd equations are just multiples of the 1st. All coordinates must add to $0$ ($a+b+c=0$). $a$ and $b$ can be anything, as long as $c = -a - b$.

> [!note] Bypassing Equation Solving
> Later in linear algebra, you will learn quicker methods (like finding the determinant) to look directly at the matrix itself and determine if it is **Singular** or **Non-Singular** without having to manually solve the system of equations.

---

## 🎯 Main Takeaways
- **Matrices as Objects:** A **matrix** is simply an array of numbers inside a rectangle, arising naturally from the coefficients of linear equations.
- **Matrix Singularity:** We label a matrix as **Singular** or **Non-Singular** based entirely on whether its corresponding system of equations is singular or non-singular.
- **Origin Solutions:** When testing for singularity by setting constants to $0$, a **Non-Singular** $3 \times 3$ system will only have one unique solution: the origin $(0,0,0)$.
- **Infinite Solutions = Singular:** If zeroing out the constants yields equations where variables can be written in terms of each other (e.g., $a = -b$), the system has infinite solutions and the corresponding matrix is **Singular**.