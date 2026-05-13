In this lab you will use Python and `NumPy` functions to perform main vector operations: scalar multiplication, sum of vectors and their dot product. You will also investigate the speed of calculations using loop and vectorized forms of these main linear algebra operations

# Table of Contents
- [[#1 - Scalar Multiplication and Sum of Vectors]]
	- [[#1.1 - Visualization of a Vector $v\in\mathbb{R}^2$]]
	- [[#1.2 - Scalar Multiplication]]
	- [[#1.3 - Sum of Vectors]]
	- [[#1.4 - Norm of a Vector]]
-  [[#2 - Dot Product]]
	 -  [[#2.1 - Algebraic Definition of the Dot Product]]
	 -  [[#2.2 - Dot Product using Python]]
	 -  [[#2.3 - Speed of Calculations in Vectorized Form]]
	 -  [[#2.4 - Geometric Definition of the Dot Product]]
	 -  [[#2.5 - Application of the Dot Product: Vector Similarity]]

---

# Packages
Load the `NumPy` package to access its functions.
```py
import numpy as np
```

# 1 - Scalar Multiplication and Sum of Vectors


# 1.1 - Visualization of a Vector $v\in\mathbb{R}^2$

You already have seen in the videos and labs, that vectors can be visualized as arrows, and it is easy to do it for a $v\in\mathbb{R}^2$, e.g.

$
v=\begin{bmatrix}
          1 & 3
\end{bmatrix}^T
$

The following code will show the visualization.

```python
import matplotlib.pyplot as plt

def plot_vectors(list_v, list_label, list_color):
    _, ax = plt.subplots(figsize=(10, 10))
    ax.tick_params(axis='x', labelsize=14)
    ax.tick_params(axis='y', labelsize=14)
    ax.set_xticks(np.arange(-10, 10))
    ax.set_yticks(np.arange(-10, 10))
    
    
    plt.axis([-10, 10, -10, 10])
    for i, v in enumerate(list_v):
        sgn = 0.4 * np.array([[1] if i==0 else [i] for i in np.sign(v)])
        plt.quiver(v[0], v[1], color=list_color[i], angles='xy', scale_units='xy', scale=1)
        ax.text(v[0]-0.2+sgn[0], v[1]-0.2+sgn[1], list_label[i], fontsize=14, color=list_color[i])

    plt.grid()
    plt.gca().set_aspect("equal")
    plt.show()

v = np.array([[1],[3]])
# Arguments: list of vectors as NumPy arrays, labels, colors.
plot_vectors([v], [f"$v$"], ["black"])
```

The vector is defined by its **norm (length, magnitude)** and **direction**, not its actual position. But for clarity and convenience vectors are often plotted starting in the origin (in $\mathbb{R}^2$ it is a point $(0,0)$) .

# 1.2 - Scalar Multiplication

**Scalar multiplication** of a vector $v=\begin{bmatrix}
          v_1 & v_2 & \ldots & v_n 
\end{bmatrix}^T\in\mathbb{R}^n$ by a scalar $k$ is a vector $kv=\begin{bmatrix}
          kv_1 & kv_2 & \ldots & kv_n 
\end{bmatrix}^T$ (element by element multiplication). If $k>0$, then $kv$ is a vector pointing in the same direction as $v$ and it is $k$ times as long as $v$. If $k=0$, then $kv$ is a zero vector. If $k<0$, vector $kv$ will be pointing in the opposite direction. In Python you can perform this operation with a `*` operator. Check out the example below:

```python
plot_vectors([v, 2*v, -2*v], [f"$v$", f"$2v$", f"$-2v$"], ["black", "green", "blue"])
```


# 1.3 - Sum of Vectors

**Sum of vectors (vector addition)** can be performed by adding the corresponding components of the vectors: if $v=\begin{bmatrix}
          v_1 & v_2 & \ldots & v_n 
\end{bmatrix}^T\in\mathbb{R}^n$ and  
$w=\begin{bmatrix}
          w_1 & w_2 & \ldots & w_n 
\end{bmatrix}^T\in\mathbb{R}^n$, then $v + w=\begin{bmatrix}
          v_1 + w_1 & v_2 + w_2 & \ldots & v_n + w_n 
\end{bmatrix}^T\in\mathbb{R}^n$. The so-called **parallelogram law** gives the rule for vector addition. For two vectors $u$ and $v$ represented by the adjacent sides (both in magnitude and direction) of a parallelogram drawn from a point, the vector sum $u+v$ is is represented by the diagonal of the parallelogram drawn from the same point:

![[Pasted image 20260513170335.png]]

In Python you can either use `+` operator or `NumPy` function `np.add()`. In the following code you can uncomment the line to check that the result will be the same:


```python
v = np.array([[1],[3]])
w = np.array([[4],[-1]])

plot_vectors([v, w, v + w], [f"$v$", f"$w$", f"$v + w$"], ["black", "black", "red"])
# plot_vectors([v, w, np.add(v, w)], [f"$v$", f"$w$", f"$v + w$"], ["black", "black", "red"])
```

# 1.4 - Norm of a Vector

The norm of a vector $v$ is denoted as $\lvert v\rvert$. It is a nonnegative number that describes the extent of the vector in space (its length). The norm of a vector can be found using `NumPy` function `np.linalg.norm()`:

```python
print("Norm of a vector v is", np.linalg.norm(v))
```

