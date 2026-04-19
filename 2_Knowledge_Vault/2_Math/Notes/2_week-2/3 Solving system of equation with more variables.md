# Solving $3 \times 3$ Systems with the Elimination Method
**Tags:** #math/linear-algebra #math/deeplearning-ai #math #math/elimination-method #math/systems-of-equations

## 💡 The Core Concept
Solving a system of three equations with three variables ($3 \times 3$) follows the same logic as the $2 \times 2$ case: **reduction**. The goal is to systematically eliminate variables one by one until you have a single equation with one unknown, then "back-propagate" those values to find the remaining variables. Geometrically, each equation represents a **plane** in 3D space, and a unique solution is the specific point where all three planes intersect.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. The Initial System
We start with a system of three equations:
$$ \begin{cases} a + b + 2c = 12 \\ 3a - 3b - c = 3 \\ 2a - b + 6c = 24 \end{cases} $$

### 2. Step 1: Isolate and Eliminate Variable $a$
To isolate $a$ in the first equation, we first **normalize** the column by dividing each row by the coefficient of $a$.

**Normalized Equations:**
- Row 1: $a + b + 2c = 12$
- Row 2: $a - b - \frac{1}{3}c = 1$
- Row 3: $a - \frac{1}{2}b + 3c = 12$

Next, subtract the first equation from the second and third rows to remove $a$:
$$ \begin{cases} a + b + 2c = 12 \\ -2b - \frac{7}{3}c = -11 \\ -\frac{3}{2}b + c = 0 \end{cases} $$

> [!info] Observation
> We have now reduced the problem. The bottom two equations form a $2 \times 2$ system containing only $b$ and $c$.

### 3. Step 2: Solve the $2 \times 2$ Sub-system
Focusing only on the bottom two rows:
1. **Normalize $b$**: Divide the second row by $-2$ and the third row by $-\frac{3}{2}$.
   - Row 2: $b + \frac{7}{6}c = \frac{11}{2}$
   - Row 3: $b - \frac{2}{3}c = 0$

2. **Eliminate $b$ from the third row**: Subtract Row 2 from Row 3.
   $$ (b - \frac{2}{3}c) - (b + \frac{7}{6}c) = 0 - \frac{11}{2} $$
   $$ -\frac{11}{6}c = -\frac{11}{2} $$
   $$ c = 3 $$

### 4. Step 3: Back-Substitution
Now that we have the value for $c$, we propagate the results "upstairs" to find $b$ and $a$.

**Finding $b$ (using the second equation):**
$$ b + \frac{7}{6}(3) = \frac{11}{2} $$
$$ b + \frac{7}{2} = \frac{11}{2} \implies b = 2 $$

**Finding $a$ (using the first equation):**
$$ a + 2 + 2(3) = 12 $$
$$ a + 8 = 12 \implies a = 4 $$

**Final Solution:**
$$ \begin{bmatrix} a \\ b \\ c \end{bmatrix} = \begin{bmatrix} 4 \\ 2 \\ 3 \end{bmatrix} $$

---

## 🎯 Key Takeaways

> [!important] The Recursive Strategy
> The Elimination Method is a recursive process. To solve for $n$ variables, you reduce the system to $n-1$ variables, then $n-2$, until you reach a single variable.

*   **Normalization:** Always ensure the leading coefficient of the variable you are currently eliminating is $1$. This makes the subtraction step much cleaner.
*   **Geometric Interpretation:** 
	*   **One Solution:** The three planes intersect at a single point.
	*   **No Solution:** The planes are parallel or intersect in a way that no single point is shared by all three.
	*   **Infinite Solutions:** The planes intersect along a line or are all the same plane.
*   **Computational Efficiency:** This systematic approach (systematic elimination followed by back-substitution) is the foundation of **Gaussian Elimination**, a cornerstone algorithm in numerical linear algebra.