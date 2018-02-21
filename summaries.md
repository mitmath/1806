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

In today's lecture re finished the notebook on transposes, permutations, and orthogonality.  We then looked at the common algebraic structure of
vector spaces, playing the game of "Am I a vector space?"

IF s set does not have a clear $0$, then it is easy to exclude it from being a vector space, but having a zero does not guarantee that a set is a vector space.

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


[PSET 3](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/Pset3%20Spring2018%20Prof.Edelman.ipynb)
