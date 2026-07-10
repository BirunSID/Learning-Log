# Determinant of an Inverse

**Tags:** #math/determinants #math/matrix_inversion #math/proofs  

## 💡 The Core Concept

The determinant of the inverse of a matrix is the reciprocal (or multiplicative inverse) of the determinant of the original matrix. 

If $A$ is an invertible (non-singular) matrix, then:
$$ \det(A^{-1}) = \frac{1}{\det(A)} $$

This relationship reinforces the geometric intuition of determinants: if a transformation $A$ scales the area of a space by a factor of $k$, then the reversing transformation $A^{-1}$ must scale the area back by a factor of $\frac{1}{k}$ to return to the original state.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. Numerical Examples

#### Example A: Scaling Factor of 5
Consider the matrix $A$:
$$ A = \begin{bmatrix} 3 & 1 \\ 1 & 2 \end{bmatrix}, \quad \det(A) = 5 $$

Its inverse matrix $A^{-1}$ is calculated as:
$$ A^{-1} = \begin{bmatrix} 0.4 & -0.2 \\ -0.2 & 0.6 \end{bmatrix} $$

Calculate the determinant of the inverse:
$$ \det(A^{-1}) = (0.4 \cdot 0.6) - (-0.2 \cdot -0.2) = 0.24 - 0.04 = 0.2 $$

We can verify that:
$$ \det(A^{-1}) = 0.2 = \frac{1}{5} = \frac{1}{\det(A)} $$

---

#### Example B: Scaling Factor of 8
Consider another matrix $B$:
$$ B = \begin{bmatrix} 5 & 2 \\ 1 & 2 \end{bmatrix}, \quad \det(B) = (5 \cdot 2) - (2 \cdot 1) = 8 $$

Its inverse matrix $B^{-1}$ is:
$$ B^{-1} = \begin{bmatrix} 0.25 & -0.25 \\ -0.125 & 0.625 \end{bmatrix} $$

Calculate the determinant of the inverse:
$$ \det(B^{-1}) = (0.25 \cdot 0.625) - (-0.25 \cdot -0.125) = 0.15625 - 0.03125 = 0.125 $$

We can verify that:
$$ \det(B^{-1}) = 0.125 = \frac{1}{8} = \frac{1}{\det(B)} $$

---

#### Case C: Singular Matrix (Determinant = 0)
Consider a singular matrix $C$:
$$ C = \begin{bmatrix} 1 & 2 \\ 1 & 2 \end{bmatrix}, \quad \det(C) = 0 $$

Since $\det(C) = 0$, applying the reciprocal rule would require division by zero:
$$ \det(C^{-1}) = \frac{1}{0} \quad (\text{Undefined}) $$

This aligns perfectly with theory: because $0$ has no multiplicative inverse, a singular matrix has no inverse matrix $C^{-1}$.

---

### 2. Algebraic Proof

The proof of this reciprocal relationship relies on two foundational properties of determinants:
1. The **multiplicative property**: $\det(XY) = \det(X)\det(Y)$
2. The determinant of the **identity matrix** $I$ is always $1$.

$$ I = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} \implies \det(I) = (1 \cdot 1) - (0 \cdot 0) = 1 $$

*(This property holds true for any $n \times n$ identity matrix).*

#### Proof Steps:
By definition, multiplying a matrix $A$ by its inverse $A^{-1}$ yields the identity matrix $I$:
$$ A A^{-1} = I $$

Take the determinant of both sides:
$$ \det(A A^{-1}) = \det(I) $$

Apply the product rule for determinants to the left side:
$$ \det(A) \cdot \det(A^{-1}) = \det(I) $$

Substitute the value of the identity determinant ($\det(I) = 1$):
$$ \det(A) \cdot \det(A^{-1}) = 1 $$

Assuming $A$ is non-singular ($\det(A) \neq 0$), divide both sides by $\det(A)$:
$$ \det(A^{-1}) = \frac{1}{\det(A)} $$

$$\tag*{$\blacksquare$}$$

---

## 🎯 Key Takeaways

> [!important] **The Inversion Inverse Rule**
> The algebraic relationship $\det(A^{-1}) = \frac{1}{\det(A)}$ mathematically mirrors the geometric concept of reversal. An inverse transformation undoes the dimensional scaling of the forward transformation.

* **Invertibility Verification:** This formula confirms that matrix inversion is only possible when $\det(A) \neq 0$. If the determinant is $0$, the space has collapsed, and its scaling cannot be inverted because division by zero is undefined.
* **Computational Efficiency:** If you need to find the determinant of an inverse matrix $A^{-1}$, it is computationally much faster to calculate $\frac{1}{\det(A)}$ than it is to compute the full matrix inverse $A^{-1}$ and then calculate its determinant.

---

