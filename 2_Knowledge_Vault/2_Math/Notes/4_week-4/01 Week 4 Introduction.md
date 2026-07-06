# Week 4 Introduction: Determinants, Singularity, and PCA Foundations

**Tags:** #math/linear_algebra #math/pca #math/determinants #math/eigenvalues

## 💡 The Core Concept

This week bridges the gap between abstract linear transformations and practical Machine Learning applications. By studying how matrices scale, rotate, and project space, we unlock the foundational mechanics of **Principal Component Analysis (PCA)**—a premier unsupervised learning technique used for dimensionality reduction. 

The roadmap consists of two primary tracks:
1. **Characterizing Linear Transformations:** Using **determinants** (to quantify spatial scaling) and analyzing **singularity** (to determine whether a transformation collapses dimensions or preserves them).
2. **Foundations of PCA:** Understanding **basis**, **span**, and **eigenvalues/eigenvectors** to project high-dimensional data onto lower-dimensional subspaces while retaining maximal information.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. Singular vs. Non-Singular Transformations
A linear transformation represented by a matrix $A$ is **non-singular** if it preserves the dimensionality of the space. It is **singular** if it collapses the space into a lower dimension (e.g., transforming a 2D plane into a 1D line).

* **Non-Singular Example:**
  The transformation matrix $A$ preserves the 2D plane as a 2D parallelogram:
  $$ A = \begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix} $$

* **Singular Example:**
  The transformation matrix $B$ collapses the 2D plane into a single 1D line, losing irreversibly a dimension of information:
  $$ B = \begin{bmatrix} 1 & 1 \\ 2 & 2 \end{bmatrix} $$

> [!important]
> Singular matrices have no inverse ($A^{-1}$ does not exist) because you cannot reconstruct a higher-dimensional space once it has been collapsed into a lower dimension.

---

### 2. The Determinant as a Geometric Area Scaler
The determinant of a $2 \times 2$ matrix represents the factor by which the area of a unit square changes after applying the linear transformation.

Given the transformation matrix:
$$ A = \begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix} $$

Applying this transformation to a unit square (area = $1$) yields a parallelogram with an area of $5$. Therefore:
$$ \det(A) = 5 $$

---

### 3. Key Properties of the Determinant
Determinants behave systematically under matrix multiplication and inversion.

#### A. Multiplicative Property
The determinant of a product of two matrices is the product of their individual determinants:
$$ \det(AB) = \det(A) \cdot \det(B) $$

* **Example from slides:**
  $$ \begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix} \cdot \begin{bmatrix} 1 & 1 \\ -2 & 1 \end{bmatrix} = \begin{bmatrix} 1 & 4 \\ -3 & 3 \end{bmatrix} $$
  Calculating the individual and joint determinants:
  $$ \det \begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix} = 5 $$
  $$ \det \begin{bmatrix} 1 & 1 \\ -2 & 1 \end{bmatrix} = 3 $$
  $$ \det \begin{bmatrix} 1 & 4 \\ -3 & 3 \end{bmatrix} = 15 = 5 \cdot 3 $$

#### B. Inverse Property
The determinant of the inverse of a matrix is the reciprocal of the determinant of the original matrix:
$$ \det(A^{-1}) = \frac{1}{\det(A)} $$

* **Example from slides:**
  $$ A^{-1} = \begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix}^{-1} = \begin{bmatrix} 0.4 & -0.2 \\ -0.2 & 0.6 \end{bmatrix} $$
  $$ \det(A^{-1}) = 0.2 = \frac{1}{5} $$

---

### 4. Basis and Span
To mathematically define subspaces for projection, we utilize two concepts:
* **Basis:** A set of linearly independent vectors that define a coordinate system for a space. Every point in that space can be uniquely reached via a linear combination of these basis vectors.
* **Span:** The set of all possible linear combinations of a group of vectors.
  * A single vector $v_1$ spans a 1D line:
    $$ \text{Span}(v_1) = \{ c v_1 \mid c \in \mathbb{R} \} $$
  * Two non-collinear vectors $v_1, v_2$ span a 2D plane:
    $$ \text{Span}(v_1, v_2) = \{ c_1 v_1 + c_2 v_2 \mid c_1, c_2 \in \mathbb{R} \} $$

---

### 5. Eigenvalues and Eigenvectors
An **eigenvector** of a matrix $A$ is a special non-zero vector $v$ that does not change its direction when multiplied by $A$. Instead, it is only scaled by a scalar factor called the **eigenvalue** ($\lambda$).

$$ A v = \lambda v $$

* **Example from slides:**
  Applying the transformation matrix $A$ to the vector $v_1 = \begin{bmatrix} 1 \\ 0 \end{bmatrix}$ yields:
  $$ \begin{bmatrix} 2 & 1 \\ 0 & 3 \end{bmatrix} \begin{bmatrix} 1 \\ 0 \end{bmatrix} = \begin{bmatrix} 2 \\ 0 \end{bmatrix} = 2 \begin{bmatrix} 1 \\ 0 \end{bmatrix} $$
  Here, the eigenvector is $v_1 = \begin{bmatrix} 1 \\ 0 \end{bmatrix}$ and the corresponding eigenvalue is $\lambda_1 = 2$.

---

## 🎯 Key Takeaways

* **Dimensionality Reduction (PCA):** Highly dimensional datasets (e.g., matrices with many feature columns) are often redundant. PCA identifies dominant directions (using eigenvectors) and projects the data onto these lines or planes, dropping less informative dimensions while preserving maximum variance.
* **Singularity in ML:** Ensuring a transformation matrix is non-singular ($\det(A) \neq 0$) is vital when mathematical operations require matrix inversion, such as solving normal equations in linear regression.
* **Geometric Intuition:** Linear transformations scale space by the factor of their determinant. If the determinant is $0$, the transformation collapses space, implying a loss of dimensionality.

---

