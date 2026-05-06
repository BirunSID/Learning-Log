# Linear Algebra in Machine Learning: From Regression to Neural Networks
**Tags:** #neural-networks #linear-regression #tensors #linear-transformations

## 💡 The Core Concept
Linear Algebra provides the "language" and "engine" for nearly all machine learning models. While basic math handles individual numbers, machine learning uses **vectors, matrices, and tensors** to process massive datasets simultaneously. A complex Neural Network, which models highly non-linear data, is fundamentally just a massive collection of stacked linear models linked by activation functions.

---

## 🛠️ Mathematical Definitions & Mechanics

### 1. Linear Regression as a System
Linear regression treats a dataset as a system of linear equations where we solve for weights ($w$) and a bias ($b$).
*   **Features ($x$):** The input data points.
*   **Weights ($w$):** The importance assigned to each feature.
*   **Target ($y$):** The desired output.

**Vectorized Form:**
$$ W \cdot X + b = \hat{y} $$
Where:
- $W$ is the weight vector.
- $X$ is the feature matrix.
- $b$ is the bias.
- $\hat{y}$ is the prediction vector.

### 2. Neural Networks: The "Stacked" Linear Model
A Neural Network consists of layers of "neurons." Each neuron is essentially a standalone linear model that passes its result through a non-linear **activation function**.

**Inside a single neuron:**
1.  Compute the linear combination: $z = Wx + b$
2.  Apply activation: $a = \sigma(z)$

**Layer-by-Layer Propagation:**
To represent multiple layers, we use superscripts in square brackets $[l]$ to denote the layer number:
*   **Layer 1:** $a^{[1]} = \sigma(W^{[1]}x + b^{[1]})$
*   **Layer 2:** $a^{[2]} = \sigma(W^{[2]}a^{[1]} + b^{[2]})$
*   **Final Output:** $\hat{y} = a^{[L]}$ (where $L$ is the final layer).

> [!important] The "Linear" Secret
> Even though Neural Networks solve non-linear problems (like face recognition or language processing), the computation happening inside every connection is **standard linear algebra** ($Wx + b$).

### 3. Tensors
The lecture introduces **Tensors** as the generalization of scalars, vectors, and matrices.
*   **Scalar:** 0-dimensional (a single number).
*   **Vector:** 1-dimensional (a list of numbers).
*   **Matrix:** 2-dimensional (a grid of numbers).
*   **Tensor:** $N$-dimensional (a "cube" or higher-dimensional block of numbers).

---

## 🎯 Key Takeaways

*   **Operations Propagate:** Just as you can add or invert numbers ($2 \to 1/2$), you can add vectors and find the **inverse of a matrix** (provided specific conditions are met).
*   **Linear Transformations:** This is a graphical way to visualize what a matrix does to space—it stretches, rotates, or squashes vectors. This visualization makes complex matrix math much more intuitive.
*   **Efficiency:** Instead of writing millions of separate equations for a neural network, we use matrix multiplication to compute entire layers in a single mathematical "stroke."
*   **SVD and Rank (Context):** The concept of "Information" (Rank) discussed in previous notes is why we can compress these massive neural network matrices without losing the model's accuracy.