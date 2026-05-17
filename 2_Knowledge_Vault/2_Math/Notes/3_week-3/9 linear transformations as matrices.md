# Linear Transformations as Matrices
**Tags:** #math/linear-transformations #math/basis-vectors #math/matrix-columns

## 💡 The Core Concept
While every matrix represents a linear transformation, every visual linear transformation can also be translated back into a matrix. The entire "incognito" matrix can be decoded by simply tracking where the two **fundamental basis vectors**—$(1,0)$ and $(0,1)$—land after the transformation.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. The Column Rule
To find the entries of a $2 \times 2$ matrix from a visual transformation, you only need the "landing spots" (images) of the unit basis vectors. These coordinates become the columns of your matrix.

*   **Column 1:** The coordinates of where the vector $(1,0)$ lands.
*   **Column 2:** The coordinates of where the vector $(0,1)$ lands.

### 2. Step-by-Step Decoding
Suppose a transformation maps the fundamental basis square to a new parallelogram:
1.  **Track $(1,0)$:** It lands at $(3, -1)$.
2.  **Track $(0,1)$:** It lands at $(2, 3)$.
3.  **Construct the Matrix:**
$$ \text{Matrix} = \begin{bmatrix} \downarrow & \downarrow \\ \text{Image of } (1,0) & \text{Image of } (0,1) \\ \downarrow & \downarrow \end{bmatrix} = \begin{bmatrix} 3 & 2 \\ -1 & 3 \end{bmatrix} $$

### 3. Verification
You can verify this by checking the final point of the basis square, $(1,1)$:
$$ \begin{bmatrix} 3 & 2 \\ -1 & 3 \end{bmatrix} \begin{bmatrix} 1 \\ 1 \end{bmatrix} = \begin{bmatrix} (3 \times 1) + (2 \times 1) \\ (-1 \times 1) + (3 \times 1) \end{bmatrix} = \begin{bmatrix} 5 \\ 2 \end{bmatrix} $$
This matches the visual transformation where $(1,1) \to (5,2)$.

---

## 🎯 Key Takeaways

> [!important] The Transformation Secret
> You do not need to know where every point in the plane goes. Because the transformation is **linear**, knowing the destination of the unit basis vectors is enough to determine the destination of *every* other point in the infinite plane.

*   **Fixed Origin:** Just like in the previous lesson, $(0,0)$ always maps to $(0,0)$. If a transformation moves the origin, it is not a *linear* transformation.
*   **Geometric Construction:** To build a matrix that rotates or stretches space, simply decide where you want $(1,0)$ and $(0,1)$ to end up, and write those coordinates as your columns.
*   **Interactive Intuition:** Linear transformations essentially "squeeze" and "rotate" space, but they always keep grid lines parallel and the origin fixed.