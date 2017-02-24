# Spring 2017 Lecture Summaries

This document is a *brief* summary of what was covered in each 18.06
lecture, along with links and suggestions for further reading.  It is
*not* a good substitute for attending lecture, but may provide a
useful study guide.

I'll try to update it within a day of each lecture.

## Lecture 1 (Feb 8)

* [pset 1 is posted](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset1/pset1.ipynb).

Went over the [course overview
slides](https://github.com/stevengj/1806-spring17/blob/master/lectures/lecture1/overview.pdf)
giving the syllabus and the "big picture" of what 18.06 is about.

Then I started right in on [Gaussian
elimination](https://en.wikipedia.org/wiki/Gaussian_elimination).  I
started with the "high school" method of writing out three equations
in three unknowns, adding/subtracting multiples of equations until we
were left with one equation in one unknown — at that point we can
solve it, then work backwards ("backsubstitution") through the
remaining equations until we know all the unknowns.  Then, I wrote the
same equations in matrix form, and renamed this process "Gaussian
elimination": we add/subtract multiples of matrix rows to introduce
zeros below the diagonal, i.e. to make the matrix [upper
triangular](https://en.wikipedia.org/wiki/Triangular_matrix).   We want to do the same operations to the right-hand side, so we [augment](https://en.wikipedia.org/wiki/Augmented_matrix) the matrix with the right-hand side before starting Gaussian eliminations.

This process is quite tedious to do by hand, so I instead switched over to [Julia](http://julialang.org/) to do more computational exploration with [this Julia notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/lecture1/Gaussian-elimination.ipynb).  See [here for more information on using Julia](https://github.com/stevengj/julia-mit); you can also go to [juliabox.com](https://juliabox.com/) to use it online without installing anything.  To use the interactive widgets in the notebook from today, you will have to run it in Julia yourself:

1. Go to the [notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/lecture1/Gaussian-elimination.ipynb) and click on the *download icon* on the upper-right hand corner to download the file onto your computer

2. Log into juliabox (if you haven't installed Julia locally on your computer) and you will see a "dashboard" listing of notebooks.  *Drag* the `Gaussian-elimination.ipynb` file from your computer onto this dashboard to upload it.

3. Click the notebook in the dashboard to run it.

4. You can run individual cells by typing "shift-enter".  You can also run all of the cells at once (e.g. to create all of the interactive widgets) by choosing *Run All* from the *Cell* menu at the top.  (Note: if you have installed Julia on your own computer, you will need to run `Pkg.add("PyPlot")` and `Pkg.add("Interact")` first, if you have not done so already, in order to install the packages needed for this notebook.)

What comes next?  The problem with expressing Gaussian elimination this way, as operations on individual numbers in the matrix, is that it is impossible to follow the process in detail for anything except a very tiny matrix.   We need a higher-level way to express the process, both to help us understand it and also to help us to *use* it (e.g. to perform additional algebraic transformations afterwards).   To do this, we want to express the process, not as operations on individual numbers, but as [multiplications of whole matrices](https://en.wikipedia.org/wiki/Matrix_multiplication).

In particular, our goal in the next lectures will be to find a matrix E such that multiplying both sides of Ax=b by E (on the left) transforms it into upper-triangular form.  That is, Gaussian elimination turns Ax=b into EAx=Ux=Eb=c, where U is upper triangular.  *Amazing fact*: it will turn out that E is *lower* triangular, and that by writing U=EA we have effectively written A=E⁻¹U=LU, where L is lower triangular too.  This is called the [LU factorization of A](https://en.wikipedia.org/wiki/LU_decomposition), and is an *incredibly useful* way to look at Gaussian elimination.  The computer gives us L and U, and then given those matrices it turns out that we can figure out lots of things that would have been hard to do with A alone.

**Further reading:** Textbook sections 2.1 and 2.2.  Strang [lecture 2 video](https://www.youtube.com/watch?v=QVKj3LADCnA).

## Lecture 2 (Feb 10)

* [Matrix-multiplication and LU notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/lecture2/Matrix-mult-perspectives.ipynb)

Went over several different perspectives on matrix multiplication: the *same arithmetic operations* can be viewed as row×columns, matrix×columns, rows×matrix, columns×rows, and more.   If you are doing hand calculations (but who does that, really?), rows×columns is probably the easiest.  But the other viewpoints help us *think* about matrix multiplication in different ways, both to understand what is going on and also to *design* matrices to perform certain operations.

Using this understanding, we rewrote Gaussian elimination in matrix form: we multiply a matrix A on the *left* by a sequence of lower-triangular elimination matrices to arrive at an upper-triangular matrix U.   Going *backwards* from U to A just means reversing the steps, or multiplying by the elimination matrices with flipped signs.  This led us to understand Gaussian elimination (without row swaps) as computing the [LU factorization](https://en.wikipedia.org/wiki/LU_decomposition) A=LU: it expresses A as the product of a lower-triangular matrix L with an upper-triangular matrix U.   This turns out to be *extremely* useful
as both a computational and a theoretical tool, because we will see that triangular matrices are much easier to work with than general matrices.

**Further reading:** Textbook secitons 2.4, 2.3, 2.6.  Strang [lecture 1 video](https://www.youtube.com/watch?v=ZK3O402wf1c), [lecture 4 video](https://www.youtube.com/watch?v=5hO3MrzPa0A). 

## Optional Julia Tutorial (Friday Feb 10, 5pm, 32-123)

On Friday at 5pm, there will be an optional tutorial session in 32-123
for the [Julia](http://julialang.org/) computer software that we will be using in 18.06 this
semester for homework and lecture demonstrations. Julia is a
programming language, but no programming will be required in 18.06: we
will just be using it as a "fancy calculator" that happens to have
lots of linear algebra and other capabilities. The tutorial session is
optional; for the homework, we will mostly just give you code and tell
you to run it, perhaps with minor tweaks, in order to perform
computational experiments.  Bring your laptops, and try logging into
[juliabox.com](https://juliabox.com) beforehand.  More information:

* [Instructions/links for using Julia](https://github.com/stevengj/julia-mit/)
* [Overview slides](https://github.com/stevengj/1806-spring17/blob/master/julia/Julia-intro.pdf)
* [Julia cheatsheet](https://github.com/stevengj/1806-spring17/blob/master/julia/Julia-cheatsheet.pdf)
* [Tutorial notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/julia/tutorial.ipynb)

## Lecture 3 (Feb 15)

* [pset 1 solutions](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset1/pset1-sol.ipynb), [pset 2 is posted](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset2/pset2.ipynb).

* [LU and matrix-inverse notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/lecture3/LU-and-Inverses.ipynb)

Went through the LU notebook, with some blackboard aids, covering:

* How the L matrix entries are just the multipliers from Gaussian elimination
* How in practice, one rarely "augments" the matrix with the right-hand side.  Instead, you compute A=LU, substitute this into Ax=b=LUx, let c=Ux, solve Lc=b, then solve Ux=c.  In particular, solving Lc=b is *exactly* the same as performing the Gaussian-elimination steps on c.
* Given A=LU, you can efficiently solve multiple right-hand sides, or equivalently the matrix equation AX=B.
* How row swaps lead to the factorization PA=LU: in practice, the computer *always* does row swaps, and always gives you a permutation matrix P (or its equivalent).
* Singular matrices = zero pivots (that can't be eliminated by row swaps) = no solutions or infinitely many solutions.

I briefly started talking about matrix inverses, but will mainly do
that in Lecture 4.

**Further reading:** Textbook sections 2.6, 2.7, 2.5.  Strang [lecture 4 video](https://www.youtube.com/watch?v=5hO3MrzPa0A) and [lecture 5 video](https://www.youtube.com/watch?v=JibVXBElKL0&list=PL49CF3715CB9EF31D).

## Lecture 4 (Feb 17)

* [Inverses, complexity, and transposes notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/lecture4/Inverses-Complexity-Transposes.ipynb)

Went through the topics in the lecture notebook:

* Matrix inverses: computation from LU (and why in practice you usually *don't* compute them), properties like A⁻¹A = A⁻¹A = I or (AB)⁻¹ = B⁻¹A⁻¹.

* Complexity of matrix operations: why matrix × vector or backsubstitution scale like n² for n×n matrices, while matrix × matrix or Gaussian elimination (LU factorization) scale like n³.   Matrices much bigger than a few thousand square quickly become impractical, and really large problems are only tractable because they have special structure like sparsity.

* Transposes.  Showed that the inverse of a permutation matrix is its transpose because the columns are orthonormal: this is an example of what we will later call an "orthogonal" or "unitary" matrix.

We will discuss more properties of transposes in the next lecture (I didn't finish the last two sections).

**Further reading:** Textbook sections 2.5, 2.7, 2.6 ("The cost of elimination").  Strang [video lecture 3](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-3-multiplication-and-inverse-matrices/) and [video lecture 5](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-5-transposes-permutations-spaces-r-n/).

## Lecture 5 (Feb 21)

* [Transposes notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/lecture5/Transposes.ipynb)

Continued talking about transposes, from lecture 4: relationship to
matrix multiplication, dot products, and LU factorization.  Symmetric
matrices and factorizations (LDLᵀ and Cholesky).

**Further reading:** Textbook, section 2.7. We will return to symmetric positive-definite (SPD) matrices much later in the course; for a preview, see the textbook section 6.5 (it's okay if you don't understand the eigenvalue stuff yet).

## Lecture 6 (Feb 22)

* [pset 2 solutions](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset2/pset2-sol.ipynb), [pset 3](http://nbviewer.jupyter.org/urls/rawgit.com/stevengj/1806-spring17/master/psets/pset3/pset3.ipynb).

* The first exam will be ***next week** on Friday March 3 in room 50-340.  It will cover everything through pset 3, up to including the lecture on Monday, February 27.  (It may be a *bit harder* than exams in previous terms, but grading will be adjusted accordingly.)


Introduced vector spaces and subspaces.  Examples of vector spaces include real n-component vectors (ℝⁿ, or ℂⁿ for complex numbers), real m×n matrices, functions f(x) (ℝ↦ℝ, real numbers to real numbers).  Examples of subspaces includes planes or lines through the origin in ℝ³, or the origin itself; polynomial functions; polynomials of degree ≤ 3.

For an m×n matrix A, introduced two important subspaces.

* First, the column space C(A): the set {Ax for all x ∈ ℝⁿ}.  This is the set of *right-hand sides* b such that Ax=b is *solvable*, and is a subspace of ℝᵐ (not ℝⁿ unless m=n!).

* Second, the null space (also called the "kernel") N(A): the set {x such that Ax=0⃗} ⊆ ℝⁿ (i.e., a subspace of ℝⁿ).  Given any solution x to Ax=b, then x+y is also a solution if y ∈ N(A).

These are very important subspaces because they tell us a lot about
the matrix A and solutions to Ax=b.  As a trivial example, if A is an
n×n *invertible* matrix, C(A)=ℝⁿ and N(A)={0⃗}.  Conversely, if A is
the n×n matrix of *all zeros* (the "most singular" matrix), then
C(A)={0⃗} and N(A)=ℝⁿ.  Our goal in the next lectures will be to
understand how C(A) and N(A) relate to each other (and another two
important subspaces) and to the *elimination* process on A.

**Further reading:** Textbook, sections 3.1 and 3.2.