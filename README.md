<h2 align="center">
  MIT 18.06, Spring 2023<br />
  Linear Algebra
</h2> 

Welcome to MIT 18.06: Linear Algebra! The Spring 2023 course information, materials, and links are recorded below. Course materials for previous semesters are archived in the [other branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-branches-in-your-repository/viewing-branches-in-your-repository) of this repository. You can dive in right away by reading this [introduction](https://github.com/mitmath/1806/blob/master/notes/Introduction%20to%20Linear%20Algebra%206th%20edition%20and%20A%20%3D%20CR_04.pdf) to the course by Professor Strang.

NOTICE OF VIDEO RECORDING: The Spring 2023 lectures for 18.06 will be recorded for [OCW](https://ocw.mit.edu/). See the [notice of recording](https://github.com/mitmath/1806/blob/master/notes/Notice%20of%20Video%20Recording%2018_06%20S23.docx) for more information.

Catalog Description: *Basic subject on matrix theory and linear algebra, emphasizing topics useful in other disciplines, including systems of equations, vector spaces, determinants, eigenvalues, singular value decomposition, and positive definite matrices. Applications to least-squares approximations, stability of differential equations, networks, Fourier transforms, and Markov processes. Uses linear algebra software. Compared with 18.700, more emphasis on matrix algorithms and many applications.*

## Syllabus

**Lectures**: Monday, Wednesday, and Friday at 11am in 26-100.

**Instructors**: [Prof. Gilbert Strang](https://math.mit.edu/~gs/) and [Dr. Andrew Horning](https://math.mit.edu/directory/profile.html?pid=2334).  

**Textbook**: [Introduction to Linear Algebra: 6th Edition](http://eduapps.mit.edu/textbook/books.html?Term=2023SP&Subject=18.06). Professor Strang will explain more about this new 6th edition in class (it is not yet on Amazon). It now ends with two chapters on deep learning. Professor Strang plans to make the textbook available for students to purchase at a discount. Here again is a link to the [preface and contents](https://github.com/mitmath/1806/blob/master/notes/Introduction%20to%20Linear%20Algebra%206th%20edition%20and%20A%20%3D%20CR_04.pdf).

**Recitations**: Tuesday at the following times and locations.

* R01: 9am with M. Chen (2-132)
* R02: 10am with M. Chen (2-132)
* R03: 10am with V. Krylov (2-136)
* R04: 11am with D. Kliuev (4-159)
* R05: 11am with V. Krylov (2-136)
* R06: 12pm with M. Harris (4-159)
* R07: 12pm with D. Kliuev (2-105)
* R08: 12pm with I. Ganguly (2-136)
* R09: 1pm with M. Harris (2-132)
* R10: 1pm with I. Ganguly (2-136)
* R11: 1pm with Z. Chen (2-135)
* R12: 2pm with Z. Chen (2-132)
* R13: 2pm with K. Vashaw (2-136)
* R14: 3pm with K. Vashaw (2-136)

**Office Hours:** Please make arrangements to meet Professor Strang before or after class if you wish. The rest of the instructional team will hold weekly office hours. You may attend any office hours that fit your schedule.

* A. Horning: Friday 12:30 - 1:30 in 66-144
* M. Chen: Friday 4-6 in 2-242
* V. Krylov: Thursday 5 - 7 in 2-361
* D. Kliuev: Thursday 11 - 1 in 2-341
* M. Harris: Wednesday 4 - 6 in 2-333
* I. Ganguly: Monday 12:30-1:30 in 2-146 and Thursday 1-2 in 2-139
* Z. Chen: Wednesday 12 - 2 in 2-340
* K. Vashaw: Friday 1:30 - 2:30 in 66-144

**Exams**: We will have 3 exams during the semester: February 22, March 20, April 19. Final Exam TBD In May. For conflicts and/or accomodations, please contact [Sapphire Tang](https://math.mit.edu/directory/profile?pid=2457) in Academic Services as soon as possible (1-2 weeks in advance).

**Homework:** Due weekly on Sunday at midnight (except exam weeks and spring break).  Upload a .pdf of your clearly written or typed solutions on [Gradescope](https://www.gradescope.com/). Late homework will not be accepted and extensions will not be granted within 48 hours of the due date except in cases of genuine emergency (a letter from [S^3](https://studentlife.mit.edu/s3) is required).

**Collaboration:** Collaboration on homework is highly encouraged! However, please maintain academic integrity by writing up your solutions individually and by naming all collaborators and information sources consulted for the assignment (you don't need to cite the textbook).

**Grading:** 20% Homeworks (equally weighted, lowest dropped) + 45% Quizzes (3 midterms, each worth 15%) + 35% Final Exam

**Resources**: In addition to this repository, we will use the following online resources.

* [Canvas](https://web.mit.edu/canvas/) - course announcements will be posted on Canvas.
* [Gradescope](https://www.gradescope.com/) - submit Psets and check grades through Gradescope.
* [Piazza](https://piazza.com/mit/spring2023/1806/home) - ask questions in the course discussion forum.


MIT also has excellent study resources: [math learning center](https://math.mit.edu/learningcenter/), [TSR^2 study/resource room](https://ome.mit.edu/programs/talented-scholars-resource-room-tsr2), [pset partners](https://psetpartners.mit.edu/).

## Problem sets

* [Pset 1](https://github.com/mitmath/1806/blob/master/psets/hw1a.pdf) is due on Sunday February 12 at 11:59pm.

* [Pset 2](https://github.com/mitmath/1806/blob/master/psets/hw2a.pdf) is due on Sunday February 19 at 11:59pm.

## Exams

* Exam 1 will be held on Wednesday, February 22 between 11am-12pm. Last names beginning with A-L will be in 50-340, while last names beginning with M-Z will be in 26-100. 

## Lecture Material and Summaries

### Lecture 1 (February 6)

Two ways to do matrix-vector multiplication are the "row way" and the "column way."
* "Row way" = dot products between rows of matrix and the vector.
* "Column way" = linear combination of columns in the matrix. The coefficients in the linear combination are the entries of the vector.

The column way leads to the _column space_ of a matrix, the space of all possible linear combinations of the columns. Does the column space of a 3 x 3 matrix form a line, a plane, or fill the whole space? It depends on how many _linearly independent_ columns there are. The geometric picture of a matrix's column space is the first key idea of linear algebra.

The dot product tells us how to do matrix-vector multiplication the "row way." The remarkable _cosine formula_ for the dot product also shows how to use it to measure the length of vectors and the angles between them. In particular, perpendicular vectors have dot product = 0. Two useful inequalities follow quickly from the cosine formula: the _Cauchy-Schwarz_ and _triangle_ inequalities. Beyond matrix multiplication, the dot product reveals the geometry of vectors and their linear combinations.

**Further Reading:** Textbook, chapter 1.1 and 1.2.

### Lecture 2 (February 8)

The number of linearly indepdent columns in a matrix is the _column rank_. The number of linearly independent rows is the _row rank_. The remarkable fact is that these two numbers are the same! In the rank one case, this means that all the columns are multiples of a single vector. The rows are also multiples of a single vector! We can write the rank one matrix A as the product of a column vector and row vector: the row vector tells us what multiples we use to get the columns of A.

Beyond rank one, we can select linearly independent columns of A by moving from left to right. We ask, is the next column a linear combination of the previous columns? The linearly independent columns of A become the columns of a matrix C. The columns of a matrix R tell us how to combine the columns of C to get ALL columns of A: this is the _factorization_ A = C  R. R always contains the identity matrix (unless A is zero) and its rows are linearly independent. With A = C  R, we are very close to understanding why the column and row rank of A have to be the same!

**Further Reading:** Textbook, chapter 1.3 and 1.4.

### Lecture 3 (February 10)

There are four useful ways to organize matrix-matrix multiplication:
* dot product between row i of A and column j of B gives entry (i,j) of AB,
* matrix A times column j of B gives column j of AB,
* row i of A times matrix B gives row i of AB,
* AB is a sum of rank 1 matrices: columns of A times rows of B.

The middle two are particularly useful for understanding the column or row space of the product AB.

With these conceptual ways to organize matrix-matrix multiplication, we see that A = CR means that the columns of A are combinations of columns of C and the rows of A are combinations of the rows of R. The factors C and R reveal the column space and the row space of the matrix A.

**Further Reading:** Textbook, review chapter 1. You may find this [review sheet](https://github.com/mitmath/1806/blob/master/notes_2023/ch1_review.pdf) helpful.

### Lecture 4 (February 13)

At the heart of linear algebra is the equation Ax = b. We have n equations in n unknowns and A is an n by n matrix. 
* If A has rank n, there is a unique solution.
* If A has rank less than n, then there is either (a) no solution or (b) infinitely many solutions!

In a simple 2 by 2 example, the second scenario happens when the equations define parallel lines that (a) never intersect or (b) are the same line. 

To solve Ax = b, we combine equations to eliminate unknowns. This is elimination: elementary row operations on A and b convert A to upper triangular form. Once A is in triangular form, we can solve one variable at a time with _backsubstitution_.

**Further Reading:** Textbook, chapter 2.1.

### Lecture 5 (February 15)

Elimination converts A to an upper triangular matrix U. We can write the elimination steps as multiplication on the left of A by _elimination matrices_. Gathering the product of the elimination matrices on the left of A gives us EA = U. Inverting E, we arive at the famous factorization A = LU: A is the product of a lower (L) and an upper triangular matrix (U). 

Elimination and backsubstitution implicitly invert A to solve Ax = b. In practice, we rarely compute the inverse of A directly (e.g., calculate its entries). However, it's a useful theoretical tool: studying the properties of inverses will allow us to connect the ideas of elimination to the ideas of column and row space from week one.

**Further Reading:** Textbook, chapter 2.2 and 2.3.

### Lecture 6 (February 17)

The inverse of a matrix gives us a direct way to think about Ax = b. An invertible matrix has a unique inverse, a unique solution to Ax = b for any b, and its columns are linearly independent. A triangular matrix is invertible if and only if its diagonal entries are nonzero. The inverse of a product of matrices is the product of the inverses in reverse order!

We rarely compute inverses explicitly on the computer. Instead, we solve Ax = b with elimination and backsubstitution. The inverse of the product of elimination matrices has a special structure. The diagonal entries are all one and the subdiagonal entries are the multipliers from elimination! This is the lower triangular matrix L in A = LU. If we encounter unwanted zeros on the diagonal during elimination, we can (when A is invertible) remedy the situation by interchanging rows to move the offending zero and replace it with a nonzero pivot. This leads us to elimination with row-interchanges: PA = LU.

**Further Reading:** Textbook, chapter 2.2, 2.3, and 2.4.
