<h2 align="center">
  MIT 18.06, Spring 2025<br />
  Linear Algebra
</h2>

Welcome to MIT 18.06: Linear Algebra! The Spring 2025 course information, materials, and links are recorded below. Course materials for previous semesters are archived in the [other branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-branches-in-your-repository/viewing-branches-in-your-repository) of this repository. You can dive in right away by reading this [introduction](https://github.com/mitmath/1806/blob/master/notes/Introduction%20to%20Linear%20Algebra%206th%20edition%20and%20A%20%3D%20CR_04.pdf) to the course by Professor Strang.

Catalog Description: *Basic subject on matrix theory and linear algebra, emphasizing topics useful in other disciplines, including systems of equations, vector spaces, determinants, eigenvalues, singular value decomposition, and positive definite matrices. Applications to least-squares approximations, stability of differential equations, networks, Fourier transforms, and Markov processes. Uses linear algebra software. Compared with 18.700, more emphasis on matrix algorithms and many applications.*

**Instructor**: [Prof. Nike Sun](https://math.mit.edu/~nsun/)

**Textbook**: [Introduction to Linear Algebra: 6th Edition](http://eduapps.mit.edu/textbook/books.html?Term=2023SP&Subject=18.06).

**Detailed lecture notes are posted on Canvas (accessible only to registered students).**

## Lecture Material and Summaries

### Lecture 1 (Mon Feb 3 2025)

* Vectors in $\mathbb{R}^2$, and generalization to vectors in $\mathbb{R}^N$ (N-dimensional space).
* Vector operations: addition and scalar multiplication. Both operations together: linear combinations.
* The span of a set of vectors $\lbrace u_1,\ldots,u_k\rbrace$ is the set of all linear combinations of these vectors: we covered some examples in class.
* Definition of matrix times vector: $Ax$ where $A$ is an $M \times N$ matrix, and $x$ is in $\mathbb{R}^N$.

**Reading:** Strang Chapter 1.

### Lecture 2 (Wed Feb 5 2025)
* Dot product, vector length, cosine formula.
* The gaussian elimination algorithm for solving a system of linear equations Ax=b: reduce the matrix to row echelon form (REF), and do back-substitution. Worked through an example in class.
* Definition of matrix times matrix: $AB=X$ where $A$ is $M \times N$, $B$ is $N \times P$, $X$ is $M \times P$.* We explained how to view the gaussian elimination operations as matrix multiplication operations: the steps of gaussian elimination correspond to changing $Ax=b$ to $(G1)Ax=(G1)b$, $(G2)(G1)Ax=(G2)(G1)b$, etc.

**Reading:** Strang 2.1-2.2.

### Lecture 3 (Fri Feb 7 2025)
* Reviewed the gaussian elimination example using matrix multiplications to encode the operations.
* Gauss-Jordan elimination has a few additional steps which brings the system to reduced row echelon form (RREF) — we did this in the same example, again using matrix multiplications.
* In the example, the final RREF system was $(G5)(G4)(G3)(G2)(G1)Ax=(G5)(G4)(G3)(G2)(G1)b=c$. Moreover we found $(G5)(G4)(G3)(G2)(G1)A = I_3$, the $3 \times 3$ identity matrix. In this example it allowed us to read off $x = c$.
* We reviewed basic rules of matrix multiplication: associative $A(BC)=(AB)C$, distributive $A(B+C)=AB+AC$, but **not commutative**: $AB$ and $BA$ are generally not equal!
* Inversion: if $A$ is an $n \times n$ matrix, it is invertible if there exists a matrix $A^{-1}$, also $n \times n$, such that $AA^{-1} = A^{-1}A = I_n$, the $n \times n$ identity matrix.
* If $A$ is invertible, then Gauss-Jordan elimination converts $(A|b)$ to $(I|c)$. Moreover it converts $(A|I)$ to $(I|A^{-1})$.
* Square matrices need not be invertible, and we covered some examples.

**Reading:** Strang 2.3.

### Lecture 4 (Mon Feb 10 2025)
* The columns of $A$ are linearly dependent if a non-trivial linear combination of the columns is zero: can write this as $Ax=0$ for $x$ nonzero. If $A$ is a square matrix with linearly dependent columns, then $A$ cannot be invertible. We covered some examples.
* We defined the column space $C(A)$ of a matrix. An $m \times n$ matrix $A$ can be viewed as a function/map from $\mathbb{R}^n$ to $\mathbb{R}^m$, sending input $x$ in $\mathbb{R}^n$ to output $Ax$ in $\mathbb{R}^m$. The column space $C(A)$ is exactly the image of this map. The equation $Ax=b$ is solvable if and only if $b$ lies in $C(A)$.
* We defined general vector spaces and subspaces, and covered some examples.

**Reading:** Strang 3.1.

### Lecture 5 (Wed Feb 12 2025)
* Defined the null space $N(A)$ as the set of vectors $x$ such that $Ax=0$.
* Note that if $A$ is $m \times n$, then $C(A)$ is a subspace of $\mathbb{R}^n$, while $N(A)$ is a subspace of $\mathbb{R}^m$.
* Invertible row operations (such as in Gauss-Jordan elimination) do not affect the null space, so if $R$ is the RREF of $A$, then $N(A) = N(R)$.
* We covered several examples of calculating $N(A)$. We also noted that in all our examples, dim C(A) + dim N(A) = n.

**Reading:** Strang 3.2.

### Lecture 6 (Fri Feb 14 2025)
* In this class we covered the general solution for a system of linear equations Ax=b.
* The basic principle: if $b$ is not in $C(A)$, then there is no solution. If $b$ is in $C(A)$, then there must exist at least one "particular solution," call it $x_0$. Then the set of all solutions to $Ax=b$ is the set of vectors $x_0 + x'$, where $x_0$ is the particular solution, and $x'$ is any vector from the null space $N(A)$.
* General recipe for solving:
    * given $(A|b)$, apply Gauss-Jordan elimination to transform to RREF system $(R|c)$.
    * If the RREF system contains a row that says 0 = nonzero, then we have a contradiction, and in this case $b$ is not in $C(A)$ and there is no solution.
    * Otherwise, set the free variables to zero to find a particular solution $x_0$.
    * Separately, solve for the null space $N(A)$.
    * Then the set of all solutions to $Ax=b$ is the set of vectors $x_0 + x'$, where $x_0$ is the particular solution, and $x'$ is any vector from $N(A)$.

**Reading:** Strang 3.3.

### Lecture 7 (Mon Feb 18 2025)
* Throughout this class, we let $v^1, \ldots, v^n$ be list of n vectors, each in the space $\mathbb{R}^m$. Let $A$ be the $m \times n$ matrix with columns $v^1, \ldots, v^n$.
    * The vectors $\lbrace v^1, ..., v^n\rbrace$ are **linearly dependent** if a non-trivial linear combination of them equals zero: this corresponds to $N(A)$ being strictly larger than $\lbrace 0\rbrace$. Otherwise, we say they are **linearly independent**: this corresponds to $N(A) = \lbrace 0\rbrace$.
    * A **basis** for a vector space $V$ is a list of vectors that span $V$, and are linearly independent. We covered the standard basis $\lbrace e^1, ..., e^n\rbrace$ for the space $\mathbb{R}^n$.
    * Let $V = \text{span} \lbrace v^1, ..., v^n\rbrace$. Then $V$ is the same as $C(A)$. If $\lbrace v^1, ..., v^n\rbrace$ are linearly independent, then they form a basis for $V$.
* More generally, perform Gauss-Jordan elimination, and let $R = GA$ be the RREF of $A$. Then $C(R) = G C(A)$.
    * The pivot columns of $R$ form a basis for $C(R)$, and the corresponding columns of $A$ form a basis for $C(A)$.
    * Note that rank(A) = # pivots in R = dim C(R) = dim C(A). Meanwhile # free variables in R = dim N(A).
    * There are n columns total, and each column must be pivot or free, so n = # pivot + # free = dim C(A) + dim N(A): this is the **rank-nullity theorem**.
* Lastly, we reviewed that if $A$ is an $m \times n$ matrix, then we view it as a map from $\mathbb{R}^n$ to $\mathbb{R}^m$, sending $x$ in $\mathbb{R}^n$ to $Ax$ in $\mathbb{R}^m$.

**Reading:** Strang 3.4.

**Note:** You should be able to do all of exam 1 using only the information covered in Lectures 1–6, together with the homework, recitations, and reading assigned before exam 1. However, since all the topics of the class are closely connected, material from Lecture 7 might also be helpful to know for the exam, and you are free to use that material on the exam as well. All exams in this class are closed book, closed notes.

------------------------------------------------------

### Exam 1 (Wed Feb 19 2025)

------------------------------------------------------

### Lecture 8 (Fri Feb 21 2025)

* We started the lecture with the definition of the **matrix transpose** $A^t$.
    * Note in general $(A^t)^t=A$, and $(AB)^t = B^t A^t$.
    * If $A=A^t$, then we say that $A$ is **symmetric**. Only square matrices can be symmetric.
* We covered the **four fundamental subspaces of a matrix**, and how to calculate them. Throughout, let A be an $m \times n$ matrix, and let $R = GA$ be the RREF. Thus $G$ is an invertible $m \times m$ matrix that encodes the Gauss-Jordan row operations.
    * Column space $C(A) = G^{-1} C(R)$. This is a subspace of $\mathbb{R}^m$.
    * Null space $N(A) = N(R)$. This is a subspace of $\mathbb{R}^n$.
    * Row space $C(A^t) = C(\mathbb{R}^t)$. This is a subspace of $\mathbb{R}^n$.
    * Left null space $N(A^t) = G^t N(\mathbb{R}^t)$. This is a subspace of $\mathbb{R}^m$.

Formal reasoning for the above claims:

1. Column space: $C(A) = {Ax : x \in \mathbb{R}^n}$ and $C(R) = {GAx : x \in \mathbb{R}^n}$. Thus $b' \in C(R) \Leftrightarrow b' = GAx \text{ for some } x \Leftrightarrow G^{-1}b' = Ax \text{ for some } x \Leftrightarrow G^{-1}b' \in C(A)$.  This proves $C(A) = G^{-1} C(R)$.
2. Null space: $N(A) = \lbrace x : Ax = 0\rbrace$ and $N(R) = \lbrace x : GAx = 0\rbrace$. Since $G$ invertible, $Ax = 0 \Leftrightarrow GAx = 0$.  This proves $N(A) = N(R)$.
3. Row space: recall $\mathbb{R}^t = (GA)^t = A^t G^t$.  $C(A^t) = \lbrace A^t x : x \in \mathbb{R}^m\rbrace$ and $C(\mathbb{R}^t) = \lbrace A^t G^t x : x \in \mathbb{R}^m\rbrace$.  Since $G$ is invertible, $G^t$ is also invertible. As $x$ ranges over all of $\mathbb{R}^m$, $G^t x$ also ranges over all of $\mathbb{R}^m$.  Therefore $C(A^t) = C(\mathbb{R}^t)$.
4. Left null space:  (***There was a typo on the blackboard, so please read this one carefully.***) $N(A^t) = \lbrace x : A^t x = 0\rbrace$ and $N(\mathbb{R}^t) = \lbrace x : A^t G^t x = 0\rbrace$. Therefore $x \in N(\mathbb{R}^t) \Leftrightarrow A^t G^t x = 0 \Leftrightarrow G^t x \in N(A^t)$.  This proves $N(A^t) = G^t N(\mathbb{R}^t)$.

In class, we calculated the four fundamental subspaces on a small example. We verified that the column space and left null space are orthogonal subspaces of $\mathbb{R}^m$, while the row space and null space are orthogonal subspace of $\mathbb{R}^n$.

**Reading:** Strang 3.5.

### Lecture 9 (Mon Feb 24 2025)
* In this class we reviewed the four fundamental subspaces of an $m \times n$ matrix $A$.
* We went over an example of how to calculate the four subspaces of $A$, using the RREF $R = GA$.
* Dimensions: both column space and row space have dimension r = rank(A). The null space has dimension $n - r$, while the left null space has dimension $m - r$.
* We covered the fact that in $\mathbb{R}^n$, the row space and null space are orthogonal complements of one another. In $\mathbb{R}^m$, the column space and left null space are orthogonal complements of one another.

**Reading:** Strang 4.1.

### Lecture 10 (Wed Feb 26 2025)

* We covered what it means for two subspaces of $\mathbb{R}^n$ to be:
    * complementary
    * orthogonal
    * orthogonal complements.
* In particular:
    * If $V$ and $W$ are complementary subspaces of $\mathbb{R}^n$, then any $x \in \mathbb{R}^n$ can be uniquely written as $x = v + w$ with $v$ from $V$, $w$ from $W$.
    * If $V$ and $W$ are in additional orthogonal complements, then $v$ is the orthogonal projection of $x$ onto $V$, while $w$ is the orthogonal projection of $x$ onto $W$. Denoted $v = \text{proj}_V x$ and $w = \text{proj}_W x$.
* We discussed the geometric interpretation of orthogonal projection:
    * $v = \text{proj}_V x$ is the unique vector $v$ in $V$ that lies closest to $x$.
    * equivalently, $v = \text{proj}_V x$ is the unique vector $v$ in $V$ such that $(x-v)$ is perpendicular to $V$.
    * We used the latter characterization to calculate $\text{proj}Y x$ where $Y$ is the span of a single nonzero vector $y$ in $\mathbb{R}^n$.

**Reading:** Strang 4.2.

### Lecture 11 (Fri Feb 28 2025)
* We covered the general formulas for orthogonal projection.
* Projection onto a one-dimensional subspace $Y = \text{span}\lbrace y\rbrace$, where $y$ is a unit vector in $\mathbb{R}^n$: $\text{proj}Y(x) = P_Y x$ where $P_Y = yy^t$. Note that $P_Y$ is an $n \times n$ symmetric matrix. Its column space is exactly the one-dimensional space $Y$, therefore $P_Y$ has rank one.
* Projection onto a general subspace $V$ of $\mathbb{R}^n$, where $\text{dim } V = r < n$: first express $V = C(A)$ where $A is an n \times r$ matrix whose columns form a basis of $V$. We showed in class that $v = \text{proj}V(b) = P_V b$ where $P_V = A(A^t A)^{-1} A^t$. This is an $n \times n$ symmetric matrix. Its column space is exactly $V = C(A)$, therefore $P_V$ has rank $r$.
    * **Claim:** If $A$ is $n \times r$ with rank $r$, then $A^t A$ is invertible. We stated this fact in class, and used it to define $P_V$. We did not yet give a justification of this fact, and will do so in a future lecture.
    * Note that $v = A x$ where $x = (A^t A)^{-1} A^t b$. This achieves the minimum distance $\Vert Ax-b \Vert$, and we call this the **least squares solution**.
* Lastly we went over some examples of the projection matrix formula:
    * In the one-dimensional case $Y = \text{span}\lbrace y\rbrace$ where $y$ is a unit vector, we take $A = y$ and recover the formula $P_Y = yy^t$.
    * If we have an orthonormal basis $\lbrace u^1, ..., u^r\rbrace$ for $V$, then $P_V = P_1 + ... + P_r$ where $P_j = u^j(u^j)^t$ is the orthogonal projection onto $\text{span}\lbrace u^j\rbrace$.

**Reading:** Strang 4.3.

### Lecture 12 (Mon March 3 2025)
* As we learned previously, the equation $Ax=b$ does not have a solution if b does not lie in column space $C(A)$. In this case, one can instead ask for the least squares (LS) solution: the choice of x that minimizes
```math
\|Ax-b\|^2 = \sum_i [(Ax)_i - b_i]^2
```
* This means $v=Ax$ should be precisely the projection of $x$ onto $C(A)$, so from what we previously learned, we see that $v = A(A^t A)^{-1}A^t b$, and consequently $x=(A^t A)^{-1}A^t b$.
* Application: given a data set $(a_i,b_i)$ for $1\le i \le 1000$, we covered how to find:
  * The straight line with no intercept that achieves the least squares fit: $b=xa$ where $x$ is the slope;
  * The straight line with intercept that achieves the least squares fit: $b = x_0 + x_1 a$ where $x_0$ is the intercept and $x_1$ is the slope;
  * The cubic function that achieves the least squares fit: $b = x_0 + x_1 a + x_2 a^2 + x_3 a^3$.

**Reading:** Strang 4.3.

### Lecture 13 (Wed March 5 2025)
* We learned the **Gram-Schmidt procedure**: given a basis $(v_1,\ldots,v_r)$ for a subspace $V$ of $\mathbb{R}^n$, it produces an orthonormal basis $(u_1,\ldots,u_r)$ of $V$.
* The Gram-Schmidt procedure can be summarized by the **QR factorization**: $A=QR$ where:
  * $A$ is the $n\times r$ matrix with columns $v_1,\ldots,v_r$;
  * $Q$ is the $n\times r$ matrix with columns $u_1,\ldots,u_r$;
  * $R$ is the $r\times r$ matrix of the coefficients relating the $v$'s to the $u$'s. In particular, $R$ is upper triangular with non-zero diagonal entries, and can be inverted by back-substitution.

**Reading:** Strang 4.4.

### Lecture 14 (Fri March 7 2025)
* Let $A$ be an $r\times n$ matrix of rank $r$, with $r<n$. This means that the column space $C(A)=\mathbb{R}^r$: therefore, for any $b\in\mathbb{R}^r$, the equation $Ax=b$ has at least one solution $\tilde{x}$. We also know that the null space $N(A)$ is a subspace of $\mathbb{R}^n$ of dimension $n-r>0$. It follows that in fact $Ax=b$ has infinitely many solutions, since $\tilde{x}+x'$ is also a solution for any $x'$ from $N(A)$. We can therefore ask, what is the minimum norm solution $x$? Any solution $x$ can be decomposed as $x^\parallel + x^\perp$ where $x^\parallel \in N(A)$ while $x^\perp\in N(A)^\perp = C(A^\top)$ (the row space of $A$). We discussed in class that the minimum norm solution to $Ax=b$ is exactly $x^\perp$. If we have a QR factorization $A^\top=QR$, then $Ax=b$ can be rearranged to give $x^\perp = QQ^\top x = Q(R^\top)^{-1}b$.
* If $A$ is an $m\times n$ matrix, then its **matrix pseudoinverse** is the $n\times m$ matrix $A^+$ which does the following:
  * Given $y\in\mathbb{R}^n$, let $b$ be the orthogonal projection of $y$ onto the column space $C(A)$.
  * Let $x^\perp$ be the minimum norm solution to the equation $Ax=b$.
Then $A^+$ is the $n\times m$ matrix which acts as $A^+y=x^\perp$.
* Two examples of calculating the pseudoinverse:
  * If $A$ is $r\times n$ with rank $r$, then the above calculation tells us that if we have the QR factorization $A^\top=QR$, then $A^+=Q(R^\top)^{-1} = A^\top (AA^\top)^{-1}$.
  * **(Corrected; this previously had a typo!)** If $A$ is $n\times r$ with rank $r$, then the pseudoinverse should first map $y$ to its orthogonal projection onto $C(A)$, that is, $b = A(A^\top A)^{-1} A^\top y$, which lies in $C(A)$. As a result $Ax=b$ has a unique solution, given by $x=(A^\top A)^{-1} A^\top y$. It follows that $A^+ = (A^\top A)^{-1} A^\top$.

**Reading:** Strang 4.5.

### Lecture 15 (Mon March 10 2025)
* If $A$ is an $n\times n$ square determinant, its **determinant** is the **signed** factor by which the linear transformation $A:\mathbb{R}^n\to\mathbb{R}^n$ scales $n$-dimensional volumes.
* Some key facts:
  * Product formula: $\det(AB)=(\det A)(\det B)$.
  * We have $\det A\neq0$ if and only if $A$ is invertible.
  * The determinant of an upper triangular matrix is the product of the diagonal entries.
* We covered several cases of $2\times 2$ matrices $A$: the unit square $S$ maps to a parallelogram $AS$, and $\det A$ is (up to sign) the 2-dimensional volume (area) of $AS$.
* Two ways to calculate $\det A$ up to sign:
  * Use a (generalized) QR factorization: $A=QR$ where $Q$ is an $n\times n$ orthogonal matrix, and $R$ is upper triangular (possibly with zero entries on the diagonal). Then $\det Q=\pm1$, so $\det A = \pm(\det R)$.
  * Use gaussian elimination: $GA=\tilde{A}$ where $\tilde{A}$ is in row echelon form (REF), and $G$ is a product of row swap or elimination matrices. Then $\det G = \pm1$, so $\det A = \pm(\det\tilde{A})$.

**Reading:** Strang 5.1.

### Lecture 16 (Wed March 12 2025)
* We covered the "big formula" for the determinant of an $n\times n$ matrix, $\det A = \sum_\sigma (\textup{sgn }\sigma)\prod_{i=1}^n a_{i,\sigma(i)}$. The sum goes over all $n!$ permutations of $\{1,\ldots,n\}$, and $\textup{sgn }\sigma$ denotes the sign of the permutation $\sigma$: it is $+1$ if $\sigma$ is a composition of an even number of swaps, and $-1$ if $\sigma$ is a composition of an odd number of swaps. We explained that this formula can be derived from the multilinearity property of the determinant.
* In most cases, the more efficient way to compute $\det A$ will be by gaussian elimination: $R = G_k \cdots G_1 A$. $R$ is in REF, so it is upper triangular and its determinant is simply the product of its diagonal entries. Each $G_i$ encodes an elementary row operation: if $G_i$ encodes a row swap, it follows from the big formula that $\det G_i=-1$. Otherwise, if $G_i$ encodes an elimination operation, then $G_i$ is a lower triangular matrix with all $1$'s along the diagonal, and in this case $\det G_i=1$. It follows that $\det A=(-1)^s\det R$, where $s$ is the number of row swaps in the gaussian elimination.

**Reading:** Strang 5.2.

### Lecture 17 (Fri March 14 2025)
* We covered the Laplace expansion of the determinant, which can be viewed as a way to organize the "big formula" from last time.
* We considered one example of a circulant matrix; see https://en.wikipedia.org/wiki/Circulant_matrix. Following the Wikipedia notation, our example had $c_0=1$, $c_1=z$, and all other $c_j=0$. We covered how to evaluate the determinant of this matrix using the "big formula", and also using Laplace expansion along the top row.

**Reading:** Strang 5.3.

### Lecture 18 (Mon March 17 2025)
* In this lecture we did some review and examples in preparation for the Wednesday exam.
* If $M=I+vv^\top$, we explained how to calculate that $M^{-1} = I-(1+\|v\|^2)^{-1}vv^\top$.
* Let $I$ be the $r\times r$ identity matrix, and $v$ a vector in $\mathbb{R}^r$. We calculated the pseudoinverse of the matrix 
```math
A = \begin{pmatrix} I & v  \\ 0 & 0 \end{pmatrix}
```

------------------------------------------------------

### Exam 2 (Wed March 19 2025)

------------------------------------------------------

### Lecture 19 (Fri March 21 2025)
* In this lecture we reviewed the Laplace expansion (also called cofactor expansion) of the determinant.
* Given an $n\times n$ matrix $A$, the $(i,j)$ **minor** is the $(n-1)\times(n-1)$ matrix $M_{i,j}$ obtained by removing the $i$-th row and $j$-th column of $A$.
* We defined the $(i,j)$ **cofactor** as $C_{i,j}=(-1)^{i+j}\det M_{i,j}$. The **cofactor matrix** is the $n\times n$ matrix $C$ with entries $C_{i,j}$.
* The **adjugate matrix** is $X=C^\top$. We derived in class that if $A$ is invertible, then $A^{-1}=(1/\det A) X$.
* We also used this to derive **Cramer's rule** for solving a linear system $Ax=b$.

**Reading:** finish Strang Chapter 5.

### Lecture 20 (Mon March 31 2025)
* At the start of this class, we discussed that diagonal matrices act in a simple way.
* A (square) matrix $A$ is **diagonalizable** if it can be related to a diagonal matrix via the equation $A=EDE^{-1}$ where $E$ is $n\times n$ invertible, and $D$ is $n\times n$ diagonal.
* **Caution: not all square matrices are diagonalizable!** Nevertheless, it is an important and useful concept.
* Let $E$ have columns $v^1,\ldots,v^n$, and let $D$ have diagonal entries $d_1,\ldots,d_n$. We showed that $v^j$ is an **eigenvector** of $A$ with **eigenvalue** $d_j$.
* Since $E$ is invertible (by definition), its columns form a basis of $\mathbb{R}^n$, which is called the **eigenbasis** of $A$. The action of $A$ in the eigenbasis is diagonal.
* We explained that $E$ and $E^{-1}$ may be viewed as implementing **change of basis**: $E^{-1}$ maps from standard coordinates to eigenbasis coordinates, while $E$ maps from eigenbasis coordinates to standard basis coordinates.
* We also covered some concrete examples. In future lectures we will learn how to compute matrix eigenvalues and eigenvectors.

**Reading:** start Strang Chapter 6.

### Lecture 21 (Wed April 2 2025)
* Let $A$ be a square $n\times n$ matrix. An **eigenvector** of $A$ is a non-zero vector $v\in\mathbb{R}^n$ such that $Av=\lambda v$ for a scalar $\lambda$ (the **eigenvalue**). We will allow $\lambda$ to be a real or complex number, so in general $\lambda\in\mathbb{C}$.
* An eigenvector with eigenvalue $\lambda=0$ is just a null vector.
* In general, for any $\lambda$, an eigenvector with eigenvalue $\lambda$ is any non-zero vector in the null space $N(A-\lambda I)$.
* It follows that the eigenvalues of $A$ are exactly the roots of $p_A(\lambda)=\det(A-\lambda I)$, the **characteristic polynomial** of $A$.
* Let $\alpha$ denote the **trace** of $A$ (sum of its diagonal entries). It follows from the determinant formula that $p_A(\lambda)$ is a polynomial in $\lambda$ of degree $n$, of the form
```math
p_A(\lambda) = (-1)^n\lambda^n +(-1)^{n-1} \alpha \lambda^{n-1} + \ldots + \det A\,.
```
* The **fundamental theorem of algebra** tells us that $p_A(\lambda)$ has $n$ roots $\lambda_1,\ldots,\lambda_n$, and can be factorized as
```math
p_A(\lambda) = (-1)^n \prod_{j=1}^n(\lambda-\lambda_j)\,.
```
* The eigenvalues are exactly the roots $\lambda_j$. They may be complex-valued, and it is possible to have multiple roots.
* The **algebraic multiplicity** of an eigenvalue $\lambda$ is the number of times it appears as a root in the characteristic polynomial.
* The **geometric multiplicity** of an eigenvalue $\lambda$ is the dimension of its **eigenspace**, $N(A-\lambda I)$.
* In general, $1\le \textup{geo mult} \le \textup{alg mult}$. We will discuss this further in the next lecture.

**Reading:** Strang 6.1-6.2.

### Lecture 22 (Fri April 4 2025)

* Let $A$ be a square $n\times n$ matrix. We discussed last time that the characteristic polynomial $p_A(\lambda)$ is a polynomial in $\lambda$ of degree $n$. The fundamental theorem of algebra then tells us that it has $n$ roots $\lambda_1,\ldots,\lambda_n$, and these are precisely the eigenvalues of $A$. The roots may be complex-valued, and it is possible to have multiple roots.
* The **algebraic multiplicity** of an eigenvalue $\lambda$ is the number of times it appears as a root of the characteristic polynomial.
* The **geometric multiplicity** of an eigenvalue $\lambda$ is the dimension of its **eigenspace**, $N(A-\lambda I)$.
* In general, $1 \le \textup{geo mult} \le \textup{alg mult}$. 
* The algebraic multiplicities sum up to the total number $n$ of roots. Eigenspaces for distinct eigenvalues are linearly independent, so the geometric multiplicities sum up to the combined dimension of all eigenspaces. The matrix $A$ is **diagonalizable** if and only if the latter sum equals $n$, which means we must have $\textup{geo mult} = \textup{alg mult}$ for all the eigenvalues. This is not guaranteed in general.
* A special case is that all $n$ roots are distinct. In this case we must have $\textup{geo mult} = \textup{alg mult} = 1$ for all eigenvalues, so the matrix $A$ in this case is always diagonalizable. If the roots are not all distinct, then $A$ may or may not be diagonalizable.
* If $A$ is not diagonalizable, then it has a Jordan canonical form (JCF), which can be viewed as a generalization of the diagonalization. (In the special case that $A$ is diagonalizable, the JCF is the same as the diagonalization.)

**Reading:** finish reading Strang 6.1-6.2.

### Lecture 23 (Mon April 7 2025)

* We discussed that eigenvalues and eigenvectors can be complex-valued, even for real matrices, and covered an example.
* In general, if $A$ is a real $n\times n$ matrix, then its characteristic polynomial has real coefficients. This implies that the non-real eigenvalues of $A$ must occur in conjugate pairs. (For example, this also implies that if $A$ is $n\times n$ with $n$ odd, then $A$ must have at least one real eiganvalue).
* We covered some basic concepts of complex numbers, including conjugate and modulus. We also covered complex vectors, the conjugate transpose operation, and the norm of a complex vector.
* Lastly, we covered the **spectral theorem**, which says that is $A$ is $n\times n$ real symmetric, then it has all real eigenvalues and eigenvectors, and an orthonormal eigenbasis. We can write this as $A=EDE^\top$ where both $D$ and $E$ are real, and $E$ is an orthogonal matrix. In class we also gave a partial proof of the spectral theorem.

**Reading:** Strang 6.3, as well as the first three pages of Strang 6.4.

### Lecture 24 (Wed April 9 2025)

* A symmetric matrix is **positive-definite (PD)** if all its eigenvalues are strictly positive.
* A symmetric matrix is **positive semi-definite (PSD)** if all its eigenvalues are nonnegative.
* If $A$ is symmetric, it is PD if and only if $x^\top Ax>0$ for every vector $x$.
* If $A$ is symmetric, it is PSD if and only if $x^\top Ax\ge0$ for every vector $x$.
* For any matrix $M$ ($n\times p$), both $MM^\top$ and $M^\top M$ are PSD.
* In this lecture we introduced the **singular value decomposition (SVD)**, which applies to any matrix $M$ ($n\times p$). More precisely we covered both the long SVD and the short SVD.
* In the special case that $M$ is a square matrix of full rank, the long and short SVD are identical, and we covered in class the procedure to find this SVD.

**Reading:** Strang 7.1.

### Lecture 25 (Fri April 11 2025)

* We covered how to find the short and long SVD of a general matrix $M$ ($n\times p$).
* The matrix $A=M^\top M$ is PSD, so we can find its spectral decomposition $A=EDE^\top$. Moreover we can arrange that the diagonal entries of $D$ are $d_1 \ge \ldots \ge d_r > 0 = d_{r+1} = \ldots = d_p$, where $r$ is the rank of $M$ (and also the rank of $A$).
* Let $V$ be the $p\times r$ matrix formed from the first $r$ columns of $E$.
* Let $\Sigma$ be the $r\times r$ diagonal matrix with diagonal entries $\sigma_i=(d_i)^{1/2}$ for $1\le i\le r$.
* Let $U$ be the $n\times r$ matrix defined by $U=MV\Sigma^{-1}$.
* Then $M=U\Sigma V^\top$ gives the short SVD of $M$.
* To convert from short to long SVD: expand $\Sigma$ from $r\times r$ to $n\times p$ by adding zeroes; expand $U$ from $n\times r$ to $n\times n$ so that its columns form an orthonormal basis of $\mathbb{R}^n$; expand $V$ from $p\times r$ to $p\times p$ so that its columns form an orthonormal basis of $\mathbb{R}^p$.
* We also covered some examples and practice problems.

**Reading:** finish reading Strang 7.1.

### Lecture 26 (Wed April 16 2025)

* In this lecture we covered geometric interpretations of the SVD.
* Throughout, suppose $M$ is $n\times p$ with rank $r$, and that we rank its singular values in nondecreasing order $\sigma_1\ge \ldots \ge \sigma_r>0$.
* The maximum singular value $\sigma_1$ is the *operator norm* or *spectral norm* of $M$, usually denoted $\|M\|_\textup{op}$ or $\|M\|$.
* The operator norm of $M$ can be understood as the maximum value of $\|Mv\|$ attained as $v$ ranges over all unit vectors in $\mathbb{R}^p$.
* The SVD can be used to calculate the pseudoinverse: if the short SVD of $M$ is given by $M=U\Sigma V^\top$, then the pseudoinverse of $M$ is $V\Sigma^{-1}U^\top$.

**Reading:** Strang 7.2.

### Lecture 27 (Fri April 18 2025)

* In this lecture we covered the application of SVD to low-rank approximation and image compression.
* Suppose $M$ is $n\times p$ with short SVD $M=U\Sigma V^\top$. As always, we rank the singular values (diagonal entries of $\Sigma$) $\sigma_1\ge \ldots \ge \sigma_r>0$.
* The rank-$k$ approximation of $M$ is given by $M_k = U_k \Sigma_k (V_k)^\top$, where $U_k$ is formed from the first $k$ columns of $U$, $V_k$ is formed from the first $k$ columns of $V$, and $\Sigma_k$ is the upper left $k\times k$ submatrix of $\Sigma$. 
* We discussed three matrix norms: (1) operator norm / spectral norm; (2) Frobenius norm / Hilbert--Schmidt norm, (3) nuclear norm.
* Eckhart--Young theorem: among all matrices of rank at most $k$, the best approximation to $M$ is given by $M_k$. It is best with respect to all three of the spectral norms listed above.
* Application to image compression: if $M$ represents an $n\times p$ image, the original image consists of $np$ pixels. Storing the compressed image $M_k$ requires storing $(n+p)k+k$ values. If $n,p$ are large and $k$ is relatively small, the compressed image requires much less storage.
* See https://timbaumann.info/svd-image-compression-demo/ for examples.

**Reading:** Strang 7.2.

### Lecture 28 (Wed April 23 2025)

* We covered the application of SVD to PCA (principal components analysis).
* Let $X$ be an $n\times p$ data matrix where $n$ is the number of individuals or samples, and $p$ is the number of attributes or features. 
* We assume the data is normalized, so that each column (feature) has mean zero and standard deviation one.
* 2D PCA: choose the 2D projection of the data that shows the most variability.
* We learned in class that this is achieved by taking $u,v$ to be the two top right singular vectors (corresponding to the first two columns of the $V$ matrix), resulting in the 2D scatterplot of the values $(x_i\cdot u,x_i\cdot v)$ for $i=1,\ldots,n$.
* Lastly, we showed that 1D PCA and ordinary least squares (OLS, see Lecture 12) are not the same. This is the reason the textbook refers to 1D PCA as "perpendicular least squares."

**Reading:** Strang 7.3.

### Lecture 29 (Fri 25 April 2025)

* In this lecture we finished our discussion of SVD and PCA by going over the application covered in the paper https://doi.org/10.1038/nature07331.
* We reviewed the basics of complex numbers: real part, imaginary part, complex conjugate, modulus, polar form, Euler's formula.
* Example: the permutation matrix $A$ corresponding to the permutation $\sigma$ that maps $1\mapsto 2, 2\mapsto 3, \ldots, n-1\mapsto n, n\mapsto1$. The eigenvalues are the $n$-th roots of unity.
* Example: solving the differential equation $f''(t)=-f(t)$.
* We defined the complex dot product (also called scalar product or inner product): for $v,w\in\mathbb{C}^n$, we define $v\cdot w = \bar{v}^\top w$.

**Reading:** start Strang 6.4.

### Lecture 30 (Mon 28 April 2025)

* In this class we covered definitions of special classes of complex $n\times n$ matrices.
* *Unitary* matrices: extension of definition of **orthogonal** matrices. Orthogonal matrices preserve the $\mathbb{R}^n$ scalar product, and unitary matrices preserve the $\mathbb{C}^n$ scalar product.
* *Hermitian* matrices: extension of definition of **symmetric** matrices. Symmetric matrices are self-adjoint on $\mathbb{R}^n$, and hermitian matrices are self-adjoint on $\mathbb{C}^n$.
* A matrix $A\in\mathbb{C}^{n\times n}$ is **normal** if $A\bar{A}^\top=\bar{A}^\top A$. Both sets of unitary matrices and hermitian matrices sit inside the set of normal matrices.
* We covered the **spectral theorem** for three cases: symmetric matrices (covered previously), hermitian matrices, and normal matrices.
* Example: same permutation matrix as discussed last time. This matrix is normal, but not symmetric. It has an orthogonal eigenbasis, which corresponds to a special basis of $\mathbb{C}^n$ called the **Fourier basis.**

**Reading:** continue Strang 6.4.
