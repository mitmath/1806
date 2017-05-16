# Spring 2017 Lecture Summaries

This document is a *brief* summary of what was covered in each 18.06
lecture, along with links and suggestions for further reading.  It is
*not* a good substitute for attending lecture, but may provide a
useful study guide.

I'll try to update it within a day of each lecture.

## Lecture 1 (Feb 8)

* [pset 1 is posted](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset1/pset1.ipynb).

Went over the [course overview
slides](https://github.com/stevengj/1806-spring17/blob/master/lectures/overview.pdf)
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

This process is quite tedious to do by hand, so I instead switched over to [Julia](http://julialang.org/) to do more computational exploration with [this Julia notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Gaussian-elimination.ipynb).  See [here for more information on using Julia](https://github.com/stevengj/julia-mit); you can also go to [juliabox.com](https://juliabox.com/) to use it online without installing anything.  To use the interactive widgets in the notebook from today, you will have to run it in Julia yourself:

1. Go to the [notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Gaussian-elimination.ipynb) and click on the *download icon* on the upper-right hand corner to download the file onto your computer

2. Log into juliabox (if you haven't installed Julia locally on your computer) and you will see a "dashboard" listing of notebooks.  *Drag* the `Gaussian-elimination.ipynb` file from your computer onto this dashboard to upload it.

3. Click the notebook in the dashboard to run it.

4. You can run individual cells by typing "shift-enter".  You can also run all of the cells at once (e.g. to create all of the interactive widgets) by choosing *Run All* from the *Cell* menu at the top.  (Note: if you have installed Julia on your own computer, you will need to run `Pkg.add("PyPlot")` and `Pkg.add("Interact")` first, if you have not done so already, in order to install the packages needed for this notebook.)

What comes next?  The problem with expressing Gaussian elimination this way, as operations on individual numbers in the matrix, is that it is impossible to follow the process in detail for anything except a very tiny matrix.   We need a higher-level way to express the process, both to help us understand it and also to help us to *use* it (e.g. to perform additional algebraic transformations afterwards).   To do this, we want to express the process, not as operations on individual numbers, but as [multiplications of whole matrices](https://en.wikipedia.org/wiki/Matrix_multiplication).

In particular, our goal in the next lectures will be to find a matrix E such that multiplying both sides of Ax=b by E (on the left) transforms it into upper-triangular form.  That is, Gaussian elimination turns Ax=b into EAx=Ux=Eb=c, where U is upper triangular.  *Amazing fact*: it will turn out that E is *lower* triangular, and that by writing U=EA we have effectively written A=E⁻¹U=LU, where L is lower triangular too.  This is called the [LU factorization of A](https://en.wikipedia.org/wiki/LU_decomposition), and is an *incredibly useful* way to look at Gaussian elimination.  The computer gives us L and U, and then given those matrices it turns out that we can figure out lots of things that would have been hard to do with A alone.

**Further reading:** Textbook sections 2.1 and 2.2.  Strang [lecture 2 video](https://www.youtube.com/watch?v=QVKj3LADCnA).

## Lecture 2 (Feb 10)

* [Matrix-multiplication and LU notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Matrix-mult-perspectives.ipynb)

Went over several different perspectives on matrix multiplication: the *same arithmetic operations* can be viewed as row×columns, matrix×columns, rows×matrix, columns×rows, and more.   If you are doing hand calculations (but who does that, really?), rows×columns is probably the easiest.  But the other viewpoints help us *think* about matrix multiplication in different ways, both to understand what is going on and also to *design* matrices to perform certain operations.

Using this understanding, we rewrote Gaussian elimination in matrix form: we multiply a matrix A on the *left* by a sequence of lower-triangular elimination matrices to arrive at an upper-triangular matrix U.   Going *backwards* from U to A just means reversing the steps, or multiplying by the elimination matrices with flipped signs.  This led us to understand Gaussian elimination (without row swaps) as computing the [LU factorization](https://en.wikipedia.org/wiki/LU_decomposition) A=LU: it expresses A as the product of a lower-triangular matrix L with an upper-triangular matrix U.   This turns out to be *extremely* useful
as both a computational and a theoretical tool, because we will see that triangular matrices are much easier to work with than general matrices.

**Further reading:** Textbook sections 2.4, 2.3, 2.6.  Strang [lecture 1 video](https://www.youtube.com/watch?v=ZK3O402wf1c), [lecture 4 video](https://www.youtube.com/watch?v=5hO3MrzPa0A).

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

* [LU and matrix-inverse notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/LU-and-Inverses.ipynb)

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

* [Inverses, complexity, and transposes notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Inverses-Complexity-Transposes.ipynb)

Went through the topics in the lecture notebook:

* Matrix inverses: computation from LU (and why in practice you usually *don't* compute them), properties like A⁻¹A = A⁻¹A = I or (AB)⁻¹ = B⁻¹A⁻¹.

* Complexity of matrix operations: why matrix × vector or backsubstitution scale like n² for n×n matrices, while matrix × matrix or Gaussian elimination (LU factorization) scale like n³.   Matrices much bigger than a few thousand square quickly become impractical, and really large problems are only tractable because they have special structure like sparsity.

* Transposes.  Showed that the inverse of a permutation matrix is its transpose because the columns are orthonormal: this is an example of what we will later call an "orthogonal" or "unitary" matrix.

We will discuss more properties of transposes in the next lecture (I didn't finish the last two sections).

**Further reading:** Textbook sections 2.5, 2.7, 2.6 ("The cost of elimination").  Strang [video lecture 3](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-3-multiplication-and-inverse-matrices/) and [video lecture 5](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-5-transposes-permutations-spaces-r-n/).

## Lecture 5 (Feb 21)

* [Transposes notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Transposes.ipynb)

Continued talking about transposes, from lecture 4: relationship to
matrix multiplication, dot products, and LU factorization.  Symmetric
matrices and factorizations (LDLᵀ and Cholesky).

**Further reading:** Textbook, section 2.7. We will return to symmetric positive-definite (SPD) matrices much later in the course; for a preview, see the textbook section 6.5 (it's okay if you don't understand the eigenvalue stuff yet).

## Lecture 6 (Feb 22)

* [pset 2 solutions](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset2/pset2-sol.ipynb), [pset 3](http://nbviewer.jupyter.org/urls/rawgit.com/stevengj/1806-spring17/master/psets/pset3/pset3.ipynb).

* The first exam will be **next week** on Friday March 3 in room 50-340.  It will cover everything through pset 3, up to including the lecture on Monday, February 27.  (It may be a *bit harder* than exams in previous terms, but grading will be adjusted accordingly.)


Introduced vector spaces and subspaces.  Examples of vector spaces include real n-component vectors (ℝⁿ, or ℂⁿ for complex numbers), real m×n matrices, functions f(x) (ℝ↦ℝ, real numbers to real numbers).  Examples of subspaces includes planes or lines through the origin in ℝ³, or the origin itself; polynomial functions; polynomials of degree ≤ 3.

For an m×n matrix A, introduced two important subspaces.

* First, the column space C(A): the set {Ax for all x ∈ ℝⁿ}.  This is the set of *right-hand sides* b such that Ax=b is *solvable*, and is a subspace of ℝᵐ (not ℝⁿ unless m=n!).

* Second, the null space (also called the "kernel") N(A): the set {x such that Ax=0} ⊆ ℝⁿ (i.e., a subspace of ℝⁿ).  Given any solution x to Ax=b, then x+y is also a solution if y ∈ N(A).

These are very important subspaces because they tell us a lot about
the matrix A and solutions to Ax=b.  As a trivial example, if A is an
n×n *invertible* matrix, C(A)=ℝⁿ and N(A)={0}.  Conversely, if A is
the n×n matrix of *all zeros* (the "most singular" matrix), then
C(A)={0} and N(A)=ℝⁿ.  Our goal in the next lectures will be to
understand how C(A) and N(A) relate to each other (and another two
important subspaces) and to the *elimination* process on A.

**Further reading:** Textbook, sections 3.1 and 3.2.

## Lecture 7 (Feb 24)

More on nullspace and column space.  Reviewed the definitions, and the fact that Ax=b is solvable if and only if ("iff") b ∈ C(A).  Given a particular solution xₚ satisfying Axₚ=b, xₚ+x is *also* a solution for any x ∈ N(A).

Showed that N(A) ⊆ N(BA) for any matrix B, and that the two are equal
if B is invertible.  However, C(A) and C(BA) are in general quite
distinct (neither is contained in the other), although they have the
same dimension if B is invertible.  In consequence, elimination steps
(or any other row operations), which correspond to multiplying by
invertible matrices on the left, don't change the nullspace.

Defined a **basis** for a vector space as a minimal set of vectors (we
will later say that they have to be *linearly independent*) whose
**span** (all linear combinations) produces everything in the space.
The **dimension** of a vector space is the number of vectors in a
basis.

Went through a couple of examples of applying elimination to singular
and nonsquare matrices.  Defined the **rank** as the number of (nonzero)
pivots, the reduced row-echelon form R, the pivot columns, and the
free columns.  Showed how we can "read off" a basis for the null space
from R, especially if R is of the typical form [I F].

As a practical matter, computing the null space from R is not very
important.  If a matrix is not full rank, usually you go back to where
the matrix came from and ask what part of the *problem structure* led
to this, and this usually tells you the nullspace -- interesting
nullspaces don't happen by accident.  Actually computing R is very
sensitive to roundoff errors, and it is not a good way to analyze
matrices that are *nearly* singular (e.g. have very small pivots).  A
better computational tool for this is the
[SVD](https://en.wikipedia.org/wiki/Singular_value_decomposition),
which we will look at much later in the course.  However, the
following things *are* useful and important:

* Understanding how the various fundamental subspaces like N(A) and C(A) are *affected by matrix operations*, e.g. elimination or factorization.

* Understanding how the rank r, the size m×n of the matrix, and the dimensions of the subspaces are *related*.

* Understanding how to determine the nullspace etc. for matrices with *special structure*, like R.

**Further reading:** Textbook, sections 3.2-3.5.  OCW video [lecture 6](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-6-column-space-and-nullspace/), [lecture 7](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-7-solving-ax-0-pivot-variables-special-solutions/), [lecture 8](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-8-solving-ax-b-row-reduced-form-r/).

## Lecture 8 (Feb 27)

Reviewed the key ideas for row-reduced echelon form etc from the previous lecture.   Showed that, when solving for the nullspace, given the "free" variables (the variables corresponding to the free columns), the "pivot" variables (the variables corresponding to the pivot columns) are completely determined (hence their names) by writing out the equation in "block" form in terms of the free and pivot variables.

Then put a *nonzero* right-hand side b into Ax=b.  Elimination turns
this into Rx=c (multiplying both sides on the left by elimination
matrices E). If A is m×n and has rank r, then the last m-r rows of R are zero.  Showed that the corresponding rows of c must *also* be zero to have a solution — this gives us a way to test whether b is in C(A).   If there is a solution, we can find a particular solution xₚ by setting the free variables to zero, and then write the complete solution as x=xₚ+xₙ where xₙ is anything in N(A).

Went through four important cases for an m×n matrix A of rank r.  (Note that we must have r ≤ m and n: you can't have more pivots than there are rows or columns.)

1. If r=n, then A has **full column rank**.  We must have m ≥ n (it must be a "tall" matrix), and N(A)={0} (there are no free columns).  Hence, any solution to Ax=b (if it exists at all) must be *unique*.

2. If r=m, then A has **full row rank**.  We must have n ≥ m (it must be a "wide" matrix), and C(A)=ℝᵐ.  Ax=b is *always solvable* (but the solution will not be unique unless m=n).

3. If r=m=n, then A is a square **invertible** matrix.  Ax=b is always solvable and the solution x=A⁻¹b is unique.

4. If r < m and r < n, then A is **rank deficient**.  Solutions to Ax=b may not exist and will not be unique if they do exist.

Cases (1)-(3) are called **full rank**: the rank is as big as possible given the shape of A.  In practice, most matrices that one encounters are full rank (this is essentially always true for *random* matrices).  If the matrix is rank deficient, it usually arises from some special structure of the problem (i.e. you usually want to look at where A came from to help you figure out why it is rank deficient, rather than computing the rank etcetera by mindless calculation).   (A separate problem is that of matrices that are *nearly* rank deficient because the pivots are very small, but the right tools to analyze this case won't come up until near the end of the course).

**End of exam-1 material.**

Started talking about bases, dimension, and independence.   Earlier, I defined a basis as a minimal set of vectors whose span gives an entire vector space, and the dimension of the space as the size of the basis.  Now, we want to think more carefully about the term "minimal".   If we have too many vectors in our basis, the problem is that some of the vectors might be redundant (you can get them from the other basis).  We now rephrase this as saying that such vectors are *linearly dependent*: some linear combination (with nonzero multipliers) of them gives the zero vector, and we want every basis to be *linearly indepenedent*.   Next lecture, we will write this out more carefully and connect it to the nullspace of the matrix whose columns are the basis vectors.

**Further reading:** Textbook sections 3.3–3.4.  Strang video [lecture 8](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-8-solving-ax-b-row-reduced-form-r/) and [lecture 9](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-9-independence-basis-and-dimension/).

## Lecture 9 (Feb 29)

* [pset 3 solutions](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset3/pset3-sol.ipynb), [pset 4](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset4/pset4.ipynb)

Given a set of n vectors {x₁, ⋯, xₙ}, if we matrix a matrix X whose columns
are x₁⋯xₙ, then C(X) is precisely the span of x₁⋯xₙ.   To check whether
the x₁⋯xₙ form a *basis* for C(X), we need to check whether they
are *linearly independent*.  Discussed three equivalent ways to think about
this:

1. We want to make sure that none of x₁⋯xₙ are "redundant": make sure
   that no xⱼ can be made from a linear combination of the other xᵢ's.

2. Equivalently, we don't want any linear combination of x₁⋯xₙ to give
   zero unless all the coefficients are zero.

3. Equivalently, we want N(X) = {0}.

In this way, we reduced the concept of independence to thinking about the
null space.

Exploited this insight in order to determine how elimination on a matrix
A relates to C(A).  Because elimination corresponds to multiplying A on
the left, it changes the column space: C(A) ≠ C(U) ≠ C(R) in general.
However, to find a basis for C(A), what we need to know is which columns
of A are dependent/independent.  From above, showed that some columns
of A are dependent if there is a vector in N(A) that is nonzero only in
components corresponding to those columns.   But since N(A) = N(U) = N(R),
we see an important fact: *columns of A are dependent/independent if and
only if the corresponding columns of R are dependent/independent*.
By looking at R, we can see by inspection that the *pivot columns* form
a maximal set of independent vectors, and hence are a basis for C(R).
Hence, the *pivot columns of A* (i.e. the columns of A corresponding to
the columns of R or U where the pivots appear) are a basis for C(A).

It follows that the dimension of C(A) is exactly rank(A).

However, we are missing two important subspaces, which turn out to be
the **row space** C(Aᵀ) and the **left nullspace** N(Aᵀ).

Since elimination multiplies A on the *left*, it multiplies Aᵀ on the *right*
by an invertible matrix.  Therefore, C(Aᵀ) = C(Rᵀ), and the *pivot rows of
R* are a basis for C(Aᵀ).   More importantly, this tells us a very non-obvious
fact: rank(Aᵀ) = rank(A).   (That is, if you did elimination on Aᵀ, you
would get the *same number of pivots*.)

In summary, for an m×n matrix A of rank r, we find:

* C(A) ⊆ ℝᵐ, dimension r
* N(Aᵀ) ⊆ ℝᵐ, dimension m-r
* C(Aᵀ) ⊆ ℝⁿ, dimension r
* N(A) ⊆ ℝⁿ, dimension n-r

In fact, I claimed (without proof so far) that C(A)+N(Aᵀ)=ℝᵐ and
C(Aᵀ)+N(A)=ℝⁿ, where I define addition S₁+S₂ of subspaces as the
subspace {x₁+x₂ for all x₁∈S₁, x₂∈S₂}.  Certainly, the dimensions
add up to m and n, respectively, which is very suggestive, and next
time we will complete the picture by seeing that the subspaces
are *orthogonal complements*.

**Further reading:** Textbook sections 3.4–3.5; video
[lecture 9](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-9-independence-basis-and-dimension/) and [lecture 10](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-10-the-four-fundamental-subspaces/).

## Exam 1 (March 3)

[Exam 1](https://github.com/stevengj/1806-spring17/blob/master/exams/exam1.pdf)
and [solutions](https://github.com/stevengj/1806-spring17/blob/master/exams/exam1-sol.pdf).

## Lecture 10 (March 6)

Further discussion of subspace addition, showing dim(S₁+S₂)=dim(S₁)+dim(S₂)-dim(S₁∩S₂).

Showed that the matrix subspaces have an *orthogonality* relationship: C(A)⟂N(Aᵀ),
in the sense that every vector in C(A) is orthogonal to every vector in N(Aᵀ).
In consequence, their intersection is {0} (0-dimensional), and C(A)+N(Aᵀ)=ℝᵐ.
Similarly for C(Aᵀ) and N(A).

Equivalently, showed that N(Aᵀ) is the *orthogonal complement* of C(A),
defining the orthogonal complement S<sup>⟂</sup> of a subspace S as
{x such that xᵀy=0 for all y ∈ S}.  Showed explicitly that if y is orthogonal
to every vector in C(A), then y is necessarily in N(Aᵀ) (and vice versa).

This often gives an nice way to check if a vector is in C(A): b is in C(A)
if and only if b is orthogonal to N(Aᵀ) (or to a basis thereof).   Gave
an example where C(A) is a plane in ℝ³, N(Aᵀ) is the line through 0 orthogonal
to that plane, and the equation for b ∈ C(A) was yᵀb=0 for a y ∈ N(Aᵀ).
(Another nice example of a test of this sort can be found in problem 1c of
exam 1, although you probably didn't derive it this way on the exam.)

Wrapped up this section with a few more examples.  Discussed the dimension
and basis for the space of upper-triangular 3×3 matrices and a subspace thereof.
Discussed a basis {1,x,x²,x³,⋯} for the space of polynomial functions p(x): because this
basis is infinite, we say that this vector space is *infinite-dimensional*.
Briefly discussed rank-1 matrices uvᵀ.  (Eventually, with the [SVD](https://en.wikipedia.org/wiki/Singular_value_decomposition),
we will write *every* rank-r matrix as a sum of r rank-1 matrices, and with orthogonal vectors.)

**Further reading:** Textbook section 3.4, end of section 3.5 on rank-1 and rank-2 matrices, 4.1; video [lecture 14](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-14-orthogonal-vectors-and-subspaces/) and [lecture 11](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-11-matrix-spaces-rank-1-small-world-graphs/).

## Lecture 11 (March 8)

* [pset 4 solutions](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset4/pset4-sol.ipynb), [pset 5](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset5/pset5.ipynb)

* [Graphs and networks notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Graphs-Networks.ipynb)

**Further reading:** Textbook section 10.1; video [lecture 14](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-12-graphs-networks-incidence-matrices/).

## Lecture 12 (March 10)

* [Multidimensional Newton’s method notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Multidimensional-Newton.ipynb)

The key point of this lecture is that *linear* algebra can even be used to solve *nonlinear* equations.  There are many methods to convert a nonlinear equation into a *sequence* of *approximate* linear equations whose solutions *converge* to the nonlinear solution.   The most famous is Newton’s method.  You learned the 1d version of Newton’s method in first-year calculus.  The generalization, for *n* nonlinear equations in *n* unknowns, is a sequence of *n*×*n* matrix problems.

**Further reading:** Strang's textbook does not discuss this topic.   [Section 9.6 of Numerical Recipes in C](http://www.it.uom.gr/teaching/linearalgebra/NumericalRecipiesInC/c9-6.pdf) is a decent high-level review.  A somewhat more mathematically sophisticated review can be found in [these lecture notes](http://fabcol.free.fr/pdf/lectnotes5.pdf) by [Fabrice Collard](http://fabcol.free.fr/notes.html) or in these [2014 notes](http://www.math.cmu.edu/CNA/summer_institute/2014/projects/SUAMI_revised_paper.pdf) by Nicolle Eagan.

## Lecture 13 (March 13)

* [Least-square fitting notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Least-Square%20Fitting.ipynb)

Introduced the topic of least-square fitting of data to curves.  As long as the fitting function is linear in the unknown coefficients x, showed that minimizing the sum of the squares of the errors corresponds to minimizing the norm of the residual ‖b-Ax‖.   By straightforward (if somewhat tedious) calculus, found that this corresponds to solving the **normal equations** AᵀAx̂=Aᵀb for the fit coefficients x̂.  And we have enough linear algebra tools now to show that these equations are always solvable (uniquely if A has full column rank).

**Further reading:** Strang, section 4.3, and video [lecture 16](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-16-projection-matrices-and-least-squares/).  (Note that Strang does this in a little bit of a different order: he does orthogonal projection and then fitting, and I do the reverse in order to motivate these techniques with the real-world application of least-square fits.)

## Lecture 14 (March 15)

* [pset 5 solutions](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset5/pset5-sol.ipynb), [pset 6](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset6/pset6.ipynb)

* [Projections notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Projections.ipynb)

Orthogonal projection onto subspaces, and the projection operator.  (Guest lecture by [Prof. Alan Edelman](http://www-math.mit.edu/~edelman/).)

**Further reading:** Strang, section 4.2, and video [lecture 15](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-15-projections-onto-subspaces/).

## Lecture 15 (March 17)

Orthonormal bases, matrices Q with orthonormal columns (QᵀQ = I), orthogonal (a.k.a. unitary) matrices (square Q: Qᵀ = Q⁻¹), Gram-Schmidt orthogonalization, and QR factorization.

**Further reading:** Strang, section 4.4, and video [lecture 17](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-17-orthogonal-matrices-and-gram-schmidt/).

## Lecture 16 (March 20)

* [Orthogonal polynomials](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Orthogonal-Polynomials.ipynb)

* [Fourier sine series](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Sine-series.ipynb)

Using QR to solve the least-squares problem: given A=QR, the normal equations AᵀAx̂=Aᵀb turn into the triangular system of equations Rx̂=Qᵀb.

Key practical facts to keep in mind if you ever need to do least-squares or orthogonal basis for real problems involving data with finite precision:

* Never explicitly form AᵀA or solve the normal equations: it turns out that this greatly exacerbates the sensitivity to numerical errors (in 18.335, you would learn that it squares the [condition number](https://en.wikipedia.org/wiki/Condition_number))  Instead, use the A=QR factorization and solve Rx̂=Qᵀb.  Better yet, just do `A \ b` (in Julia or Matlab) or the equivalent in other languages, which will use a good algorithm.

* Never use Gram–Schmidt, which turns out to be notoriously sensitive to small errors if some vectors are nearly parallel.  There is an improved version called "modified Gram–Schmidt" described in the book, but in practice computers actually use a completely different algorithm called "Householder reflections."  You should just use the built-in `Q,R = qr(A)` function in Julia (or other languages), which will do the right thing most of the time.

This is not unusual: there is often a difference between the way we conceptually *think* about linear algebra and the more sophisticated tricks that are required to make it *work well* on *large matrices* of real data in the presence small numerical errors.

Another wonderful and far-reaching application of these ideas is to realize that the same concepts of orthogonal bases and Gram–Schmidt can be applied to *any* vector space once we define a dot product (giving a so-called [Hilbert space](https://en.wikipedia.org/wiki/Hilbert_space), though we won't use that level of abstraction much in 18.06).  In particular, it turns out to be expecially powerful to think about **orthogonal bases of functions**.  See the notebooks for two examples: orthogonal polynomials called [Legendre polynomials](https://en.wikipedia.org/wiki/Legendre_polynomials) and the [Fourier sine series](https://en.wikipedia.org/wiki/Fourier_sine_and_cosine_series).

**Further reading:** Strang, section 10.5 (Fourier series), these [18.06 sine-series notes](http://web.mit.edu/18.06/www/Spring09/sines.pdf), these [TAMU notes on orthogonal polynomials](http://www.math.tamu.edu/~yvorobet/MATH304-503/Lect4-04web.pdf) and [these 18.06 notes on orthogonal polynomials](http://web.mit.edu/18.06/www/Spring09/legendre.pdf).

## Lecture 17 (March 22)

* [pset 6 solutions](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset6/pset6-sol.ipynb), [pset 7](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset7/pset7.ipynb)

* [Eigenvalue/eigenvector introduction](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Eigenvalue-Intro.ipynb)

Begin by going over the last section of the orthogonal-polynomials notebook from
the last lecture: explain why projecting onto orthogonal polynomials (or any
orthogonal basis of functions, like a Fourier series) can be viewed as
a *least-square fit* of the function with those polynomials.

Start on a new topic: **eigenvalues and eigenvectors**.  I proceed a little
differently from the book, working *backwards* from what we would *like* to
obtain (make matrices **act like scalars**) to *how* we achieve it.

**Further reading:** Strang, section 6.1; video [lecture 21](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-21-eigenvalues-and-eigenvectors/).

## Lecture 18 (March 24)

* [Determinants notebook](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Determinants.ipynb)

Explained determinants and their properties.  Considering how central a role determinants play for the 2×2 and 3×3 matrices you probably encountered before 18.06, you may be surprised that we didn't get to determinants until now.  The fact of the matter is that determinants play a much less important role in applied linear algebra for larger matrices — with a few exceptions, most things that you would want to use determinants for can be done more effectively in other ways.  They are a useful *conceptual* tool, however, especially for thinking about eigenvalues.

**Further reading:** Strang, section 5.1; video [lecture 18](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-18-properties-of-determinants).  We will skip Strang, section 5.2 and 5.3, because the formulas in those sections are nearly useless in applied settings for large matrices, as explained in the notebook.


## Lecture 19 (April 3)

* [Eigenvalues and polynomials](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Eigenvalue-Polynomials.ipynb)

Reviewed eigenvalues, eigenvectors, and diagonalization.

The eigenvalues are the roots of the characteristic polynomial det(A–λI). This
is a good way to *think* about eigenvalue problems (e.g. it tells you immediately
to expect ≤ m eigenvalues, possibly complex, from an m×m matrix).  But it is not
really a good way to compute them except for tiny (e.g. 2×2) matrices.

In fact, it's actually the reverse: one of the best ways to compute roots of
polynomials is to convert the polynomial into a matrix and find the eigenvalues.
Showed how this is done, by constructing the *companion matrix* to a polynomial.

The actual way eigenvalues are computed is a topic for another class (e.g. 18.335);
in 18.06, we will focus mainly on their properties and usage.  The computer
will handle finding them.

Began defining [similar matrices](https://en.wikipedia.org/wiki/Matrix_similarity);
to be continued next lecture.

**Further reading:** Strang, sections 6.1 and 6.2; video [lecture 21](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-21-eigenvalues-and-eigenvectors/) and [lecture 22](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-22-diagonalization-and-powers-of-a/)

## Lecture 20 (April 5)

* [pset 7 solutions](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset7/pset7-sol.ipynb), [pset 8](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset8/pset8.ipynb) (due in **2 weeks**: Wed., April 19).
* [Fibonacci numbers](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Fibonacci.ipynb)

Defined [similar matrices](https://en.wikipedia.org/wiki/Matrix_similarity) B=M⁻¹AM, and showed that similar matrices have the same *eigenvalues* (with eigenvectors related by a factor of M), the same *determinant*, the same *characteristic polynomial*, and the same *trace*.  Defined the [trace](https://en.wikipedia.org/wiki/Trace_(linear_algebra)) of a matrix tr(A),
and showed tr(AB)=tr(BA) for any m×n matrix A and n×m matrix B.  (Similar matrices essentially
represent the same linear operation in a different coordinate system.)  In hindsight, we
now see that a diagonalizable matrix A is *similar to a diagonal matrix Λ*.  Hence, we
see that det(A) is the *product* of the eigenvalues and tr(A) is the *sum* of the eigenvalues.
For a 2×2 matrix, it follows that det(A-λI)=λ²-λtr(A)+det(A), which is a useful formula when solving 2×2 eigenproblems.

Showed that A and Aᵀ have the same eigenvalues and the same characteristic polynomial; we already know that they have the same determinant, and it is obvious that they have the same trace.  (In fact, A and Aᵀ are similar, but I didn't show this.)

Reviewed matrix powers for a diagonalizable A=XΛX⁻¹: Aⁿ=XΛⁿX⁻¹.  That is, to multiply Aⁿx, we first decompose x into the basis of eigenvectors (with coefficients c=X⁻¹x), then multiply each eigenvector by λⁿ, and then sum.
If any eigenvalues λ have |λ|>1, then that eigenvector's length will diverge as n⟶∞.  For eigenvalues with |λ|<1, those eigenvectors lengths will ⟶0 as n⟶∞.  Therefore, by looking at the eigenvalues, we can tell whether Aⁿx will blow up or decay to zero for a typical x (where all of the eigenvector coefficients are nonzero).

As an application of matrix powers, considered the famous [Fibonacci numbers](https://en.wikipedia.org/wiki/Fibonacci_number) 1,1,2,3,5,8,13,21,….  The n-th Fibonacci number fₙ satisfies the [linear recurrence relation](http://mathworld.wolfram.com/LinearRecurrenceEquation.html) fₙ=fₙ₋₁+fₙ₋₂, which we can express in terms of multiplication by a 2×2 matrix F that gives (fₙ,fₙ₋₁) from (fₙ₋₁,fₙ₋₂).  We found that the eigenvalues of F are (1±√5)/2.  The larger of these eigenvalues, (1+√5)/2≈1.618, is the so-called [golden ratio](https://en.wikipedia.org/wiki/Golden_ratio), and it means that the Fibonacci numbers blow up exponentially fast for large n.  Furthermore, we showed that the *ratio* fₙ/fₙ₋₁ of successive Fibonacci numbers goes to the golden ratio for large n.   Checked these facts numerically with a Julia notebook.

**Further reading:** Strang, sections 6.2 and 6.6; video [lecture 22](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-22-diagonalization-and-powers-of-a/) and [lecture 28](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-28-similar-matrices-and-jordan-form/).

## Lecture 21 (April 6)

* [Markov matrices](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Markov.ipynb)
* [Analyzing Chutes & Ladders](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Chutes-and-Ladders.ipynb)

[Markov matrices](https://en.wikipedia.org/wiki/Stochastic_matrix) and eigenvalues.

**Further reading:** Strang, section 8.3 and video [lecture 24](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-24-markov-matrices-fourier-series/).

## Exam 2 (April 11)

[Exam 2](https://github.com/stevengj/1806-spring17/blob/master/exams/exam2.pdf)
and [solutions](https://github.com/stevengj/1806-spring17/blob/master/exams/exam2-sol.pdf).

## Lecture 22 (April 13)

* [Power method](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Power-Method.ipynb)
* [Ordinary differential equations (ODEs)](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/ODEs.ipynb).

Discussed how multiplying by a matrix repeatedly is actually a starting point
for many practical algorithms to compute eigenvectors and eigenvalues: the most
basic version of this is known as the power method.

We can now solve systems of ODEs dx/dt = Ax in terms of eigenvectors and eigenvalues.
Each eigenvector is multiplied by exp(λt) (where exp(x)=eˣ), so that solutions decay
if the eigenvalues have *negative real parts* (and approach a nonzero steady state
if one eigenvalue is *zero*).  We will also express this in terms of a new
Matrix operation eᴬᵗ, the [matrix exponential](https://en.wikipedia.org/wiki/Matrix_exponential).

**Further reading:** Strang, section 6.3 and video [lecture 23](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-23-differential-equations-and-exp-at/).

## Lecture 23 (April 14)

* [Oscillating ODE solutions: Masses and springs](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/ODEs.ipynb).
* [Matrix exponentials eᴬ](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Matrix-Exponentials.ipynb).

Continued discussion of ODEs from last lecture, focusing now on oscillating solutions and complex eigenvalues λ (see notebook).   Then reformulated the solution of dx/dt=Ax in terms of the [matrix exponential](https://en.wikipedia.org/wiki/Matrix_exponential) eᴬᵗ, and discussed the properties of this fascinating and important matrix operation.

**Further reading:** Strang, section 6.3 and video [lecture 23](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-23-differential-equations-and-exp-at/).

# Lecture 23 (April 19)

* [pset 8 solutions](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset8/pset8-sol.ipynb), [pset 9](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset9/pset9.ipynb)

Finished matrix-exponential notes from lecture 23.

Began discussing **symmetric matrices**.  A real-symmetric matrix A
(i.e. a real A where A = Aᵀ), has three key properties:

* All the eigenvalues λ are **real**.  (It follows that the eigenvectors are real too.)
* Eigenvalues for different λ are **orthogonal** (and hence eigenvectors can be chosen to be **orthonormal**).
* The matrix is always **diagonalizable** (no funny defective case).

This is extremely important.  Just by looking at the *structure* of such a matrix,
we learn a lot.   And symmetric matrices come up in lots of physics and engineering
applications (e.g. we already saw the symmetric matrix AYAᵀ in circuit problems),
and the properties above are often intimately related to crucial physical facts.

**Further reading:** Strang, sections 6.3–6.4 and video [lecture 23](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-23-differential-equations-and-exp-at/) and [lecture 25](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-25-symmetric-matrices-and-positive-definiteness/).

# Lecture 24 (April 21)

## Complex matrices, vectors, and dot products: the adjoint H

To prove the facts claimed about symmetric matrices from last lecture, we need
to generalize our notion of a "dot product" to complex vectors.  The "transpose"
is actually not the right notion here.  Instead, we define:

* xᴴ and Aᴴ are the **conjugate-transpose** of a vector or matrix (that is, you transpose and then take the complex conjugate of every element).  This is also called the [adjoint](https://en.wikipedia.org/wiki/Conjugate_transpose) operation.  *For a real matrix, the adjoint is the same as the transpose.*

For complex vectors, the dot product x⋅y is xᴴy, *not* xᵀy.   And the length
of a vector ‖x‖² = x⋅x = xᴴx.  Defined this way, it has the key property:

* ‖x‖² = x⋅x = ∑ᵢ|xᵢ|² ≥ 0, and = 0 only for x=0.

If you look back at 18.06 and you change our real vectors to complex vectors, just
change every transpose to an adjoint.  This includes for Gram-Schmidt and orthonormal
bases!   And if you look back at 18.06 and change real matrices to complex matrices,
again the right thing is to *change every transpose (T) to adjoint (H)*:

* The normal equations for minimizing ‖Ax-b‖ are AᴴAx̂=Aᴴb.
* If the columns of Q are orthonormal, then QᴴQ = I.
* The projection matrix onto C(A) is A(AᴴA)⁻¹Aᴴ
* The left nullspace is N(Aᴴ) ⟂ C(A), and N(A) ⟂ C(Aᴴ).
* A square matrix Q with orthonormal columns (Q⁻¹=Qᴴ) is called **unitary**.  (Formerly "orthogonal".)
* If A=Aᴴ, the matrix is called **Hermitian**.

Again, for real matrices/vectors, the adjoint = the transpose, so everything
we've done before is just a special case of the complex case with zero imaginary parts.

## Hermitian and real-symmetric matrices

Now, given a Hermitian matrix A=Aᴴ (= real-symmetric if A is real), we can
easily prove that the eigenvalues are real.  Given an eigensolution Ax=λx, we
just took the dot products of both sides with x:

: xᴴAx=λxᴴx=(Aᴴx)ᴴx=(Ax)ᴴx=(λx)ᴴx=λ̄xᴴx

Since x≠0 for any eigenvector, we have xᴴx>0 and can divide by it to obtain
λ=λ̄, which means that **λ is real**.  (It follows that the eigenvector x is also real *if*
the matrix A is real-symmetric.)

Similarly, given two eigensolutions Ax₁=λ₁x₁ and Ax₂=λ₂x₂ with λ₁≠λ₂, we
can take the dot product x₁ᴴAx₂=λ₂x₁ᴴx₂=⋯, and after a couple of lines
we immediately found x₁ᴴx₂=0.  The **eigenvectors are orthogonal**, and
they can be chosen (scaled) to be **orthonormal**.

I didn't prove diagonalizability, but gave a hand-waving argument for why this must be the case.
(There are various proofs you can easily find online.  See e.g. [this video](https://www.youtube.com/watch?v=_2gGqEGA_IY) if you are curious, but
they seem slightly too tricky for 18.06.)

Since a **Hermitian matrix has an orthonormal basis of eigenvectors**, we
can call the eigenvectors q₁,q₂,⋯, and put them as the columns of a
**unitary** matrix Q (= orthogonal if A is real).  (Formerly, we called this X.)
We can write:

: A = QΛQᴴ = ∑ₖ λₖqₖqₖᴴ

Equivalently, to **expand an arbitrary vector x** in the eigenvector basis,
we **just need to take dot products**.   Formerly, to write x=∑ₖcₖxₖ, to find
the coefficients c we had to solve Xx=x, or c=X⁻¹x.   Now, to write x=∑ₖcₖqₖ,
the coefficients are just **cₖ=qₖᴴx**, or x=∑ₖqₖ(qₖᴴx).  *Expressing a vector
in an orthonormal basis is easy.*

Gave some examples of how you could use this to more easily understand
e.g. solving dx/dt=Ax if A is Hermitian (or real-symmetric).

## Positive-definite matrices

A lot of Hermitian matrices in practice come in the form BᴴB (or BᵀB for real B)
for some matrix B.  e.g. we have seen several of these already, in least-squares
and circuit/graph problems.   Such matrices are not only Hermitian, but they
are **positive-definite**.

In particular, a positive-definite matrix A is a Hermitian matrix A=Aᴴ that
*additionally* has the following *equivalent* properties:

* All eigenvalues λ of A are > 0.
* xᴴAx > 0 for *any* vector x≠0.
* A = BᴴB for some full-column-rank matrix B
* All the pivots are > 0 in Gaussian elimination of A.

These are all *equivalent*: any one of these properties implies *all* of
the other properties for a Hermitian A.   I proved a couple of the equivalencies,
but not all; some more equivalencies are proved in the textbook.

A positive **semidefinite** matrix is almost the same, except you replace
"> 0" with "≥ 0", and A = BᴴB is positive semidefinite for *any* B (not necessarily full rank).

(There are also "negative definite" and "negative semidefinite" matrices, which
are the same things except with the opposites signs, i.e. "< 0" or "≤ 0" above.)

**Further reading:** Strang, sections 6.4–6.5, 9.2, and video [lecture 25](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-25-symmetric-matrices-and-positive-definiteness/) and [lecture 26](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-26-complex-matrices-fast-fourier-transform/).

# Lecture 25 (April 24)

* [SVD](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/SVD.ipynb)

Guest lecture by Prof. Alan Edelman on the **singular value decomposition** (SVD), with application to image processing.

**Further reading:** Strang, sections 7.1–7.2, and video [lecture 29](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-29-singular-value-decomposition/)

# Lecture 26 (April 26)

* [pset 9 solutions](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset9/pset9-sol.ipynb), [pset 10](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset10/pset10.ipynb)

As an application of real-symmetric and positive-definite matrices, I returned
to the system of masses and springs from lecture 23, but this time I considered
n masses m and n+1 springs.   I showed that Newton's laws take the form:

* mẍ = -DᵀKDx ⟹ ẍ = -Ax, where D is an incidence matrix, K is a diagonal matrix of spring constants, and A=DᵀWD where W=K/m.

A is obviously real-symmetric, so its eigenvalues λ are real.  With a little more work, we saw that it must be positive-definite.  In particular, take any eigensolution Ax=λx for x≠0.  We showed that xᵀAx=λxᵀx>0, which implies λ>0.  The reason is that xᵀAx=xᵀDᵀWDx=(Dx)ᵀWDx=yᵀWy where y=Dx, and (i) y≠0 since D is full column rank (Dᵀ is upper triangular so we could just "read off" its rank), and (ii) W is a diagonal matrix of positive entries so it is automatically positive-definite, or alternatively we can just write out yᵀWy and see that it is positive for y≠0.

The fact that A is positive definite allowed us to derive that *any* such system of masses and springs has *orthogonal oscillating solutions* called the [normal modes](https://en.wikipedia.org/wiki/Normal_mode). In particular, given the eigenvectors qⱼ (chosen orthonormal), satisfying Aqⱼ=λⱼqⱼ with λⱼ>0, we expanded the solution x(t)=∑ⱼcⱼqⱼ in the basis of these eigenvectors.  For each eigenvector component, the matrix A acts just like a number λ, allowing us to easily solve the equation c̈ⱼ=-λⱼcⱼ to get sines and cosines, and hence to get the general solution:

* x(t) = ∑ⱼ [αⱼ cos(ωⱼt) + βⱼ sin(ωⱼt)] qⱼ

where ωⱼ=√λⱼ, and αⱼ and βⱼ are determined from the initial conditions x(0) and ẋ(0).

The key point is that the **structure** of the problem told us that λⱼ>0 and
hence that the **frequencies** ωⱼ are **real** numbers.  (If they were complex, we would have exponentially growing or decaying solutions, which would make no physical sense for a system of lossless springs and masses.)  The moral of this story is that Hermitian and definite matrices don't just fall down out of the sky, they arise from how the matrix was constructed, and that these matrix properties are often the key to understanding the physical properties of real problems.

Finally, for fun, I pointed out that essentially the same structure A=DᵀWD arises for *two-dimensional grids of springs and masses*.  D is still the incidence matrix, just for a more complicated graph, and W is still a diagonal matrix of spring constants divided by masses.   I showed some example eigenfunctions from various such grids, which can be thought of as the **oscillating modes of a drum** (stretched membrane).

**Further reading:** Strang, section 10.2.  See also [these notes on the springs-and-masses problem](http://math.mit.edu/~stevenj/18.303/lecture-5.5.pdf) from [18.303](http://math.mit.edu/~stevenj/18.303/) (you can ignore the last two pages, which go beyond 18.06, and ignore the Δx factor which is used in 18.303 to connect the discrete problem to a continuous problem).  My vibrating-drum examples were taken from this [18.303 notebook](http://nbviewer.jupyter.org/url/math.mit.edu/~stevenj/18.303/min-max-examples.ipynb),
but the math in that notebook is focused on another topic that may be a bit hard to follow for 18.06 students.

# Lecture 27 (April 28)

Examined the analogues of Hermitian positive-definite matrices, matrix exponentials, etcetera, for *infinite-dimensional* linear algebra.  (This material will *not* be on any exam.)   It turns out that this is tremendously important for understanding [partial differential equations (PDEs)](https://en.wikipedia.org/wiki/Partial_differential_equation) arising in science and engineering.

Earlier in the class, we already saw how we can define infinite-dimensional vector spaces of functions, "dot products" of functions via integrals, and hence orthogonal bases of functions, projection, etcetera.  Now, we look at linear operators on functions, and in particular I looked at A=-d²/dx² acting on functions u(x)
over a [domain Ω](https://en.wikipedia.org/wiki/Domain_of_a_function) = [0,L], i.e. functions for 0 ≤ x ≤ L, with the [boundary condition](https://en.wikipedia.org/wiki/Dirichlet_boundary_condition) u(0)=u(L)=0.

First, we looked at the eigenfunctions, satisfying Au=λu.  These are easy to find: uₙ(x)=sin(nπx/L) for n=1,2,3,…, with eigenvalues λₙ=(nπ/L)².   Notice that the eigenvalues are real and positive.  And the
eigenfunctions are none other than our "Fourier sine series" basis functions, way back from lecture 16, which are orthogonal under the dot product u⋅v=∫ūv.   So, it looks much like a real-symmetric positive-definite eigenproblem!  But in what sense can we say "Aᵀ=A" when A is a derivative?

The key property of a transpose is not that it swaps rows and columns, but rather that (Aᵀx)⋅y=x⋅(Ay) for any real vectors x and y, and a real-symmetric matrix has (Ax)⋅y=x⋅(Ay).   In fact, we can use this as the *definition* of the "transpose" for any vector space with a dot product: Aᵀ is defined as the operator that makes (Aᵀu)⋅v=u⋅(Av) for any u,v.    If we apply that to A=-d²/dx², we have u⋅(Av)=∫ūv″, and "transposing" A means [integrating by parts](https://en.wikipedia.org/wiki/Integration_by_parts) to make the derivatives act on u instead of v.   Integrating by parts twice, and applying the boundary conditions u(0)=u(L)=0=v(0)=v(L) from our function space, we find that (Au)⋅v=u⋅(Av): **A=-d²/dx² is a real-symmetric operator**.

I then showed how the fact that λ is real and the eigenfunctions are orthogonal follows — in fact, the proof is essentially identical to the proof for matrices.   Furthermore, if we integrate by parts only once, we saw that u⋅Au=∫|u′|²≥0, and =0 only if u=0, so A is positive definite, and the proof that λ>0 is the same as before.

Furthermore, just as we solved dx/dt = Ax by eᴬᵗx(0) and interpreted this as multiplying each eigenvector by exp(λt), we can similarly solve the partial differential equation ∂u/∂t=∂²u/∂x² (the [diffusion equation](https://en.wikipedia.org/wiki/Diffusion_equation)) as multiplying u(x,0) by the operator exponential exp(t ∂²/∂x²).  This seems horrible until we realize that it again just multiplies each eigenfunction by exp(λt).  For the same boundary conditions as above, ∂²/∂x² is just a sign flip and hence is *negative definite*: its eigenvalues λₙ=-(nπ/L)² are real and < 0, and its eigenfunctions uₙ(x)=sin(nπx/L) are orthogonal.   So, if we expand the initial condition in the uₙ basis (a Fourier sine series), then each term is just multiplied by exp(λₙt) to get the solution u(x,t).  This is **exponentially decaying** because the eigenvalues are negative.  Similarly, if we solve ü=∂²u/∂t²=∂²u/∂x² (the [wave equation](https://en.wikipedia.org/wiki/Wave_equation)), it is essentially the same as ẍ=-Ax from the previous mass-and-spring lecture: the solutions are **oscillating** with real frequencies ω=√λ because the eigenvalues λ of -∂²/∂x² are > 0.

The wonderful thing about this approach is that it allows us to derive real λ>0 and orthogonal eigenfunctions even in cases that we can't solve.  e.g. a slight variation is to consider the operator Bu=-(cu′)′ for some given real function c(x)>0.  In this case, we can't find the eigenfunctions or eigenvalues analytically for most c(x), but essentially the same derivation again shows B=Bᵀ and positive-definite, so we know that the eigenvalues are real and positive and the eigenfunctions are orthogonal (an orthogonal basis).  In a diffusion equation u̇=(cu′)′, the function c(x) represents a variable "diffusivity" (or thermal conductivity) representing how easy it is to diffuse in different materials.  Even though we can no longer solve this problem analytically, we *still* know it has decaying solutions.  Or, in a wave equation ü=(cu′)′, the function c(x) could represent a variable "springiness" at different points in space (different materials), and we *still* know it has *oscillating* solutions.   This is an extremely powerful way to understand PDEs (which usually cannot be solved in closed form) by looking at their *structure*.

**Further reading**:  Linear algebra applied to functions and PDEs can be found in [18.303](http://math.mit.edu/~stevenj/18.303/), 18.101 (functional analysis), and many other courses (e.g. quantum mechanics 8.04+ is taught this way).   See also my [notes on Hermitian operators for 18.06 from Fall 2007](http://web.mit.edu/18.06/www/Fall07/operators.pdf) which gives an informal introduction similar to my presentation in class.  Strang's book [Computational Science and Engineering](http://math.mit.edu/~gs/cse/) gives a more computational viewpoint on this subject.  The linear-algebra approach to the 1d case of functions u(x) and second-derivative operators is often called [Sturm–Liouville theory](https://en.wikipedia.org/wiki/Sturm%E2%80%93Liouville_theory), but nowadays people apply similar concepts to more complicated operators in higher dimensions.  Scientist and engineers usually adopt an informal approach to this subject, whereas a rigorous approach is much more tricky and requires the spaces of allowed functions and operators to be carefully circumscribed, leading to the topic of [functional analysis](https://en.wikipedia.org/wiki/Functional_analysis).

# Lecture 28 (May 1)

* [Statistics and PCA](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Statistics-and-PCA.ipynb)

* [Eigen-walker demo](https://www.biomotionlab.ca/Demos/BMLwalker.html)

Discussed the relationship of mean, variance, and covariance/correlation to linear algebra, expressing them in terms of dot products and projections.  Given an m×n matrix A whose rows are a bunch of different datasets, with the means subtracted, defined the covariance matrix S=AAᵀ/(n-1).   The eigenvectors of S define a coordinate system of *uncorrelated variables*, with the eigenvalues λ=σ² being the variances in each uncorrelated direction.   This is called **principal components analysis** in statistics, and allows us to identify the *uncorrelated variables that are responsible for most of the variation* (biggest σ²) in the data.

Showed that PCA is exactly what the SVD of A gives us.  The left singular vectors of A are precisely the orthonormal eigenvectors of AAᵀ, and the singular values σ are precisely the square roots of the variances (if you normalize correctly).

Gave some examples (see notebook), and closed with the [eigen-walker data](http://blogs.mathworks.com/cleve/2016/04/11/the-eigenwalker-model-of-the-human-gait/): PCA from a real experiment measuring human gaits, resulting in the cool animation of the singular vectors linked above.

**Further reading**: Strang book, sections 7.3, 12.1, 12.2.  Googling "principal components analysis" or looking it up in any applied-statistics textbook will give you a lot more detail and examples.

# Lecture 29 (May 3): Exam 3 Review

* [pset 10 solutions](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset10/pset10-sol.ipynb), [pset 11](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset11/pset11.ipynb).

# Exam 3 (Friday, May 5 in 50-340)

* Practice problems: [Fall 2007 exam 3](http://web.mit.edu/18.06/www/Fall07/examsF07.html); [Spring 2009 exam 3](http://web.mit.edu/18.06/www/Spring09/examsS09.html); [Spring 2014 exam 3, problem 2](http://web.mit.edu/18.06/www/Spring14/oldS14.html); [Fall 2013 exam 3, problems 2–3](http://web.mit.edu/18.06/www/Fall13/oldF13.html); [Fall 2012 exam 3, problem 1](http://web.mit.edu/18.06/www/Fall12/oldF12.html); [Spring 2012 exam 3, problems 1, 3a, 3b](http://web.mit.edu/18.06/www/Spring12/oldS12.html); [Fall 2011 exam 3, problems 1.1, 1.2, 3](http://web.mit.edu/18.06/www/Fall11/oldF11.html)

* [Exam 3](exams/exam3.pdf) and [solutions](exams/exam3-sol.pdf).

The primary focus of exam 3 will be eigenvectors and eigenvalues and related issues: relationship to polynomial roots, similar matrices, diagonalization, markov matrices, matrix powers and the power method, ODEs and matrix exponentials, Hermitian/real-symmetric matrices, positive-definite matrices, complex matrices (H vs T).

Of course, 18.06 is cumulative, so it is still fair to ask questions on material from earlier in the course.  For example, Hermitian matrices lead to orthonormal eigenvectors, which relates to earlier material on orthogonal/unitary matrices and projections.  Or I could ask about eigenvalues of triangular, orthogonal, or projection matrices, for example.

*Not* on the exam: SVDs, non-diagonalizable (defective) matrices.

# Lecture 30 (May 8)

* [Notes on Jordan vectors](lectures/jordan-vectors.pdf)

Most matrices are diagonalizable.  (*Any* n×n matrix with n distinct eigenvalues is diagonalizable, as is *any* Hermitian A=Aᴴ, unitary A⁻¹=Aᴴ, or anti-Hermitian A=-Aᴴ matrix.)  Non-diagonalizable matrices in practical situations typically arise only by design: you start with a "non-normal" matrix and play with the entries until you *force* two eigenvalues and eigenvectors to coincide.  This does not mean that such "exceptional" or "defective" cases are not interesting, however!   Even more commonly, on encounters a matrix that is *nearly* defective (i.e. the matrix X of eigenvectors is *nearly singular*).

To understand what happens with defective matrices, I introduce Jordan vectors (also called [generalized eigenvectors](https://en.wikipedia.org/wiki/Generalized_eigenvector) and Jordan chains.  I don't focus on formal proofs of the *existence* of these chains and the theoretical construct of the "Jordan form" of a matrix.  Instead, I want to explore their *consequences* for the Aⁿx and dx/dt=Ax types of problems that we have spent a lot of time on.  We show that, for a defective A, Aⁿx gives an extra term that grows as n×λⁿ, not just λⁿ!  And dx/dt=Ax gives an extra term that grows as t×exp(λt), not just exp(λt).

**Further reading**: Strang book, section 8.3.  Going far beyond 18.06, there is a wonderful book, *Spectra and Pseudospectra* by Trefethen and Embree, entirely devoted to cases where diagonalization fails (or nearly fails). One of my former UROP students, Felipe Hernández, just posted a [paper on computational algorithms](https://arxiv.org/abs/1704.05837) for Jordan vectors of large-scale (10000×10000 or bigger) defective matrices arising in physics, which grew out of his final project in 18.335.

# Lecture 31 (May 10)

* [Dense and sparse linear algebra](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Dense-and-Sparse.ipynb)

Large-scale linear algebra: the computational techniques (but not the *conceptual approaches*) of linear algebra completely change when one looks at large-scale matrix problems (100000×100000 or more).  There, the focus turns to exploiting matrix **sparsity** (matrices that are mostly zero) and other structures that let you multiply matrices by vectors quickly (and let you avoid storing the whole matrix).

This material will not be on the final exam, but is still very useful for practical applications of linear algebra!

**Further reading**: Textbook, section 11.3 has some discussion of iterative methods.  More advanced treatments include the book *Numerical Linear Algebra* by Trefethen and Bao, and surveys of algorithms can be found in the *Templates* books for [Ax=b](http://www.netlib.org/linalg/html_templates/Templates.html) and [Ax=λx](http://web.cs.ucdavis.edu/~bai/ET/contents.html).  Sparse-direct solvers are described in detail by the book *Direct Methods for Sparse Linear Systems* by Davis.

# Lecture 32 (May 12)

* [pset 11 solutions](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/psets/pset11/pset11-sol.ipynb).  (This was the last pset.)

* [Circulant matrices](http://nbviewer.jupyter.org/github/stevengj/1806-spring17/blob/master/lectures/Circulant-Matrices.ipynb)

In this lecture, I want to introduce you to a new type of matrix: circulant matrices. Like Hermitian matrices, they have orthonormal eigenvectors, but unlike Hermitian matrices we know exactly what their eigenvectors are! Moreover, their eigenvectors are closely related to the famous Fourier transform and Fourier series. Even more importantly, it turns out that circulant matrices and the eigenvectors lend themselves to incredibly efficient algorithms called FFTs, that play a central role in much of computational science and engineering.

**Further reading**: The textbook, sections 8.3 and 9.3, has some basic information on these topics.  The Wikipedia articles on [Circulant matrix](https://en.wikipedia.org/wiki/Circulant_matrix), [discrete Fourier transform](https://en.wikipedia.org/wiki/Discrete_Fourier_transform), and [fast Fourier transform](https://en.wikipedia.org/wiki/Fast_Fourier_transform) aren't too bad.  Some [elementary lecture notes on FFTs](https://math.mit.edu/~stevenj/18.335/fft-iap3.pdf) from 18.095 talk more about the algorithms.

# Lecture 33 (May 15)

Guest lecture, Gil Strang: why columns-times-rows is a good way to look at matrix multiplication AB, and how it relates to the factorizations from 18.06.  See Prof. Strang's notes: [Multiplying and factoring matrices](http://mth1007.mathappl.polymtl.ca/MultFactMatrStrang.pdf).


# Final Exam (May 23, Johnson Ice Rink, 9am–noon)

The final exam will cover all of the topics of exams 1–3, plus SVDs and defective matrices (Jordan vectors etc.).

* **Potential topics:** matrix multiplication (from multiple viewpoints), elimination, LU, scaling/complexity (n³ etc), inverses, singular matrices, permutations, transposes & dot products, vector spaces/subspaces, 4 fundamental subspaces, rank, rank-1 matrices uvᵀ, basis/independence/dimension, rref form, orthogonality/complements/orthonormal, Gram–Schmidt & QR, projections, orthogonal functions, least-square fitting and minimizing ‖Ax-b‖ (= projection), the normal equations and QR, graphs/networks, determinants, eigenvectors and eigenvalues and related issues (relationship to polynomial roots, similar matrices, diagonalization, markov matrices, matrix powers and the power method, ODEs and matrix exponentials, Hermitian/real-symmetric matrices, positive-definite matrices), complex matrices (H vs T), SVDs and PCA, defective matrices and Jordan vectors (mainly: what does a defective matrix do in Aⁿ, eᴬ, etc., relationship to repeated roots, types of matrices that cannot be defective).

Obviously, a single exam won't be able to cover everything, but any of these topics *might* be on the final.  Some useful practice problems from previous exams are:

* [2016 ASE](exams/2016-ase.pdf) and [solutions](exams/2016-ase-sol.pdf); [spring 2009 final](http://web.mit.edu/18.06/www/Spring09/final-s09.pdf) and [solutions](http://web.mit.edu/18.06/www/Spring09/final-s09-soln.pdf); [fall 2007 practice final](http://web.mit.edu/18.06/www/Fall07/practicefinal-sol.pdf); [fall 2015 final](http://web.mit.edu/18.06/www/Fall15/FinalSols.pdf), problems 1,4,5,7; [spring 2013 final](http://web.mit.edu/18.06/www/Spring13/Examfblank.pdf) and [solutions](http://web.mit.edu/18.06/www/Spring13/final_s13_sol.pdf), problems 3,4,5,7; [spring 2007](http://web.mit.edu/18.06/www/Spring07/final.pdf) problems 1–5.

Finally, a tip: **think about the shapes of matrices/vectors when you do linear algebra**.   If you write down an equation involving "vector × vector" or "matrix × matrix = vector", or "column vector × row vector = number" (really, column × row = rank-1 matrix!), or something similar where the shapes don't match up, **stop!**.  If you write down an operation that doesn't make sense, you are just digging a hole for yourself.
