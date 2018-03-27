# Fall 2018 [18.06](https://web.mit.edu/18.06/www/) Lecture Summaries <br>
 [Prof. Alan Edelman](http://math.mit.edu/~edelman)  

This document is a *brief* summary of what was covered in each 18.06
lecture, along with links and suggestions for further reading.  It is
*not* a good substitute for attending lecture, but may provide a
useful study guide.

(You can also look at the analogous summaries from [Fall 2017](https://github.com/stevengj/1806/blob/fall17/summaries.md).)

I'll try to update it within a day of each lecture.

## Lecture 1 (Feb 7)


[Overview](https://github.com/stevengj/1806/blob/master/lectures/1806overview.pdf)

[Gaussian Elimination](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Gaussian-elimination.ipynb)


[Machine Learning with Gaussian Elimination](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Machine-Learning-with-Gaussian-elimination.ipynb)

[PSET 1](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/Pset1%20Spring2018%20Prof.Edelman.ipynb)  .

**Further reading:** Textbook sections 2.1 and 2.2.  Strang [lecture 2 video](https://www.youtube.com/watch?v=QVKj3LADCnA).

In the first lecture, we perform Gaussian elimination the "high school" way, by putting A next to b and
performing row operations.  In the next lecture we will move into a more matrix computation view by bringing
in Elimination matrices.  At the end of the notebook above I did a little machine learning experiment where
Gaussian elimination accurately finds the unknown parameters in a 3-vector w right away with one backslash, while traditional
machine learning can take a long time.  I'm not sure if traditional machine learning can be improved, but
if any of you try running another software library and see better results, I'd be very interested.




As I'm sure you know, the world needs creative people who understand concepts and how to use them.  This course  does not emphasize hand computation like the old days.


## Lecture 2 (Feb 9)
* [Matrix-multiplication and LU notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Matrix-mult-perspectives.ipynb)

The big message: the matmul you learned in high school is not the only, perhaps not even the best perspective on how to multiply matrices.  There are many other ways.  There are really two key facts that are important

1. All the elementwise viewpoints can be reordered.  Matmul has that kind of "symmetry."
2. It may be better to view a matrix as a collection of columns or rows or blocks or just as a whole.

You should understand all the views.  The column view.  The row view.  The outer product view.  The block matrix view.  You should unerstand why all 6 "ijk" choices are equally correct ways to multiply matrices.

**Further reading:** Textbook sections 2.3, 2.4, 2.6.  Strang [lecture 1 video](https://www.youtube.com/watch?v=ZK3O402wf1c), [lecture 4 video](https://www.youtube.com/watch?v=5hO3MrzPa0A).




## Optional Julia Tutorial (Friday Feb 9, 5pm, 32-141)

On **Friday** at 5pm, there will be an optional tutorial session in 32-141
for the [Julia](http://julialang.org/) computer software that we will be using in 18.06 this
semester for homework and lecture demonstrations. Julia is a
programming language, but no "real" programming will be required in 18.06: we
will just be using it as a "fancy calculator" that happens to have
lots of linear algebra and other capabilities. The tutorial session is
optional; for the homework, we will mostly just give you code and tell
you to run it, perhaps with minor tweaks, in order to perform
computational experiments.  Bring your laptops, and try logging into
[juliabox.com](https://juliabox.com) beforehand.  More information:

* [Instructions/links for using Julia](https://github.com/stevengj/julia-mit/)
* [Overview slides](https://github.com/stevengj/1806/blob/master/julia/Julia-intro.pdf)
* [Julia cheatsheet](https://github.com/stevengj/1806/blob/master/julia/Julia-cheatsheet.pdf)
* [Tutorial notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/julia/tutorial.ipynb)

## Lecture 3 (Feb 12)

* [Elimination Matrices](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Elimination-matrices.ipynb)

* [LU and matrix-inverse notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Inverses-LU-intro.ipynb)

* [Lower-Triangular-and-Elimination](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Lower-Triangular-and-Elimination.ipynb)


Key Points to consider

* How the L matrix entries are just the multipliers from Gaussian elimination
* How in practice, one rarely "augments" the matrix with the right-hand side like in the old paper and pencil textbooks.  Instead, you compute A=LU, substitute this into Ax=b=LUx, let c=Ux, solve Lc=b, then solve Ux=c.  In particular, solving Lc=b is *exactly* the same as performing the Gaussian-elimination steps on c.
* Given A=LU, you can efficiently solve multiple right-hand sides, or equivalently the matrix equation AX=B.
* How row swaps lead to the factorization PA=LU: in practice, the computer *always* does row swaps, and always gives you a permutation matrix P (or its equivalent).
* Singular matrices = zero pivots (that can't be eliminated by row swaps) = no solutions or infinitely many solutions.


**Further reading:** Textbook sections 2.6, , 2.5.  Strang [lecture 4 video](https://www.youtube.com/watch?v=5hO3MrzPa0A) and [lecture 5 video](https://www.youtube.com/watch?v=JibVXBElKL0&list=PL49CF3715CB9EF31D).


## Lecture 4 (Feb 14)

[PSET 2](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/Pset2%20Spring2018%20Prof.Edelman.ipynb)  . <br>
[Solutions to PSET 1](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/Pset1%20Solutions.ipynb)  


We did an example of Gauss-Jordan to compute inverses.

* [Gauss Jordan](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Gauss-Jordan.ipynb)


Then we explored the ordering of elimination  matrices.

A Key point is that elimination matrices are for human understanding,
in the real world the multipliers are computed and inserted into L.

In the real world, neither Julia, nor Python, nor MATLAB, nor R
does Gaussian Elimination, but rather all these packages
call [LAPACK](http://www.netlib.org/lapack/) written in FORTRAN90.

* [Lower-Triangular-and-Elimination](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Lower-Triangular-and-Elimination.ipynb)

* [Transposes,permutations,orthogonality](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Transposes.ipynb)
**Further reading:** Textbook sections 2.5, 2.6 ("The cost of elimination"), and 11.1.  Strang [video lecture 3](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-3-multiplication-and-inverse-matrices/).

One way or another, we have now covered the material up to 2.6 and also 11.1.
Also we covered the first four Gil Strang videos on [OCW](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/).

## Lecture 5 (Feb 16)

In today's lecture we finished the notebook on transposes, permutations, and orthogonality.  We then looked at the common algebraic structure of
vector spaces, playing the game of "Am I a vector space?"

*If* a set does not have a clear 0 vector, then it is easy to exclude it from being a vector space, but having a zero does not guarantee that a set is a vector space.

The most important fact is that linear combinations of vectors should exist in the space.


## Lecture 6 (Feb 20)

Reviewed vector spaces (a set V of anything you can add x+y and multiply by scalars αx) and introduced **subspaces** (a subset of V such that vector operations *stay in the subspace*).  Examples of vector spaces include real n-component vectors (ℝⁿ, or ℂⁿ for complex numbers), real m×n matrices, functions f(x) (ℝ↦ℝ, real numbers to real numbers).  Examples of subspaces includes planes or lines through the origin in ℝ³, or the origin itself.   The goal of this is to break vector spaces into smaller pieces that we can still do linear algebra on (hence the need for a subspace, not just any arbitrary subset).  Subspaces are especially important to help us understand the solutions (if any) of Ax=b for **non-square** matrices A.

Generalizations of vector spaces and subspaces.  These aren't limited to the n-component vectors (ℝⁿ, or ℂⁿ for complex numbers) that we use in 18.06!  Other examples include real m×n matrices, functions f(x) (ℝ↦ℝ, real numbers to real numbers).  Examples of subspaces includes planes or lines through the origin in ℝ³, or the origin itself; continuous functions, or functions with f(0)=0.   This generality is useful!  It is quite common to have problems where the unknowns are *matrices* rather than vectors (e.g. a [Sylvester equation](https://en.wikipedia.org/wiki/Sylvester_equation) or [multilinear algebra](https://en.wikipedia.org/wiki/Multilinear_algebra)) or problems where the unknowns are *functions* (e.g. partial differential equations like Maxwell's equations in electromagnetism and [functional analysis](https://en.wikipedia.org/wiki/Functional_analysis)), and the fact they they are vector spaces means that a lot of the tools and concepts of linear algebra can be applied.  (This happens in many engineering and physics courses; in math, see e.g. 18.303.)

For an m×n matrix A, introduced two important subspaces.

* First, the column space C(A): the set {Ax for all x ∈ ℝⁿ}.  This is the set of *right-hand sides* b such that Ax=b is *solvable*, and is a subspace of ℝᵐ (not ℝⁿ unless m=n!).  Equivalently, C(A) is all linear combinations of the *columns* of A, which we call the **span** of the columns.
  - Did an 3×2 example in which C(A) was a plane in ℝ³, and noticed via elimination that the "dimensionality" ("2d") of this subspace matched the rank (2).
  - Did another 3×2 example in which C(A) was a line in ℝ³, because the second column was a multiple of the first, and noticed via elimination that the "dimensionality" ("2d") of this subspace matched the rank (1).

* Second, the null space (also called the "kernel") N(A): the set {x such that Ax=0} ⊆ ℝⁿ (i.e., a subspace of ℝⁿ).  Given any solution x to Ax=b, then x+z is also a solution if z ∈ N(A) (i.e. Az=0 ⟹ A(x+z)=Ax+Az=Ax=b).
  - In our 2×3 example, the null space was determined to be a *line* in ℝ³, and we saw that this gave a line of solutions.

These are very important subspaces because they tell us a lot about the matrix A and solutions to Ax=b.  As a trivial example, if A is an n×n *invertible* matrix, C(A)=ℝⁿ and N(A)={0}.

Defined a **basis** for a vector space as a *minimal* set of vectors (we
will later say that they have to be *linearly independent*) whose
**span** (all linear combinations) produces everything in the space.
The **dimension** of a vector space is the number of vectors in a
basis.  More on this later… for now, I mostly rely on your intuition that a plane is 2d, a line is 1d, a point is 0d, etcetera.

**Further reading:** Textbook, sections 3.1 and 3.2; Strang [video lecture 6](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-6-column-space-and-nullspace/).

## Lecture 7 (Feb 21)

More on nullspace and column space.  Reviewed the definitions, and the fact that Ax=b is solvable if and only if ("iff") b ∈ C(A).  Given a particular solution xₚ satisfying Axₚ=b, xₚ+x is *also* a solution for any x ∈ N(A).

Showed that the **nullspace is preserved by elimination (row) operations**, but that the column space is not.   So, to find N(A), we can instead do elimination and find N(U)=N(A) for the upper-triangular form U.   Defined the **rank** as the number of (nonzero) pivots, the pivot columns, and the free columns.  We now want to find *all* possible solutions to Ax=0.

For hand calculation, it is useful to go a step further: much like Gauss–Jordan, we take U and eliminate "upwards" in the pivot columns to turn them into I, i.e. to **turn the pivot columns into an identity matrix**.   This is called the **reduced row echelon form** (abbreviated "rref") R.   Again, N(R)=N(A).

We can solve Rx=0 by breaking up x=(p,f) into the pivot variables p and the free variables f, and we find that they satisfy p=-Ff.  This means that we can choose *any f we want* and *p is determined*.   If we choose the usual basis (1,0,0,…), (0,1,0,…) for f∈ℝⁿ⁻ʳ and solve for p, this gives us the **special solutions**, a basis for N(A).    By the same reasoning we can see that the **dimension of N(A) is n-r**, #columns – #pivots.  This is **true for all matrices**, and is known as the [rank-nullity theorem](https://en.wikipedia.org/wiki/Rank%E2%80%93nullity_theorem).

Did an example of a 3×5 matrix A with rank 3 (3 pivots, which we will call *full row rank*), in which case N(A) is a 2-dimensional "plane" (in ℝ⁵), and we find two special solutions (a basis for the nullspace).   Once you get used to this, you can just read off the special solutions from the rref form R.

Brought up another way to think about the nullspace.  If N(A) contains a nonzero vector x≠0, then Ax=0 means that some linear combination of the columns of A, with at least one nonzero coefficient, is zero.   We say that the columns of A are **linearly dependent**: at least one of the columns can be made from a linear combination of the other columns.    If N(A)={0}, then we say that the columns are **linearly independent**.  

Earlier, I defined a basis as a minimal set of vectors whose span gives an entire vector space, and the dimension of the space as the size of the basis.  We now rephrase this as saying basis vectors must be be **linearly independent**.    The **dimension** of a space is still the number of basis vectors.

**Further reading:** Textbook, sections 3.2-3.3, video [lecture 6](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-6-column-space-and-nullspace/), [lecture 7](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-7-solving-ax-0-pivot-variables-special-solutions/).  Textbook sections 3.4, video [lecture 9](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-9-independence-basis-and-dimension/).

### Pset 3

[PSET 3](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/Pset3%20Spring2018%20Prof.Edelman.ipynb)

[Solutions to PSET 2](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/Pset2%20Solutions.ipynb)  


## Lecture 8 (Feb 23)

### Linear independence and C(A)

Bases, dimension, and independence.   Earlier, I defined a basis as a minimal set of vectors whose span gives an entire vector space, and the dimension of the space as the size of the basis.  Now, we want to think more carefully about the term "minimal".   If we have too many vectors in our basis, the problem is that some of the vectors might be redundant (you can get them from the other basis vectors).  We now rephrase this as saying that such vectors are *linearly dependent*: some linear combination (with nonzero multipliers) of them gives the zero vector, and we want every basis to be **linearly independent**.    The **dimension** of a subspace is still the number of basis vectors.

What does it mean to be linearly independent?  Given a set of n vectors {x₁, ⋯, xₙ}, if we matrix a matrix X whose columns
are x₁⋯xₙ, then C(X) is precisely the span of x₁⋯xₙ.   To check whether
the x₁⋯xₙ form a *basis* for C(X), we need to check whether they
are *linearly independent*.  There are three equivalent ways to think about
this:

1. We want to make sure that none of x₁⋯xₙ are "redundant": make sure
   that no xⱼ can be made from a linear combination of the other xᵢ's.

2. Equivalently, we don't want any linear combination of x₁⋯xₙ to give
   zero unless all the coefficients are zero.

3. Equivalently, we want N(X) = {0}.

In this way, we reduced the concept of independence to thinking about the
null space.   Since the nullspace is preserved by elimination, it follows
that *columns of A are dependent/independent if and
only if the corresponding columns of R are dependent/independent*.
By looking at R, we can see by inspection that the *pivot columns* form
a maximal set of independent vectors, and hence are a basis for C(R).
Hence, the *pivot columns of A* (i.e. the columns of A corresponding to
the columns of R or U where the pivots appear) are a basis for C(A).

It follows that the dimension of C(A) is exactly rank(A).

### Complete solution to Ax=b

We can now find the **complete solution** (i.e., all solutions) to a non-square linear system Ax=b.  Elimination turns this into Rx=d. We look for solutions in the form xₚ + xₙ: a **particular solution** xₚ plus any vector xₙ in N(A) (specified explicitly by giving a basis).  The particular solution xₚ can be *any* solution to Ax=b, but the simplest one to find is usually to *set the free variables* to zero.  That is, we write the solution xₚ=(p; 0) where p is the unknown values in the pivot rows, setting the other (free) rows to zero, then plug into Rxₚ=d to get p.  Since this part of R is just I, we can easily solve it.   Then we add in anything in N(A).

I gave a 3×6 example matrix A (from Strang, section 3.3) that was **rank deficient**: after elimination, we only had two pivots (rank r=2) in the first two rows, and a whole row of zeros.   Furthermore, its pivot columns were the first and *third* columns, with the second and fourth columns being free — this is possible (albeit unusual)!   Showed that we could still get the special solutions by solving for the pivot variables in terms of the free variables = (1,0,…) etcetera, and we still got dimension n-r (= 2) for the null space.   When solving Ax=b by elimination into Ux=c, however, we *only got a solution x if c was zero in the same rows as U*.  If the zero third row of U was matched by a zero third row of c, then we got a particular solution as before by setting the free variables to zero.  If the zero third row of U was *not* matched by a zero third row of c, then there is *no* solution: b was *not in the column space* C(A).  In general, problems that are *not full row rank may not have solutions*.

### Four important cases for Ax=b

Went through four important cases for an m×n matrix A of rank r.  (Note that we must have r ≤ m and n: you can't have more pivots than there are rows or columns.)

1. If r=n, then A has **full column rank**.  We must have m ≥ n (it is a "tall" matrix), and N(A)={0} (there are no free columns).  Hence, any solution to Ax=b (if it exists at all) must be *unique*.

2. If r=m, then A has **full row rank**.  We must have n ≥ m (it is a "wide" matrix), and C(A)=ℝᵐ.  Ax=b is *always solvable* (but the solution will not be unique unless m=n).

3. If r=m=n, then A is a square **invertible** matrix.  Ax=b is always solvable and the solution x=A⁻¹b is unique.

4. If r < m and r < n, then A is **rank deficient**.  Solutions to Ax=b may not exist and will not be unique if they do exist.

Cases (1)-(3) are called **full rank**: the rank is as big as possible given the shape of A.  In practice, most matrices that one encounters are full rank (this is essentially always true for *random* matrices).  If the matrix is rank deficient, it usually arises from some special structure of the problem (i.e. you usually want to look at where A came from to help you figure out why it is rank deficient, rather than computing the rank etcetera by mindless calculation).   (A separate problem is that of matrices that are *nearly* rank deficient because the pivots are very small, but the right tools to analyze this case won't come up until near the end of the course.)

**Further reading:** Textbook sections 3.3–3.4, [lecture 8](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-8-solving-ax-b-row-reduced-form-r/) and [lecture 9](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-9-independence-basis-and-dimension/).

## Exam 1 Information

Note: On Wednesday February 28, we will have an in class review
for Exam 1.  Bring Questions.  You may wish to look at
[ previous Exam 1 problems](http://web.mit.edu/18.06/www/old.shtml), though note that the timing of Exam 1 can vary from semester to semester so topics can shift.

## Lecture 9 (Feb 26)

We looked at the general form of the RREF, considered the four fundamental subspaces, and used a graph as an example.  We covered GS 3.5.

## Lecture 10 (Feb 28)

Review.


[PSET 4](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/Pset4%20Spring2018%20Prof.Edelman.ipynb) due March 7, 10:55am  .

## Lecture 11 (Mar 2)

 Exam 1

## Lecture 12 (Mar 5)

We defined orthogonal subpsaces and orthogonal complements.

Showed that the matrix subspaces have an *orthogonality* relationship: C(A)⟂N(Aᵀ),
in the sense that every vector in C(A) is orthogonal to every vector in N(Aᵀ).
In consequence, their intersection is {0} (0-dimensional), and C(A)+N(Aᵀ)=ℝᵐ.
Similarly for C(Aᵀ) and N(A).  This is the fundamental theorem of linear algebra.

Equivalently, showed that N(Aᵀ) is the *orthogonal complement* of C(A),
defining the orthogonal complement S<sup>⟂</sup> of a subspace S as
{x such that xᵀy=0 for all y ∈ S}.  Showed explicitly that if y is orthogonal
to every vector in C(A), then y is necessarily in N(Aᵀ) (and vice versa).

This often gives an nice way to check if a vector is in C(A): b is in C(A)
if and only if b is orthogonal to N(Aᵀ) (or to a basis thereof).   Gave
an example where C(A) is a plane in ℝ³, N(Aᵀ) is the line through 0 orthogonal
to that plane, and the equation for b ∈ C(A) was yᵀb=0 for a y ∈ N(Aᵀ)

Considered a number of examples of matrices A, and considered the picture on the
front cover of the book.

Concluded with the observation that n independent vectors in ℝᵐ span the space hence
form a basis.  Similaraly n spanning vector in ℝᵐ are independent, and thus are also a basis.

**Further reading:** Textbook 4.1; video [lecture 14](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-14-orthogonal-vectors-and-subspaces/). 

## Lecture 13 (Mar 7)
Orthogonal projection onto C(A) and other subspaces, and the projection matrix P.

* Projection matrix P = aaᵀ/aᵀa onto 1d subspaces with a basis vector a.
* Projection matrix P = A(AᵀA)⁻¹Aᵀ onto n-dimensional subspaces C(A), where A is m×n with full column rank (rank n).
* Equivalence between orthogonal projection and least-squares: minimizing ‖b-Ax‖ is equivalent to minimizing ‖b-y‖ over y∈C(A), and the solution is y=Ax̂=Pb, where AᵀAx̂=Aᵀb as before.
* Key properties P²=P, P=Pᵀ, C(P)=C(A), N(P)=N(Aᵀ).
* Projection I-P onto the orthogonal complement of C(A), i.e onto N(Aᵀ).
* Projection P = B(BᵀB)⁻¹Bᵀ onto an arbitrary subspace, where B is a matrix whose columns are the basis vectors.  For example, if A is not full column rank, we can make a new matrix B out of the pivot columns and use B(BᵀB)⁻¹Bᵀ to project onto C(A)=C(B).

We mentioned that the SVD can be used when the subspace is not known, but is to be determined by the data, and deep neural nets (not 18.06) are used when we are fitting to a nonlinear space.


**Further reading:** Textbook 4.2; video [lecture 15](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-15-projections-onto-subspaces/).

[PSET 5](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/Pset5%20Spring2018%20Prof.Edelman.ipynb) due March 14, 10:55am  .
<br>
[Solutions to PSET 4](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/Pset4%20Solutions.ipynb) 


## Lecture 14 (Mar 9)

We went through least squares with geometry, algebra, and calculus.

We mentioned that one can use A\b in Julia to find the least squares solution to Ax̂=b
whose explicit solution is the same as (AᵀA)x̂=(Aᵀb) as long as A has independent columns.

We show how to view two dimensional line fitting which minimizes vertical distances squared
to a line is equivalent to an orthgonal projection in ℝ^n
where the A is an nx2 matrix.

We recommended memorizing a few basic gradients, not so much for 18.06 but other courses you may
take.  We took gradients of functions with vector inputs and scalar outputs.  It is worth noting
that the size of a gradient is always the size of the variable the gradient is taking the derivatives
with respect to. (x in these examples)

∇ₓ(constant) = the zero vector in ℝ^n <br>
∇ₓ( sum(x) ) = the ones vector in ℝ^n <br>
∇ₓ( w ⋅ x ) = ∇ₓ( wᵀx ) =  w <br>
∇ₓ( xᵀMx ) = (M+Mᵀ)x  (which is 2Mx if M is symmetric)

Finding extrema such as minimums is solved by setting a gradient to 0.

We then showed how if you find the gradient of (Ax-b)ᵀ(Ax-b) = xᵀAᵀAx - 2bᵀAx + bᵀb, and
set it to 0 we recover (AᵀA)x̂=(Aᵀb).

In machine learning one often computes gradients with respect to matrices not vectors,
and so the result is a matrix not a vector.  The idea is the same, one computes the derivative of a scalar
output with respect to every component of a matrix.

An important example in machine learning worth memorizing: <br>
∇_W(xᵀWx) = xxᵀ for a square W. More generally <br>
∇_W(yᵀWx) = yxᵀ. (Check that if W is mxn, so is yxᵀ). 

There are lots of other least squares examples worth looking at in the
[least squares lecture notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Least-Square%20Fitting.ipynb)




**Further reading:** Textbook 4.3; video [lecture 16](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-16-projection-matrices-and-least-squares/).

## Lecture 15 (Mar 12)

We showed that projections and least squares simplify with orthonormal bases, discussed angles
in higher dimensions (as defined by acos(x⋅y/(‖x‖‖y‖)).

We considered rotations, permutations, and reflections (I-2uuᵀ) where u is a unit vector.





We began a Gram Schmidt computation in a Julia notebook.  Many students noticed
that this seemed too much like a hand computation on a computer, and asked if this
could be done in a better way on a computer.  We will see that this is possible in Lecture 17.

[Gram Schmidt notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Gram-Schmidt.ipynb)

**Further reading:** Textbook 4.4; video [lecture 17](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-17-orthogonal-matrices-and-gram-schmidt/)

## Lecture 16 (Mar 14)

We discussed two forms of infinite dimensional vector space.  The discrete v=(v₁,v₂,v₃,…) or continuous functions defined on an interval such as [0,2π], or [-1,1].  Dot products are infinite sums for the discrete case.  We take integrals in the continuous case: (f,g) = ∫f(x)g(x)dx, where the integration is over the interval.  In Hilbert space, we take only those vectors of finite length.  This is a subspace.  One can talk about angles between two functions or the length of a function, and this makes perfect sense.

We then talked about Fourier series as an example of P = UUᵀ.
The purpose was not so very much to teach Fourier series, but to see Fourier series as the same mathematics
as the finite matrix projection or expansion.
We also briefly looked at the Julia notebooks for sine series and orthogonal polynomials:

[sine series notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Sine-series.ipynb) <br>
[orthogonal polynomial notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Orthogonal-Polynomials.ipynb)
 

**Further reading:** Textbook 10.5; video [lecture 24, starting at 35:15 ](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-24-markov-matrices-fourier-series/)


[PSET 6](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/Pset6%20Spring2018%20Prof.Edelman.ipynb)  due Thursday !! March 22, 10:55am.<br> 
[Solutions to PSET 5](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/Pset5%20Solutions.ipynb)  


## Lecture 17 (Mar 16)

We discussed how if A has independent columns, one can form A = QR, where Q and A have the same size and R is upper triangular.  R encodes the fact that the span of the first k columns of Q matches that of the first k columns of A, for k=1,2,....

We compared and constrasted A,Q, and the U from the svd.  They all have the same size.  They all have the same column space.  A contains columns in arbitrary directions.  Q and U both have orthonormal columns but are not generally the same matrix.  Q has the spanning property mentioned above.  U has a best approximation property, which we will see later in the course.

We then began to talk about the properties of determinants.  We mentioned that determinants are more useful for theory than for practical computations.  Determinants are rarely used in practical computer programs.

A determinant is a scalar function of an nxn matrix.  One can write down an explicit formula or the three
basic properties:

1. Det(I)=1 <br>
2. If you interchange rows, the determinant flips sign <br>
3. The determinant is a linear function of each row separately.

For starters it is not clear that there is a function with the above three properties, or whether it is unique, and that is what we will investigate.

Other properties of determinants may be seen in this notebook:

[determinants notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Determinants.ipynb) <br>


**Further reading:** Textbook 5.1; video [lecture 18](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-18-properties-of-determinants/)

## Lecture 18 (Mar 19)

We continued to prove the various properties of the determinant found in 
this notebook:
[determinants notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Determinants.ipynb) <br>

In particular, we methodically showed step by step that the three axioms imply that the the determinant of a matrix must be (-1)^(# row exchanges) x (product of the pivots.)  That's it, nothing else, it must be that.

Now that we know the three properties imply one unique function, then we can use this to show that D(A) defined as |AB|/|B| for any non-singular B, has the three properties so for sure D(A)=|A|, and thus |AB|=|A||B|.  (If A is singular or B is singular, it is easy to see that AB is singular, so these cases can be checked easily.)

**Further reading:** Textbook 5.2; video [lecture 19](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-19-determinant-formulas-and-cofactors/)

## Lecture 19 (Mar 21)

We proved |Aᵀ|=|A| and discussed how |permutation matrix| = ±1.
This allowed us to see that if you took the [fifteen puzzle](https://en.wikipedia.org/wiki/15_puzzle) and you interchanged two pieces you would render th epuzzle insolvable.  Here's the idea: 1) if one checkerboards (colors alternately black and red) the 4x4 array, it's easy to see that if the "hole" journeys to the same starting position, it would take an even number of steps.  The state of the puzzle can be encoded as a 16x16 permutation matrix, and every step is a row exchange, hence switches the sign of the determinant.  Thus if you interchange two pieces artifically you can never solve the puzzle. 
  The same argument would basically be true if you interchanged two of the edge centered pieces of a Rubik's cube.  The state is a 12x12 permutation matrix, and a 3d checkerboarding shows you need an even number of steps to return to where you start.   

We showed that the pivots of a matrix are given by a ratio of determinants , and also the solution to Ax=b, is a ratio of determinants by Cramer's rule.


We discussed that if L(x) is a linear function of x with scalar values, then L(x) must have the form C ⋅ x  for some vector C.  We then wrote down C for 2x2 matrix determinants and 3x3 matrix determinants.

We wrote down the big formula for determinants in terms of permutations.

[PSET 7](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/Pset7%20Spring2018%20Prof.Edelman.ipynb)  due Wednesday   April 4, 10:55am.<br> 

**Further reading:** Textbook 5.3; video [lecture 20](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-20-cramers-rule-inverse-matrix-and-volume/)


## Lecture 20 (Mar 23)

We derived an explicit formula for the elements of A⁻¹, discussed the cofactor rules, the cross product, and volumes.
In particular the cofactor formula is the very Property 3.  We explained that perhaps one can view it as a formula
for determinants, but one should also understand that the very linearity in Propety 3 is given explicitly in that formula.

We saw that the cross product was really the cofactors and explained there could be a cross product in higher dimensions but it would
take n-1 arguments and produce n cofactors.

Familiar formulas like if you double every length in a 3d object, the volume is multiplied by 2^3=8 generalize to higher
dimensions and are captured by the determinant formula.

**Further reading:** Textbook 5.3. 



