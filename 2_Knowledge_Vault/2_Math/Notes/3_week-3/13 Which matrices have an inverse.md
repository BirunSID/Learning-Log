# Which Matrices Have Inverses?
**Tags:** #math/matrix-invertibility #math/determinants #math/singular-matrices

## 💡 The Core Concept
The rule governing whether a matrix has an inverse directly mirrors the rules of real numbers. Just as any non-zero real number has a multiplicative reciprocal (e.g., $5^{-1} = 0.2$), any **non-singular matrix** has an inverse. Conversely, just as the number $0$ has no reciprocal ($0^{-1}$ is undefined), any **singular matrix** has no inverse.

The mathematical test for invertibility is the **determinant** of the matrix:
*   A non-zero determinant ($\det(A) \neq 0$) means the matrix behaves like a non-zero number and is **invertible**.
*   A zero determinant ($\det(A) = 0$) means the matrix behaves like the number $0$ and is **non-invertible**.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. The Determinant Rule for Invertibility
For any square matrix $A$:
$$ \text{Invertible (Non-singular)} \iff \det(A) \neq 0 $$
$$ \text{Non-invertible (Singular)} \iff \det(A) = 0 $$

---

### 2. Examples

#### **Example 1: Invertible Matrix (Non-Zero Determinant)**
Let $A = \begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix}$.
*   **Determinant:** $\det(A) = (3 \times 2) - (1 \times 1) = 5$
*   **Status:** $\det(A) = 5 \neq 0 \implies$ **Non-singular (Invertible)**
*   **Inverse:** 
    $$ A^{-1} = \begin{bmatrix} 0.4 & -0.2 \\ -0.2 & 0.6 \end{bmatrix} $$

#### **Example 2: Invertible Matrix (Non-Zero Determinant)**
Let $B = \begin{bmatrix} 5 & 2 \\ 1 & 2 \end{bmatrix}$.
*   **Determinant:** $\det(B) = (5 \times 2) - (2 \times 1) = 8$
*   **Status:** $\det(B) = 8 \neq 0 \implies$ **Non-singular (Invertible)**
*   **Inverse:** 
    $$ B^{-1} = \begin{bmatrix} 0.25 & -0.25 \\ -0.125 & 0.625 \end{bmatrix} $$

#### **Example 3: Non-Invertible Matrix (Zero Determinant)**
Let $C = \begin{bmatrix} 1 & 1 \\ 2 & 2 \end{bmatrix}$.
*   **Determinant:** $\det(C) = (1 \times 2) - (1 \times 2) = 0$
*   **Status:** $\det(C) = 0 \implies$ **Singular (Non-invertible)**
*   **Inverse:** $C^{-1}$ is undefined.

---

## 🎯 Key Takeaways

> [!important] The "Division by Zero" Analogy
> To easily recall this property, think of a zero determinant ($\det(A) = 0$) as the matrix equivalent of dividing by zero. Since dividing by zero is forbidden, inverting a matrix with a zero determinant is equally impossible.

*   **Synonyms in Linear Algebra:**
    *   *Invertible* is completely synonymous with *Non-singular* (full rank, $\det \neq 0$).
    *   *Non-invertible* is completely synonymous with *Singular* (rank-deficient, $\det = 0$).
*   **Geometric Meaning:** A zero determinant means the linear transformation squashes space, collapsing 2D areas into 1D lines or 0D points. Because this squashing destroys dimensional information, the transformation cannot be undone (inverted).