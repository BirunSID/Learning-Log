# Matrices as Linear Transformations
**Tags:** #math/linear-transformations #math/basis-vectors #math/coordinate-mapping

## 💡 The Core Concept
Beyond representing systems of equations, a matrix acts as a **linear transformation**—a mathematical rule that maps every point in a space (like a 2D plane) to a new point in a structured way. Conceptually, it is a **change of coordinates**: you are taking the original "square" grid of space and stretching, rotating, or squashing it into a new "skewed" grid made of parallelograms.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. Mapping Points to Space
To transform any point, you treat its coordinates as a column vector and multiply it by the matrix.
$$ \text{Matrix} \times \begin{bmatrix} a \\ b \end{bmatrix} = \begin{bmatrix} a' \\ b' \end{bmatrix} $$

### 2. The "Anchor" Points
A transformation is entirely defined by how it moves the unit vectors (the basic "blocks" of the grid).
Given a matrix $\begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix}$:
*   **The Origin:** $(0,0)$ always maps to $(0,0)$. Linear transformations **never** move the origin.
*   **Horizontal Basis $(1,0)$:** Maps to the **first column** of the matrix $\to (3,1)$.
*   **Vertical Basis $(0,1)$:** Maps to the **second column** of the matrix $\to (1,2)$.

### 3. Geometric Visualization: Tessellation
If you visualize the unit square formed by $(0,0), (1,0), (0,1),$ and $(1,1)$, the transformation turns it into a **parallelogram**. 
- Because the transformation is "linear," the entire plane follows this same pattern. 
- The original square grid on the left "tessellates" (tiles) the plane, and the new parallelogram grid on the right does the exact same.

### 4. Thinking in "Blocks"
To find where a random point goes, like $(-2, 3)$, use the "walking blocks" intuition:
1.  **Original Grid:** Start at origin, walk 2 blocks left, 3 blocks up.
2.  **Transformed Grid:** Start at origin, walk 2 "skewed" blocks in the opposite direction of the first column and 3 "skewed" blocks in the direction of the second column.
3.  **Result:** The matrix multiplication $\begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix} \begin{bmatrix} -2 \\ 3 \end{bmatrix}$ yields $\begin{bmatrix} -3 \\ 4 \end{bmatrix}$.

---

## 🎯 Key Takeaways
*   **Columns are Destinations:** The columns of a matrix tell you exactly where the original basis vectors $(1,0)$ and $(0,1)$ land in the new space.
*   **Linearity Rules:** In a linear transformation, grid lines must remain parallel and evenly spaced, and the origin must remain fixed.
*   **Machine Learning Link:** This is how data is moved between layers in a Neural Network. Each layer "transforms" the feature space, stretching or rotating data to make patterns easier for the next layer to see.