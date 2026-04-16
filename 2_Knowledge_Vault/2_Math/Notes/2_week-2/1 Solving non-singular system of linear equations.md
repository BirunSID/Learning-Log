# Solving Systems of Linear Equations via Elimination

**Tags:** #math/linear-algebra #math/deeplearning-ai #math #math/systems-of-equations #math/elimination

## 💡 The Core Concept
The fundamental goal of solving a system of linear equations is to transform a complex system into a **solved system**. A solved system is one where each equation explicitly isolates a single variable, directly providing its value. This is achieved through systematic algebraic manipulations that preserve the equality of the system while reducing the number of variables in each equation.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. Legal Equation Manipulations
To solve a system without changing its solution set, we use three primary "moves":
* **Multiplying by a constant:** If $a + b = 10$, then $k(a + b) = 10k$ is also true.
* **Adding/Subtracting equations:** If Eq1 and Eq2 are true, then $Eq1 + Eq2$ is also true.
* **Swapping equations:** The order of equations does not change the solution.

> [!important] Rule of Scaling
> Multiplying an equation by a constant $c$ scales every term, including the constant on the right-hand side.
> $$ a + b = 10 \xrightarrow{\times 7} 7a + 7b = 70 $$

### 2. The Elimination Algorithm (Step-by-Step)
Given a $2 \times 2$ system:
$$ \begin{cases} 5a + b = 17 \\ 4a - 3b = 6 \end{cases} $$

**Step 1: Normalize the coefficients of the first variable ($a$)**
Divide each equation by the coefficient of its first term to make the coefficient of $a$ equal to $1$.
$$ \begin{cases} a + 0.2b = 3.4 \\ a - 0.75b = 1.5 \end{cases} $$

**Step 2: Eliminate the variable from the second equation**
Subtract the first equation from the second equation to isolate $b$.
$$ (a - a) + (-0.75b - 0.2b) = 1.5 - 3.4 $$
$$ -0.95b = -1.9 $$
$$ b = 2 $$

**Step 3: Back-substitution**
Plug the found value of $b$ back into the simplified version of the first equation to find $a$.
$$ a + 0.2(2) = 3.4 $$
$$ a + 0.4 = 3.4 \implies a = 3 $$

**Final Solved System:**
$$ \begin{cases} a = 3 \\ b = 2 \end{cases} $$

### 3. Special Case: Zero Coefficients
If a variable is already missing from an equation, the coefficient is effectively $0$. 

> [!note] Shortcut
> If a system appears as:
> $$ \begin{cases} 5a + b = 17 \\ 3b = 6 \end{cases} $$
> You cannot divide by the coefficient of $a$ in the second equation (since $0a$). However, $a$ is already eliminated, allowing you to solve for $b$ immediately ($b = 2$) and substitute upward.

---

## 🎯 Key Takeaways

* **Solved Systems:** In ML, we often represent data as systems of equations. A "solved" system is the ultimate state where the weights or parameters are explicitly identified.
* **Singular vs. Non-singular:** 
	* **Non-singular:** The system has exactly one solution (the equations are independent).
	* **Singular:** The system may have no solution or infinite solutions (the equations are redundant or contradictory).
* **Elimination Logic:** The core of many computational solvers (like Gaussian Elimination) relies on these basic moves: scaling, adding, and substituting.

> [!warning] Pitfall: Constant Errors
> A common mistake when manipulating equations is forgetting to multiply or subtract the constant on the right side of the equals sign. Always apply the operation to both the left and right sides: $LHS = RHS$.

### Quiz Practice
**System:**
$$ \begin{cases} 2a + 5b = 46 \\ 8a + b = 32 \end{cases} $$
**Solution:** $a = 3, b = 8$.