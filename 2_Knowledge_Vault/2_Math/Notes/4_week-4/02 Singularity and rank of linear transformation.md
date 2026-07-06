# Singularity and Rank of Linear Transformation

**Tags:** #math/linear_transformations #math/rank #math/singularity

## 💡 The Core Concept

A linear transformation maps vectors from an input space to an output space. Geometrically, the set of all output vectors resulting from a transformation is called the **image** of the transformation. 

The concepts of **singularity** and **rank** are direct descriptions of how a transformation changes the dimension of this image:
* **Non-Singular Transformation:** A transformation that preserves the spatial dimensions. The image spans the entire output space (no dimension loss).
* **Singular Transformation:** A transformation that collapses the input space into a lower-dimensional subspace (e.g., a 2D plane collapsing into a 1D line or a 0D point). This collapse represents a loss of information, making the transformation irreversible (non-invertible).
* **Rank:** The dimension of the image of the linear transformation.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. Non-Singular Transformation (Full Rank)
A transformation is non-singular if the transformed grid covers the entire output plane. This is equivalent to a change of basis where the basis vectors remain linearly independent.

Consider the matrix:
$$ A = \begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix} $$

This transformation maps a 2D unit square into a non-degenerate 2D parallelogram. 
* **Image:** The entire 2D plane ($\mathbb{R}^2$).
* **Dimension of the Image:** $2$
* **Rank:** $2$

---

### 2. Singular Transformation (1D Collapse)
When a matrix is singular, the basis vectors are mapped to linearly dependent positions. The transformation collapses the 2D grid into a 1D line.

Consider the singular matrix:
$$ B = \begin{bmatrix} 1 & 1 \\ 2 & 2 \end{bmatrix} $$

Let's trace how the vertices of a unit square are mapped under $B$:

* For $(0,0)$:
  $$ \begin{bmatrix} 1 & 1 \\ 2 & 2 \end{bmatrix} \begin{bmatrix} 0 \\ 0 \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix} $$
* For $(1,0)$:
  $$ \begin{bmatrix} 1 & 1 \\ 2 & 2 \end{bmatrix} \begin{bmatrix} 1 \\ 0 \end{bmatrix} = \begin{bmatrix} 1 \\ 2 \end{bmatrix} $$
* For $(0,1)$:
  $$ \begin{bmatrix} 1 & 1 \\ 2 & 2 \end{bmatrix} \begin{bmatrix} 0 \\ 1 \end{bmatrix} = \begin{bmatrix} 1 \\ 2 \end{bmatrix} $$
* For $(1,1)$:
  $$ \begin{bmatrix} 1 & 1 \\ 2 & 2 \end{bmatrix} \begin{bmatrix} 1 \\ 1 \end{bmatrix} = \begin{bmatrix} 2 \\ 4 \end{bmatrix} $$

> [!important]
> The unit square does not map to a normal parallelogram; it maps to a **degenerate parallelogram** (a flat line segment). Every coordinate in the 2D plane gets compressed onto the line $y = 2x$.

* **Image:** A single line ($y = 2x$).
* **Dimension of the Image:** $1$
* **Rank:** $1$

---

### 3. Extreme Singular Transformation (0D Collapse)
In the most extreme singular case, the transformation collapses all input vectors into a single point: the origin.

Consider the zero matrix:
$$ C = \begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix} $$

The transformation of any arbitrary vector $\begin{bmatrix} a \\ b \end{bmatrix}$ yields:
$$ \begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix} \begin{bmatrix} a \\ b \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix} $$

* **Image:** A single point (the origin $(0,0)$).
* **Dimension of the Image:** $0$
* **Rank:** $0$

---

## 🎯 Key Takeaways

> [!info] **Geometric Interpretation of Rank**
> The algebraic rank of a matrix $A$ is precisely the geometric dimension of the image of its corresponding linear transformation.
> $$ \text{Rank}(A) = \text{Dimension}(\text{Image}(A)) $$

* **Machine Learning Context:** 
  * **Dimensionality Reduction:** Techniques like PCA intentionally look for singular or near-singular transformations to project data from higher dimensions (e.g., $N$-dimensions) down to lower-dimensional spaces (e.g., $k$-dimensions, where $k < N$).
  * **Matrix Invertibility:** If a transformation is singular ($\text{Rank}(A) < \text{Dimension of Input Space}$), you cannot compute its inverse $A^{-1}$. This becomes a major obstacle in algorithms like Linear Regression that require calculating the normal equation $\theta = (X^T X)^{-1} X^T y$ where $X^T X$ must be non-singular (full rank) to be invertible.

---

