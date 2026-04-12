# Visualizing Singularity in Linear Systems

**Tags:** #math/linear-algebra #math #math/systems-of-equations

## 💡 The Core Concept
To easily determine if a system of linear equations is **Singular** or **Non-Singular**, you can ignore the specific types of solutions (complete, redundant, or contradictory) and simply **set all constants to zero**. 

> [!important] The Rule of Constants
> The constants in a system of equations (the standalone numbers not attached to variables, like $c$ in $ax + by = c$) **do not matter** when determining if a system is singular or non-singular. By setting them to $0$, you force all lines to pass through the origin $(0,0)$, making the geometry much easier to analyze.

---

## 🛠️ The "Zero Constant" Simplification

Here is how setting the constants to $0$ affects the three main types of linear systems. Let $a$ (apples) and $b$ (bananas) be our variables:

### 1. System 1: Complete $\rightarrow$ Non-Singular
$$ 
\begin{cases} 
a + b = 0 \\ 
a + 2b = 0 
\end{cases} 
$$
* **Geometry:** Two non-parallel, distinct lines.
* **Intersection:** They intersect exactly at the origin $(0,0)$. 
* **Solution:** Unique solution.
* **Status:** **Non-Singular**

### 2. System 2: Redundant $\rightarrow$ Singular
$$ 
\begin{cases} 
a + b = 0 \\ 
2a + 2b = 0 
\end{cases} 
$$
* **Geometry:** The second equation is just a multiple of the first (multiplied by 2). They are identical, overlapping lines.
* **Intersection:** The entire line passes through the origin.
* **Solution:** Infinite solutions.
* **Status:** **Singular**

### 3. System 3: Contradictory $\rightarrow$ Singular
*(Note: Originally, this system had parallel lines that never intersected, e.g., $a + b = 2$ and $2a + 2b = 10$.)*
$$ 
\begin{cases} 
a + b = 0 \\ 
2a + 2b = 0 
\end{cases} 
$$
* **Geometry:** By setting the constants to $0$, the parallel lines merge into **identical, overlapping lines**.
* **Intersection:** The entire line passes through the origin.
* **Solution:** Infinite solutions (changed from zero solutions).
* **Status:** **Remains Singular**

> [!info] Crucial Observation on System 3
> Notice that by setting the constants to $0$, System 3 went from having *no solutions* (contradictory) to having *infinite solutions* (redundant). **However, its classification remained Singular.** This proves that singularity is a property of the variable coefficients, not the constants!

---

## 🎯 Key Takeaways for Machine Learning
1. **Focus on Singularity:** Moving forward in linear algebra, the concepts of *Singular* vs *Non-Singular* are much more important than whether a system is complete, redundant, or contradictory.
2. **Simplified Geometry:** You can visualize and test systems of equations geometrically by just looking at pairs of lines that go through the origin.
3. **The Visual Rule at the Origin:**
   - **Non-Singular:** Two distinct lines intersecting exactly at $(0,0)$.
   - **Singular:** Two identical, overlapping lines passing through $(0,0)$ (parallelism collapses into a single line).