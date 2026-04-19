# Solving Singular Systems with the Elimination Method
**Tags:** #math/linear-algebra #math/deeplearning-ai #math #math/singular-systems #math/systems-of-equations

## 💡 The Core Concept
A **singular system** is a system of linear equations that does not have a unique solution. When applying the elimination method to these systems, the process reveals one of two outcomes:
1.  **Redundancy:** The equations describe the same geometric space (e.g., overlapping lines), leading to **infinitely many solutions**.
2.  **Contradiction:** The equations describe parallel geometric spaces that never intersect, leading to **no solution**.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. Redundant Systems (Infinitely Many Solutions)
A system is redundant when one equation is a scalar multiple of another, providing no new information.

**Example System:**
$$ \begin{cases} a + b = 10 \\ 2a + 2b = 20 \end{cases} $$

**The Elimination Process:**
1.  **Normalize:** Divide the second equation by the coefficient of $a$ (which is $2$):
    $$ \begin{cases} a + b = 10 \\ a + b = 10 \end{cases} $$
2.  **Eliminate:** Subtract the first equation from the second:
    $$ (a + b) - (a + b) = 10 - 10 \implies 0 = 0 $$

> [!important] Result: $0 = 0$
> This is a tautology (always true). It indicates the system has **infinitely many solutions** because the variables are not constrained to a single point.

**Expressing the Solution (Degrees of Freedom):**
To represent the infinite solutions, we introduce a parameter $x$ (a degree of freedom):
- Let $a = x$
- Then $b = 10 - x$
The solution set is the line defined by all pairs $(x, 10-x)$.

---

### 2. Contradictory Systems (No Solution)
A system is contradictory when the linear combinations of the variables are the same, but they are equated to different constants.

**Example System:**
$$ \begin{cases} a + b = 10 \\ 2a + 2b = 24 \end{cases} $$

**The Elimination Process:**
1.  **Normalize:** Divide the second equation by $2$:
    $$ \begin{cases} a + b = 10 \\ a + b = 12 \end{cases} $$
2.  **Eliminate:** Subtract the first equation from the second:
    $$ (a + b) - (a + b) = 12 - 10 \implies 0 = 2 $$

> [!warning] Result: $0 = k$ (where $k \neq 0$)
> This is a **contradiction**. It is mathematically impossible for $0$ to equal $2$. This indicates the system has **no solution** (the lines are parallel and distinct).

---

### 3. Quick Identification (The Quiz Case)
Consider the system:
$$ \begin{cases} 5a + b = 11 \\ 10a + 2b = 22 \end{cases} $$

> [!note] Observation
> If you divide the second equation by $2$, you get $5a + b = 11$, which is identical to the first equation. Because the equations are linearly dependent, the system is singular and redundant, resulting in infinitely many solutions.

---

## 🎯 Key Takeaways
*   **Singularity:** A matrix/system is singular if its equations are linearly dependent.
*   **Elimination Outcome:**
    *   If variables cancel and you get $0 = 0 \rightarrow$ **Infinite Solutions** (Redundant).
    *   If variables cancel and you get $0 = \text{Non-zero Constant} \rightarrow$ **No Solution** (Contradictory).
*   **Degrees of Freedom:** In redundant systems, the number of variables you can choose freely (like $x$ above) represents the dimensionality of the solution space.
*   **ML Application:** In Machine Learning, singular systems often correspond to redundant features in a dataset, which can lead to numerical instability in algorithms like Linear Regression if not handled (e.g., via regularization).