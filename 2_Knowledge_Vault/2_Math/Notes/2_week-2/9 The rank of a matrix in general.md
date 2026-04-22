# The Rank of a Matrix in General
**Tags:** #math/linear-algebra #math/deeplearning-ai #math #math/dimensionality-reduction #math/matrix-rank

## 💡 The Core Concept
The **Rank** of a matrix is a formal measure of its "information density." It represents the number of linearly independent equations (or rows) within a system. An equation is considered redundant—and therefore does not contribute to the rank—if it can be expressed as a **linear combination** of the other equations in the system.

---

## 🛠️ Mathematical Definitions & Mechanics

For a $3 \times 3$ matrix, the rank can range from 0 to 3. The rank identifies how many "new pieces of information" the system brings to the table.

### Case 1: Full Rank (Rank 3)
In this system, no equation can be derived from the others. Every row is independent.
$$ \begin{cases} a + b + c = 0 \\ a + 2b + c = 0 \\ a + b + 2c = 0 \end{cases} \implies \text{Matrix: } \begin{bmatrix} 1 & 1 & 1 \\ 1 & 2 & 1 \\ 1 & 1 & 2 \end{bmatrix} $$
> [!info] Observation
> There is no scalar $k$ or combination of rows that produces the third row from the first two. This system provides the maximum amount of information for its size.

### Case 2: Rank 2
One equation is a linear combination of the others, making it redundant.
$$ \begin{cases} a + b + c = 0 \\ a + b + 2c = 0 \\ a + b + 3c = 0 \end{cases} \implies \text{Matrix: } \begin{bmatrix} 1 & 1 & 1 \\ 1 & 1 & 2 \\ 1 & 1 & 3 \end{bmatrix} $$
> [!important] Redundancy Check
> Notice that the second row is the average of the first and third rows: 
> $$ \frac{1}{2}(R_1 + R_3) = R_2 $$ 
> Since $R_2$ brings no "new" information, the rank is 2.

### Case 3: Rank 1
Two equations are simply multiples of the first.
$$ \begin{cases} a + b + c = 0 \\ 2a + 2b + 2c = 0 \\ 3a + 3b + 3c = 0 \end{cases} \implies \text{Matrix: } \begin{bmatrix} 1 & 1 & 1 \\ 2 & 2 & 2 \\ 3 & 3 & 3 \end{bmatrix} $$
*   $R_2 = 2 \times R_1$
*   $R_3 = 3 \times R_1$
Because there is only one unique starting point, the system only carries one piece of information.

### Case 4: Rank 0
The trivial case where no information is provided.
$$ \begin{cases} 0a + 0b + 0c = 0 \\ 0a + 0b + 0c = 0 \\ 0a + 0b + 0c = 0 \end{cases} \implies \text{Matrix: } \begin{bmatrix} 0 & 0 & 0 \\ 0 & 0 & 0 \\ 0 & 0 & 0 \end{bmatrix} $$
Rank = 0.

---

## 🎯 Key Takeaways
*   **Rank = Information:** The rank tells you the true dimensionality of the data. Even if a matrix has 100 rows, if 99 of them are just multiples of the first, the rank is still 1.
*   **Linear Combination Rule:** If an equation can be formed by adding, subtracting, or scaling other equations, it is "linearly dependent" and does not increase the rank.
*   **Singularity Link:** A square matrix is **non-singular** only if it has **Full Rank** (e.g., a $3 \times 3$ matrix must have Rank 3). 
*   **Computational Efficiency:** Calculating rank by "guessing" linear combinations is difficult for large matrices. 

> [!warning] Pro-Tip
> The most reliable way to calculate rank for any size matrix is to convert it into **Row Echelon Form**. The rank is simply the number of non-zero rows remaining after the reduction.