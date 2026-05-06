# Vector Operations
**Tags:** #math/vector-addition #math/vector-subtraction #math/scalar-multiplication #math/vector-distance

## 💡 The Core Concept
Just like numbers, vectors can be added, subtracted, and scaled. These operations are performed **component-wise**, meaning each corresponding element in the vectors is operated on independently. Geometrically, these operations correspond to creating parallelograms in space or stretching/flipping arrows.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. Vector Sum and Difference
To add or subtract two vectors, they **must have the same number of components**.

*   **Sum:** $x + y = (x_1 + y_1, x_2 + y_2, \dots, x_n + y_n)$
    *   *Geometry:* The resulting vector is the main diagonal of the parallelogram formed by $x$ and $y$.
*   **Difference:** $x - y = (x_1 - y_1, x_2 - y_2, \dots, x_n - y_n)$
    *   *Geometry:* If you translate the difference vector, it perfectly joins the tips of the two original vectors.

### 2. Measuring Distance between Vectors
The difference between two vectors ($u - v$) is often used in Machine Learning to calculate the **similarity** between data points. We measure the magnitude of this difference using norms:
*   **L1 Distance:** $\|u - v\|_1 = \sum |u_i - v_i|$
*   **L2 Distance:** $\|u - v\|_2 = \sqrt{\sum (u_i - v_i)^2}$

**Example:**
For $u = (1, 5)$ and $v = (6, 2)$:
$$ u - v = (1-6, 5-2) = (-5, 3) $$
*   **L1 Distance:** $|-5| + |3| = 8$
*   **L2 Distance:** $\sqrt{(-5)^2 + 3^2} = \sqrt{34} \approx 5.83$

### 3. Scalar Multiplication
Multiplying a vector $x$ by a scalar $\lambda$ scales every component by that value.
$$ \lambda x = (\lambda x_1, \lambda x_2, \dots, \lambda x_n) $$

**Geometric Effects:**
*   **$\lambda > 1$:** Stretches the vector (points in the same direction).
*   **$0 < \lambda < 1$:** Shrinks the vector.
*   **$\lambda < 0$:** Reflects the vector about the origin (points in the opposite direction) and scales it by the absolute value of $\lambda$.

---

## 🎯 Key Takeaways
*   **Component-wise Consistency:** Every basic vector operation (addition, subtraction, scaling) applies the scalar or second vector's values element by element.
*   **ML Application:** Calculating distances between vectors (like L1/L2) is the fundamental way we measure how "similar" or "different" two pieces of data are.
*   **Dimensionality Constraint:** You can only add or subtract vectors that exist in the same dimensional space ($n$ must match).