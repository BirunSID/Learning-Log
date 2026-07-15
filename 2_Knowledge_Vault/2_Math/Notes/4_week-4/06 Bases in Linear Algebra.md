# Bases in Linear Algebra

**Tags:** #math/linear-algebra #math/deeplearning-ai #math #math/vector-spaces #math/bases

## 💡 The Core Concept

A **basis** (plural: **bases**) is a set of linearly independent vectors that defines a coordinate system for a vector space. 

Geometrically, a basis acts as a set of "directional instructions." If a set of vectors forms a basis for a space, you can reach **any point** in that entire space by scaling and adding those vectors (moving forward, backward, or by fractional steps along their respective directions).

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. Formal Definition
A set of vectors $B = \{b_1, b_2, \dots, b_n\}$ is a basis for a vector space $V$ if it satisfies two conditions:
1. **Spanning:** The vectors can generate any vector in $V$ through a linear combination.
2. **Linear Independence:** No vector in the set can be written as a linear combination of the others (there are no redundant directions).

Every vector $v \in V$ can be uniquely expressed as:
$$ v = c_1 b_1 + c_2 b_2 + \dots + c_n b_n $$
where $c_1, c_2, \dots, c_n$ are scalar coefficients.

---

### 2. Examples of Bases in $\mathbb{R}^2$

Almost any pair of non-collinear vectors can form a basis for the 2D plane.

#### A. The Standard Basis
The most common basis is formed by the unit vectors along the axes:
$$ e_1 = \begin{bmatrix} 1 \\ 0 \end{bmatrix}, \quad e_2 = \begin{bmatrix} 0 \\ 1 \end{bmatrix} $$
These vectors form the boundaries of a unit square, creating a standard orthogonal grid.

#### B. A Non-Standard Basis
Consider the vectors corresponding to the columns of the transformation matrix $A = \begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix}$:
$$ v_1 = \begin{bmatrix} 3 \\ 1 \end{bmatrix}, \quad v_2 = \begin{bmatrix} 1 \\ 2 \end{bmatrix} $$
These vectors form a skewed grid (a parallelogram), but they are still a valid basis because they are not parallel. You can scale and combine $v_1$ and $v_2$ to uniquely locate any point on the 2D plane.

---

### 3. What Fails to Be a Basis? (Non-Bases)

If vectors are redundant, they fail to form a basis. In $\mathbb{R}^2$, a set of two vectors fails to be a basis if they are **collinear** (point along the same line).

Consider the vectors:
$$ u_1 = \begin{bmatrix} 1 \\ 2 \end{bmatrix}, \quad u_2 = \begin{bmatrix} 2 \\ 4 \end{bmatrix} $$

Since $u_2 = 2u_1$, they are linearly dependent. 

> [!warning] **The Geometric Consequence of Linear Dependence**
> Because $u_1$ and $u_2$ lie on the same line ($y = 2x$), walking in their defined directions only allows you to traverse that single 1D line. You cannot step off the line to cover the rest of the 2D plane. Thus, they cannot span $\mathbb{R}^2$ and **do not** form a basis.

---

## 🎯 Key Takeaways

> [!important] **The Minimum Set Requirement**
> A basis represents the *minimum* number of vectors required to span a space. For an $n$-dimensional space, a basis must contain exactly $n$ linearly independent vectors. 

* **Infinite Choices:** There are infinitely many bases for any given vector space (excluding the zero space).
* **Machine Learning Relevance:** 
  * **Change of Basis:** Much of ML relies on shifting data to a more useful basis. For example, **PCA** works by finding a new orthogonal basis (the principal components) where the first basis vector points in the direction of maximum variance.
  * **Coordinate Representation:** When we represent data as vectors, we are implicitly specifying coordinates relative to a chosen basis (usually the standard basis). Switching bases can reveal hidden patterns in the data.

---

