# Fall 2018 [18.06](https://web.mit.edu/18.06/www/) Lecture Summaries <br>
 [Prof. Steven G. Johnson](http://math.mit.edu/~stevenj)

This document is a *brief* summary of what was covered in each 18.06
lecture, along with links and suggestions for further reading.  It is
*not* a good substitute for attending lecture, but may provide a
useful study guide.

(You can also look at the analogous summaries from [Fall 2017](https://github.com/stevengj/1806/blob/fall17/summaries.md) and [Spring 2018](https://github.com/stevengj/1806/blob/spring18/summaries.md).)

I'll try to update it within a day of each lecture.

## Lecture 1 (Sep 5)

* [course overview
slides](https://github.com/stevengj/1806/blob/master/lectures/1806overview.pdf) and [Gaussian
elimination notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Gaussian-elimination.ipynb)
* [pset 1](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset1.ipynb) (due Wed 9/12 at 10:55am, submitted electronically via Stellar)

Went over the [course overview
slides](https://github.com/stevengj/1806/blob/master/lectures/overview.pdf)
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

This process is quite tedious to do by hand, so I instead switched over to [Julia](http://julialang.org/) to do more computational exploration with [this Julia notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Gaussian-elimination.ipynb).  See [here for more information on using Julia](https://github.com/stevengj/julia-mit); you can also go to [juliabox.com](https://juliabox.com/) to use it online without installing anything.  To use the interactive widgets in the notebook from today, you will have to run it in Julia yourself:

1. Go to the [notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Gaussian-elimination.ipynb) and click on the *download icon* on the upper-right hand corner to download the file onto your computer

2. Log into juliabox (if you haven't installed Julia locally on your computer) and you will see a "dashboard" listing of notebooks.  *Drag* the `Gaussian-elimination.ipynb` file from your computer onto this dashboard to upload it.

3. Click the notebook in the dashboard to run it.

4. You can run individual cells by typing "shift-enter".  You can also run all of the cells at once (e.g. to create all of the interactive widgets) by choosing *Run All* from the *Cell* menu at the top.  (Note: if you have installed Julia on your own computer, you will need to run `Pkg.add("PyPlot")` and `Pkg.add("Interact")` first, if you have not done so already, in order to install the packages needed for this notebook.)

**Further reading:** Textbook sections 2.1 and 2.2.  Strang [lecture 2 video](https://www.youtube.com/watch?v=QVKj3LADCnA).

## Lecture 2 (Sep 7)

* [Matrix-multiplication perspectives](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Matrix-mult-perspectives.ipynb)

What comes next?  The problem with expressing Gaussian elimination this way, as operations on individual numbers in the matrix, is that it is impossible to follow the process in detail for anything except a very tiny matrix.   We need a higher-level way to express the process, both to help us understand it and also to help us to *use* it (e.g. to perform additional algebraic transformations afterwards).   To do this, we want to express the process, not as operations on individual numbers, but as [multiplications of whole matrices](https://en.wikipedia.org/wiki/Matrix_multiplication).

Went over several different perspectives on matrix multiplication: the *same arithmetic operations* can be viewed as row×columns, matrix×columns, rows×matrix, columns×rows, and more.   If you are doing hand calculations (but who does that, really?), rows×columns is probably the easiest.  But the other viewpoints help us *think* about matrix multiplication in different ways, both to understand what is going on and also to *design* matrices to perform certain operations.

Using this understanding, we will be able to rewrite Gaussian elimination in matrix form: we multiply a matrix A on the *left* by a sequence of **lower**-triangular elimination matrices to arrive at an **upper**-triangular matrix U.    This turns out to be *extremely* useful
as both a computational and a theoretical tool, because triangular matrices are much easier to work with than general matrices — we've already seen that it is easy to solve triangular systems of equations, and we will find that they are nice in other ways as well.

In the next lecture, we put all of these elimination steps togetherk, and then reverse the elimination steps, to obtain the [LU factorization](https://en.wikipedia.org/wiki/LU_decomposition) A=LU.

**Further reading:** Textbook sections 2.4, 2.3, 2.6.  Strang [lecture 1 video](https://www.youtube.com/watch?v=ZK3O402wf1c), [lecture 4 video](https://www.youtube.com/watch?v=5hO3MrzPa0A).

## Optional Julia Tutorial (Friday Sep 7, 5pm, 32-141)

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

Note: Julia 1.0 was [released at the end of summer 2018](https://julialang.org/blog/2018/08/one-point-zero), but the tutorial materials are still for Julia 0.6, and several Julia packages are still in the process of being upgraded.    juliabox.com currently supports Julia 0.6, so **for at least the first pset we will use Julia 0.6**.   (Some of my lecture notebooks may use a more recent Julia version, but you can view the notebooks regardless.)

## Lecture 3 (Sep 10)

* [Matrix inverse and LU notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Inverses-LU-intro.ipynb)

Using the understanding from last lecture, we rewrote Gaussian elimination in matrix form: we multiply a matrix A on the *left* by a sequence of **lower**-triangular elimination matrices to arrive at an **upper**-triangular matrix U.    This turns out to be *extremely* useful
as both a computational and a theoretical tool, because triangular matrices are much easier to work with than general matrices — we've already seen that it is easy to solve triangular systems of equations, and we will find that they are nice in other ways as well.

Next, we will move these lower-triangular matrices to the other side of the equation, *conceptually* via matrix inverses (though in practice explicit inversion is never required).

Introduction to the concept of a matrix inverse via the identity matrix.  Key ideas from the notebook:

* I is an identity matrix, the matrix that gives Ix=x for any x or IA=A and AI=A for any A.  There are m×m identity matrices for all m, and when we write "I" we usually infer from context how big an I we mean.
* A⁻¹ is the matrix that does the "reverse" of A: if Ax=b, then A⁻¹b=x (for any x).  (Equivalently, it gives the solution to Ax=b.)  It only exists for **square, nonsingular** matrices A.  (i.e. an m×m matrix A must give m nonzero pivots when you do elimination.)
* Equivalently, A⁻¹ is the matrix for which A⁻¹A = AA⁻¹ = I (the m×m identity matrix).
* An important property: (AB)⁻¹ = B⁻¹A⁻¹.

Our first application is not to compute general matrix inverses, but rather to invert the elimination steps from the last lecture and compute the [LU factorization](https://en.wikipedia.org/wiki/LU_decomposition) A=LU of a matrix.  Inverting elimination steps is easy — by inspection, whenever we subtracted a multiple of a row, to invert it we just add instead — and turns out to be just flipping the signs of the entries below the diagonal.  Key idea:

* Gaussian elimination EA=U (without row swaps) can be thought of as A=LU: factorizing A into a **product of two simpler (triangular) matrices** (L=lower, U=upper).  U is the matrix that you normally get when you do elimination by hand, and L (the inverse of the elimination steps L=E⁻¹, a lower-triangular matrix with 1's on the diagonal) is essentially a *"record" of the elimination steps*.
* Computing L and U is hard (elimination is a lot of work, even for a computer), but once you have L and U then many things that you might want to do with A become easy.
  - For example, suppose you want to solve Ax=b, given A=LU.  Write LUx=b=L(Ux), and let y=Ux.  Then Ly=b, and we can solve for y by forward-substitution.  Given y, we can then solve Ux=y by back-substitution.  Both of these steps are easy because the systems are triangular.
  - This means that we can re-use L and U to solve Ax=b for *many right-hand sides*.   In contrast, if you "augment" A with b and then do elimination (A|b)⟶(U|y), you get the *same* new right-hand side y but you haven't kept a record of the elimination steps, so if you have a new right-hand side you might naively repeat the whole elimination process (hard!) rather than solving Ly=b (easy!).

In the next lecture (which will start with the end of this notebook), we will look at calculating inverses more generally (although it turns out that this is something that you should almost never do explicitly, even on a computer!).   I gave a quick preview of how to do it: from AA⁻¹ = I, it turns out that we just need to solve Ax=b for a sequence of right-hand sides b.  If the b's are the columns of I, then the x's will be the columns of A⁻¹!  And solving each of these right-hand sides is easy once you have A=LU.  (This is essentially how the computer gets A⁻¹ when you do `inv(A)`.)

**Further reading:** Textbook sections 2.5, 2.6.  Strang [lecture 4 video](https://www.youtube.com/watch?v=5hO3MrzPa0A) and [lecture 3 video](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-3-multiplication-and-inverse-matrices/).

## Lecture 4 (Sep 12)

* [Gauss–Jordan for inverses](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Gauss-Jordan.ipynb )
* [LU factorization for real](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/LU-for-real.ipynb)
* [pset 1 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset1sol.ipynb)
* [pset 2](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset2.ipynb) (due Wed 9/19 at 10:55am, submitted electronically via Stellar)


Went through how to explicitly compute A⁻¹ by solving AA⁻¹ = I.  In particular, went through the Gauss–Jordan algorithm (on a 3×3 example that can also be found in the textbook): If we do row operations on A to get I, then the *same* row operations on I give A⁻¹!  To carry this out by hand, we augment (A|I), do ordinary Gaussian elimination to get (U|C), and then do elimination "upwards" to get (I|A⁻¹).

This does not mean that matrix inverses are useless!  However, they are mainly a *conceptual* tool that we use to move matrices around *symbolically* in equations.   Once you are through with your algebraic manipulations, you might end up with an expression like A⁻¹b — but when it comes time to actually *compute* the answer, you should **read "A⁻¹b" as "solve Ax=b for x by the best available method"**.

Began a more realistic and complete discussion of LU factorization (beginning of 2nd notebook above), covering:

* How the L matrix entries are just the multipliers from Gaussian elimination.  No extra work is required!
* How in practice, one rarely "augments" the matrix with the right-hand side.  Instead, you compute A=LU, substitute this into Ax=b=LUx, let c=Ux, solve Lc=b, then solve Ux=c.  In particular, solving Lc=b is *exactly* the same as performing the Gaussian-elimination steps on c.  (The "augmented" method is a little easier for human bookkeeping, but has essentially no advantage for the computer.)

**Further reading:** Textbook sections 2.5, 2.6.  Strang [video lecture 3](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-3-multiplication-and-inverse-matrices/).   Strang [video lecture 4](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-4-factorization-into-a-lu/).

## Lecture 5 (Sep 14)

* [LU factorization for real](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/LU-for-real.ipynb)
* [Computational complexity](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Complexity.ipynb)

Finished going through a more realistic and complete discussion of LU factorization, with some blackboard aids, covering:

* How the L matrix entries are just the multipliers from Gaussian elimination.  No extra work is required!
* How in practice, one rarely "augments" the matrix with the right-hand side.  Instead, you compute A=LU, substitute this into Ax=b=LUx, let c=Ux, solve Lc=b, then solve Ux=c.  In particular, solving Lc=b is *exactly* the same as performing the Gaussian-elimination steps on c.  (The "augmented" method is a little easier for human bookkeeping, but has essentially no advantage for the computer.)
* Given A=LU, you can efficiently solve multiple right-hand sides, or equivalently the **matrix equation** AX=B.
* How row swaps lead to the factorization PA=LU: in practice, the computer *almost always* does row swaps, and *always* gives you a permutation matrix P (or its equivalent).

Complexity of matrix operations: why matrix × vector or backsubstitution scale like n² for n×n matrices, while matrix × matrix or Gaussian elimination (LU factorization) scale like n³.   Matrices much bigger than a few thousand square quickly become impractical, and really large problems are only tractable because they have special structure like sparsity.

**Further reading:** Textbook sections 2.6 ("The cost of elimination"), 2.7 (on permutations; we will talk about transposes soon), and 11.1.  Strang [video lecture 4](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-4-factorization-into-a-lu/) and [video lecture 5](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-5-transposes-permutations-spaces-r-n/).   For 18.06, I *don't expect you to know* the details of how the permutation P in PA=LU is constructed even though you don't know the permutation in advance, but if you are interested it is described in [lecture 21 of *Numerical Linear Algebra* by Trefethen and Bau](http://library.books24x7.com.libproxy.mit.edu/assetviewer.aspx?bookid=9436&chunkid=389684869) (readable online with MIT certificates; this is a *graduate-level* textbook used for 18.335, so don't let it scare you!).

## Lecture 6 (Sep 17)

* [Computational complexity](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Complexity.ipynb)

* [Singular matrices and rank](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Singular.ipynb)

Complexity of matrix operations: why matrix × vector or backsubstitution scale like n² for n×n matrices, while matrix × matrix or Gaussian elimination (LU factorization) scale like n³.   Matrices much bigger than a few thousand square quickly become impractical, and really large problems are only tractable because they have special structure like sparsity.

Started looking at singular matrices more carefully.  Not all singular matrices are created equal!

Defined the **rank** of a matrix = # pivots (note that pivots are nonzero by definition).   An invertible matrix, i.e. a square non-singular matrix, has **full rank**: rank = number of rows = number of columns; more generally, a non-square **full rank** matrix has rank equal to *either* the number of rows or columns (whichever is *smaller*).   A **rank-deficient** matrix has a rank *less than both* the number of rows or the number of columns.  Our main goal for the next few weeks will be to understand non-square and rank-deficient matrix problems.

Introduced vector spaces (a set V of anything you can add x+y and multiply by scalars αx) and subspaces (a subset of V such that vector operations *stay in the subspace*).  Examples of vector spaces include real n-component vectors (ℝⁿ, or ℂⁿ for complex numbers), real m×n matrices, functions f(x) (ℝ↦ℝ, real numbers to real numbers).  Examples of subspaces includes planes or lines through the origin in ℝ³, or the origin itself.   The goal of this is to break vector spaces into smaller pieces that we can still do linear algebra on (hence the need for a subspace, not just any arbitrary subset).

Generalizations of vector spaces and subspaces.  These aren't limited to the n-component vectors (ℝⁿ, or ℂⁿ for complex numbers) that we use in 18.06!  Other examples include real m×n matrices, functions f(x) (ℝ↦ℝ, real numbers to real numbers).  Examples of subspaces includes planes or lines through the origin in ℝ³, or the origin itself; polynomial functions; polynomials of degree ≤ 3, continuous functions, or functions that are zero at some points.   This generality is useful!  It is quite common to have problems where the unknowns are *matrices* rather than vectors (e.g. a [Sylvester equation](https://en.wikipedia.org/wiki/Sylvester_equation) or [multilinear algebra](https://en.wikipedia.org/wiki/Multilinear_algebra)) or problems where the unknowns are *functions* (e.g. partial differential equations like Maxwell's equations in electromagnetism and [functional analysis](https://en.wikipedia.org/wiki/Functional_analysis)), and the fact they they are vector spaces means that a lot of the tools and concepts of linear algebra can be applied.  (This happens in many engineering and physics courses; in math, see e.g. 18.303.)

**Further reading:** Textbook sections 2.6 ("The cost of elimination") and 11.1.  Textbook sections 3.1–3.3.

## Lecture 7 (Sep 19)

* [pset 2 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset2sol.ipynb)
* [pset 3](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset3.ipynb) (due Wed 9/26 at 10:55am, submitted electronically via Stellar)

More examples of subspaces.  For ℝ³, possible subspaces are the origin ("0-dimensional), lines through the origin ("1-dimensional"), planes through the origin ("2-dimensional"), and the whole space.  For the vector space of functions f(x), possible subspaces include functions that pass through zero f(0)=0, or the "3d" subspace of polynomial functions of degree ≤ 2.   For the vector space of 3×3 matrices, subspaces include diagonal matrices or upper-triangular matrices.

For an m×n matrix A, introduced two important subspaces.

* First, the column space C(A): the set {Ax for all x ∈ ℝⁿ}.  This is the set of *right-hand sides* b such that Ax=b is *solvable*, and is a subspace of ℝᵐ (not ℝⁿ unless m=n!).  Equivalently, C(A) is all linear combinations of the *columns* of A, which we call the **span** of the columns.
  - Did an 3×2 example in which C(A) was a plane in ℝ³, and noticed via elimination that the "dimensionality" ("2d") of this subspace matched the rank (2).
  - Did another 3×2 example in which C(A) was a line in ℝ³, because the second column was a multiple of the first, and noticed via elimination that the "dimensionality" ("2d") of this subspace matched the rank (1).

* Second, the null space (also called the "kernel") N(A): the set {x such that Ax=0} ⊆ ℝⁿ (i.e., a subspace of ℝⁿ).  Given any solution x to Ax=b, then x+z is also a solution if z ∈ N(A) (i.e. Az=0 ⟹ A(x+z)=Ax+Az=Ax=b).
  - In our 2×3 example, the null space was determined to be a *line* in ℝ³, and we saw that this gave a line of solutions.

These are very important subspaces because they tell us a lot about the matrix A and solutions to Ax=b.   C(A) tells us about **existence** of solutions and N(A) tells us about **uniqueness** (or lack thereof) of solutions.   Solutions to Ax=b (if any) are unique if and only if N(A)={0}; they exist for all b if and only if C(A)=ℝᵐ.

**Further reading:** Textbook, sections 3.1 and 3.2; Strang [video lecture 6](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-6-column-space-and-nullspace/).

## Lecture 8 (Sep 24)

More on nullspace and column space.  Reviewed the definitions, and the fact that Ax=b is solvable if and only if ("iff") b ∈ C(A).  Given a particular solution xₚ satisfying Axₚ=b, xₚ+x is *also* a solution for any x ∈ N(A).

We want to describe *all* of the vectors in N(A), and we will do this by finding a **basis** called the **special solutions**.  Defined a **basis** for a vector space as a *minimal* set of vectors (we will later say that they have to be *linearly independent*) whose **span** (all linear combinations) produces everything in the space. The **dimension** of a vector space is the number of vectors in a basis.  More on this later… for now, I mostly rely on your intuition that a plane is 2d, a line is 1d, a point is 0d, etcetera.

Showed that the **nullspace is preserved by elimination (row) operations**, but that the column space is not.   So, to find N(A), we can instead do elimination and find N(U)=N(A) for the upper-triangular form U.   Defined the **rank** as the number of (nonzero) pivots, the pivot columns, and the free columns.  We now want to find *all* possible solutions to Ax=0.

For hand calculation, it is useful to go a step further: much like Gauss–Jordan, we take U and eliminate "upwards" in the pivot columns to turn them into I, i.e. to **turn the pivot columns into an identity matrix**.   This is called the **reduced row echelon form** (abbreviated "rref") R.   Again, N(R)=N(A).

We can solve Rx=0 by breaking up x=(p,f) into the pivot variables p and the free variables f, and we find that they satisfy p=-Ff.  This means that we can choose *any f we want* and *p is determined*.   If we choose the usual basis (1,0,0,…), (0,1,0,…) for f∈ℝⁿ⁻ʳ and solve for p, this gives us the **special solutions**, a basis for N(A).    By the same reasoning we can see that the **dimension of N(A) is n-r**, #columns – #pivots.  This is **true for all matrices**, and is known as the [rank-nullity theorem](https://en.wikipedia.org/wiki/Rank%E2%80%93nullity_theorem).

Did an example of a 3×4 matrix A with rank 2 (2 pivots), in which case N(A) is a 2-dimensional "plane" (in ℝ⁴), and we find two special solutions (a basis for the nullspace).   Once you get used to this, you can just read off the special solutions from the rref form R.

**Further reading:** Textbook, sections 3.2-3.3, video [lecture 6](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-6-column-space-and-nullspace/), [lecture 7](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-7-solving-ax-0-pivot-variables-special-solutions/).

## Lecture 9 (Sep 26)

* [pset 3 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset3sol.ipynb)
* [pset 4](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset4.ipynb) (due Wed 10/3 at 10:55am, submitted electronically via Stellar)

Complete solutions to Ax=b, linear independence, basis of C(A).

### Complete solution to Ax=b

We can now find the **complete solution** (i.e., all solutions) to a non-square linear system Ax=b.  Elimination turns this into Rx=d. We look for solutions in the form xₚ + xₙ: a **particular solution** xₚ plus any vector xₙ in N(A) (specified explicitly by giving a basis).  The particular solution xₚ can be *any* solution to Ax=b, but the simplest one to find is usually to *set the free variables* to zero.  That is, we write the solution xₚ=(p; 0) where p is the unknown values in the pivot rows, setting the other (free) rows to zero, then plug into Rxₚ=d to get p.  Since this part of R is just I, we can easily solve it.   Then we add in anything in N(A).

I gave a 3×4 example matrix A that was **rank deficient**: after elimination, we only had two pivots (rank r=2) in the first two rows, and a whole row of zeros.   Furthermore, its pivot columns were the first and *fourth* columns, with the second and third columns being free — this is possible (albeit unusual)!   Showed that we could still get the special solutions by solving for the pivot variables in terms of the free variables = (1,0,…) etcetera, and we still got dimension n-r (= 2) for the null space.   When solving Ax=b by elimination into Rx=c, however, we *only got a solution x if c was zero in the same rows as U*.  If the zero third row of R was matched by a zero third row of c, then we got a particular solution as before by setting the free variables to zero.  If the zero third row of R was *not* matched by a zero third row of c, then there is *no* solution: b was *not in the column space* C(A).

### Linear independence and C(A)

Bases, dimension, and independence.   Earlier, I defined a basis as a minimal set of vectors whose span gives an entire vector space, and the dimension of the space as the number of basis vectors.  Now, we want to think more carefully about the term "minimal".   If we have too many vectors in our basis, the problem is that some of the vectors might be redundant (you can get them from the other basis vectors).  We now rephrase this as saying that such vectors are *linearly dependent*: some linear combination (with nonzero multipliers) of them gives the zero vector, and we want every basis to be **linearly independent**. The **dimension** of a subspace is still the number of basis vectors.

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

**Further reading:** Textbook sections 3.3–3.4, [lecture 8](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-8-solving-ax-b-row-reduced-form-r/) and [lecture 9](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-9-independence-basis-and-dimension/).

## Exam 1 (Friday Sep 28, 11am in 54-100)

Exam 1 will cover the material through **lecture 8**: matrix-vector operations, matrix multiplication interpretations, writing/working with equations in matrix form, solving systems of equations with one or more right-hand side, Gaussian elimination, back/forward-substitution and triangular matrices, LU factorization and PA=LU, permutation matrices, matrix inverses and Gauss–Jordan, singular matrices, computational costs (which operations are ~ m² or ~ m³ and arranging calculations efficiently), rank of a matrix (= number of pivots), vector spaces and subspaces, the column space C(A) and the nullspace N(A) and their relationship to solving Ax=b, the relationship of N(A) to elimination and rref form, finding a basis for N(A) (the "special solutions"), pivot & free columns.

*Not on exam 1:* "Complete" solutions to Ax=b, linear independence, finding basis and dimension for the column space in general, row space and left nullspace, orthogonality and projection; these will be on exam 2.

**Review session**: An *optional* review session (in which I go over some practice problems) will be held on Wed 9/26 5-6pm in 4-270.  Problems covered: Spring 2017 exam 1, problem 1a, 1b; Fall 2012 exam 1 problem 2; Fall 2009 exam 1, problem 3d; Spring 2017 exam 1 problem 4; Fall 2009 exam 1, problem 1b (*given* the LU factorization, find the inverse of A — I only found the 2nd column of A⁻¹, and by forward/backsubstitution rather than inverting U and L as in the solutions).

Practice problems: [spring 2017 exam 1](http://web.mit.edu/18.06/www/Spring17/exam1.pdf) problems 1–4 ([solutions](http://web.mit.edu/18.06/www/Spring17/exam1-sol.pdf)); [fall 2017 exam 1](https://github.com/stevengj/1806/blob/fall17/exams/exam1.pdf) problems 1-4 ([solutions](https://github.com/stevengj/1806/blob/fall17/exams/exam1-sol.pdf)); [fall 2017 exam 1](https://github.com/stevengj/1806/blob/fall17/exams/exam2.pdf) problem 1a,b ([solutions](https://github.com/stevengj/1806/blob/fall17/exams/exam2-sol.pdf));
[fall 2012 exam 1](http://web.mit.edu/18.06/www/Fall12/Exam%201/quiz1-1806-f12.pdf) problems 1–4 ([solutions](http://web.mit.edu/18.06/www/Fall12/Exam%201/quiz1-1806-f12-solution.pdf));
[fall 2007 exam 1](http://web.mit.edu/18.06/www/Fall07/quiz1-1806-F07.pdf) problems 1–3 ([solutions](http://web.mit.edu/18.06/www/Fall07/quiz1-1806-F07-sol.pdf)); [spring 2008 exam 1](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08.pdf) problems 1–4 ([solutions](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08-soln.pdf));  [fall 2011 exam 1](http://web.mit.edu/18.06/www/Fall11/q1_f11.pdf) problem 1a, 1b, 2 ([solutions](http://web.mit.edu/18.06/www/Fall11/q1_f11_solution.pdf));
[spring 2012 exam 1](http://web.mit.edu/18.06/www/Spring12/q1_sp12.pdf) problem 4 ([solutions](http://web.mit.edu/18.06/www/Spring12/q1_sp12_sol.pdf));
[fall 2014 exam 1](http://web.mit.edu/18.06/www/Fall14/midterm1_F14.pdf) problems 1, 2, 3a, 3b,  ([solutions](http://web.mit.edu/18.06/www/Fall14/Midterm1solF14.pdf);
[fall 2013 exam 1](http://web.mit.edu/18.06/www/Fall13/exam1_f13.pdf) problems 1, 2, 5 ([solutions](http://web.mit.edu/18.06/www/Fall13/exam1_f13_sol.pdf);
[fall 2009 exam 1](http://web.mit.edu/18.06/www/Fall09/exam1.pdf) problems 1, 2, 3a–3c ([solutions](http://web.mit.edu/18.06/www/Fall09/exam1soln.pdf));
[spring 2008 exam 1](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08.pdf) problems 1, 3, 4
([solutions](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08-soln.pdf))

* [Fall 2018 Exam 1](exams/exam1.pdf) and [solutions](exams/exam1sol.pdf).

## Lecture 10 (Oct 1)

### Four cases for Ax=b

Went through four important cases for an m×n matrix A of rank r.  (Note that we must have r ≤ m and n: you can't have more pivots than there are rows or columns.)

1. If r=n, then A has **full column rank**.  We must have m ≥ n (it must be a "tall" matrix), and N(A)={0} (there are no free columns).  Hence, any solution to Ax=b (if it exists at all) must be *unique*.

2. If r=m, then A has **full row rank**.  We must have n ≥ m (it must be a "wide" matrix), and C(A)=ℝᵐ.  Ax=b is *always solvable* (but the solution will not be unique unless m=n).

3. If r=m=n, then A is a square **invertible** matrix.  Ax=b is always solvable and the solution x=A⁻¹b is unique.

4. If r < m and r < n, then A is **rank deficient**.  Solutions to Ax=b may not exist and will not be unique if they do exist.

Cases (1)-(3) are called **full rank**: the rank is as big as possible given the shape of A.  In practice, most matrices that one encounters are full rank (this is essentially always true for *random* matrices).  If the matrix is rank deficient, it usually arises from some special structure of the problem (i.e. you usually want to look at where A came from to help you figure out why it is rank deficient, rather than computing the rank etcetera by mindless calculation).   (A separate problem is that of matrices that are *nearly* rank deficient because the pivots are very small, but the right tools to analyze this case won't come up until near the end of the course).

### Transposes and dot products

Reviewed the dot product or **inner product** of two column vectors, x⋅y, defined as ∑ᵢxᵢyᵢ.  In linear-algebra terms, we write this as x⋅y=xᵀy in terms of the *transpose* of the vector x: if x is a column vector, xᵀ is a row vector (sometimes more technically called a "dual" vector).  The *length* (or **norm**) of a vector is is the square root of the dot product with itself: ‖x‖=√xᵀx.

Most of you have seen the definition of a matrix transpose Aᵀ before: you turn rows into columns or vice versa.  But the *reason* that this is an important operation (as opposed to, say, rotating a matrix by 90°) is that it is connected to dot products: Aᵀ is defined precisely so that xᵀAy = x⋅(Ay) = (Aᵀx)⋅y = (Aᵀx)ᵀy: transposes move matrices from one side to the other in an inner product.  Swapping rows and columns is actually obtained as a *consequence* of this property.  Another consequence is the important identity (AB)ᵀ=BᵀAᵀ.

Because of this relationship, whenever we transpose a matrix in linear algebra, there will usually be a dot product lurking somewhere nearby.

### Four Fundamental Subspaces

The reason we are introducing transposes now is that we are missing two important subspaces, which turn out to be
the **row space** C(Aᵀ) and the **left nullspace** N(Aᵀ).

As usual with transposes, we expect to find a dot product somewhere, and in this case we will see that it is because the row space and the left nullspace are *orthogonal* to N(A) and C(A), respectively.

n summary, for an m×n matrix A of rank r, we find the **four fundamental subspaces**:

* column space C(A) ⊆ ℝᵐ, dimension r
* left nullspace N(Aᵀ) ⊆ ℝᵐ, dimension m-r
* row space C(Aᵀ) ⊆ ℝⁿ, dimension r
* nullspace N(A) ⊆ ℝⁿ, dimension n-r

In particular, since elimination multiplies A on the *left*, it multiplies Aᵀ on the *right*
by an invertible matrix.  Therefore, C(Aᵀ) = C(Rᵀ), and the *pivot rows of
R* are a basis for C(Aᵀ).   More importantly, this tells us a very non-obvious
fact: rank(Aᵀ) = rank(A).   (That is, if you did elimination on Aᵀ, you
would get the *same number of pivots*.)

(Finding a basis for N(Aᵀ) is not so nice, because the left nullspace is *not* preserved by elimination on A.  If R=EA, and x∈N(Rᵀ), then Eᵀx∈N(Aᵀ): we have to re-do the elimination steps on x.  For humans, it might be easier just to re-do elimination on Aᵀ to find its nullspace in the familiar way.)

Claimed that these subspaces are **orthogonal complements**, defining the orthogonal complement S<sup>⟂</sup> of a subspace S as
{x such that xᵀy=0 for all y ∈ S}.  In particular, N(Aᵀ)=C(A)<sup>⟂</sup> and N(A)=C(Aᵀ)<sup>⟂</sup>.  This is why their dimensions sum to m and n, respectively: combining a basis for S and S<sup>⟂</sup> gives a basis for the whole vector space.

**Further reading:** Textbook sections 3.4, 3.5, 4.1.  [video lecture 5](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-5-transposes-permutations-spaces-r-n/), video
[lecture 10](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-10-the-four-fundamental-subspaces/), video [lecture 14](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-14-orthogonal-vectors-and-subspaces/)

## Lecture 11 (Oct 3)

* [pset 4 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset4sol.ipynb)
* [pset 5](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset5.ipynb) (due Wed 10/10 at 10:55am, submitted electronically via Stellar)

Showed that N(Aᵀ) and C(A) are orthogonal complements.  This often gives an nice way to check if a vector is in C(A): b is in C(A) if and only if b is orthogonal to N(Aᵀ) (or to a basis thereof).   Gave an example where N(Aᵀ) is a line, allowing you to check whether b ∈ C(A) (that is, whether Ax=b has a solution) by checking a single dot product yᵀb=0 for a basis vector (special solution) y ∈ N(Aᵀ).

As another example, considered **rank-1 matrices** uvᵀ for u∈ℝᵐ and v∈ℝⁿ: if u and v are nonzero, then uvᵀ is an m×n matrix of rank 1.   This is easy to see: every column is a multiple of u, so C(uvᵀ)=C(u) is 1d, and similarly the row space is the 1d subspace spanned by v.  Since the dimension of the column/row space is the rank, then the rank is 1.

### Vectors and bases

Given any vector space V, we can "turn it into" column vectors in ℝⁿ by **choosing** a basis {v₁, v₂, …}, and representing vectors v ∈ V by their coefficients in that basis: if v=x₁v₁+x₂v₂+⋯, then we can represent v by the column vector (x₁, x₂, …).

One example of this is the high-school description of vectors as "arrows".   Choosing a basis corresponds to choosing a coordinate system.  Another example is the space P of degree ≤ 3 polynomials p(x)=c₀+c₁x+c₂x²: if we use the basis {1,x,x²} then we can represent such polynomials by the column vectors (c₀,c₁,c₂) ∈ ℝ³.    The latter example makes it clearer that the column vector "represents" the polynomial p(x), in the sense that ± and ×scalar operations on p(x) correspond to the equivalent operations on (c₀,c₁,c₂), even though p(x) and (c₀,c₁,c₂) are not the really "same" things.  (Technically, by choosing a basis we have defined an [isomorphism](https://en.wikipedia.org/wiki/Isomorphism) between P and ℝ³, but we won't be that technical in 18.06.)

A *change* of basis corresponds to simply multiplying the coordinate vectors by an invertible matrix B.  For example, we gave the matrix to change P to the basis of the {1,x-1,(x-1)²}, and the inverse of this matrix changes basis in the other directions.

### Linear transformations

A **linear transformation** (or **linear operator**) T(v) is a function that transforms vectors v to new vectors in a *linear* way: T(αv)=αT(v) and T(v+w)=T(v)+T(w).

One way of thinking about a matrix is that it is what we get when we start with a linear transformation T(v) and choose a basis for the "input" and "output" vector spaces.   For example, the derivative d/dx is a linear operator on functions.   Using our basis {1,x,x²} for P above, we could represent it by an equivalent 3×3 matrix acting on the coefficients (c₀,c₁,c₂) ∈ ℝ³.

**Further reading:** See previous lecture readings on the four subspaces and orthogonal complements.  Chapter 8 of the textbook on linear transformations and [video lecture 30](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-30-linear-transformations-and-their-matrices).

## Lecture 12 (Oct 5)

### Linear transformations and bases

Continuing from last lecture, explained why choosing a basis for the input and outputs allows us to represent a linear transformation by a matrix.   The key point is linearity: once we know what T(v) does to the basis vectors, {v₁, v₂, …, vₙ}, then we know what it does to *any* vector v = c₁v₁+c₂v₂+cₙvₙ, and writing down what it does to the coefficients c=(c₁,c₂,…,cₙ) gives us a matrix A.

Examples: T(v) = rotation by 90° in the plane.  T(v) = d/dx on the space P of degree ≤ 3 polynomials in the basis {1,x,x²}.  The latter case is interesting: it gives us a 3×3 matrix A that is rank 2.  N(A) is a line, and correspondingly N(d/dx) is the 1d subspace spanned by p(x)=1; C(A) is a plane, and correspondingly C(d/dx) in P is the 2d subspace spanned by {1,x}.  dp/dx=q(x) is only solvable for p∈P if q(x) has degree ≤ 1, and even then the solution is not unique because you can add any constant to p!

 Change of basis: if we have a matrix A, or a linear operation y=Ax, and we write the input in a new basis x=Bᵢv and the output in a new basis y=Bₒw, then in the new basis we have w=Bₒ⁻¹ABᵢv: the matrix Bₒ⁻¹ABᵢ is the "same" linear operation as A but changed to a new basis.  It is easy to show that Bₒ⁻¹ABᵢ and A have the same ranks and the same *dimensionality* of their subspaces: changing basis doesn't change whether solutions always exist or are unique.  From this perspective, consider the A=LU factorization, or U=L⁻¹A: we now see that U is the "same" linear operation as A, but the *output* is chnged to a new basis L.   In the special case of a square matrix A where we choose the *same* basis B=Bₒ=Bᵢ for input and output, we say that the matrix B⁻¹AB is [similar](https://en.wikipedia.org/wiki/Matrix_similarity) to A — we will come back to this later in the course, where it will be an important topic on exam 3.

**Further reading**: Chapter 8 of the textbook on linear transformations and [video lecture 30](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-30-linear-transformations-and-their-matrices).

 ### Multidimensional Newton's Method

 * [Multidimensional Newton’s method notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Multidimensional-Newton.ipynb)

Continuing on the theme of "where do matrices come from?", but from a more applied standpoint, talked about the multidimensional extension of Newton's method from 18.01, see notebook.

The key point of this lecture is that *linear* algebra can even be used to solve *nonlinear* equations.  There are many methods to convert a nonlinear equation into a *sequence* of *approximate* linear equations whose solutions *converge* to the nonlinear solution.   The most famous is Newton’s method.  You learned the 1d version of Newton’s method in first-year calculus.  The generalization, for *n* nonlinear equations in *n* unknowns, is a sequence of *n*×*n* matrix problems.

**Further reading:** Strang's textbook does not discuss this topic.   [Section 9.6 of Numerical Recipes in C](http://www.it.uom.gr/teaching/linearalgebra/NumericalRecipiesInC/c9-6.pdf) is a decent high-level review.  A somewhat more mathematically sophisticated review can be found in [these lecture notes](http://fabcol.free.fr/pdf/lectnotes5.pdf) by [Fabrice Collard](http://fabcol.free.fr/notes.html) or in these [2014 notes](http://www.math.cmu.edu/CNA/summer_institute/2014/projects/SUAMI_revised_paper.pdf) by Nicolle Eagan.

## Lecture 13 (October 10)

* [pset 5 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset5sol.ipynb)
* [pset 6](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset6.ipynb), due 10/17.
* [Least-square fitting notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Least-Square%20Fitting.ipynb)

Introduced the topic of least-square fitting of data to curves.  As long as the fitting function is linear in the unknown coefficients x, showed that minimizing the sum of the squares of the errors corresponds to minimizing the norm of the residual ‖b-Ax‖.   By straightforward (if somewhat tedious) calculus, found that this corresponds to solving the **normal equations** AᵀAx̂=Aᵀb for the fit coefficients x̂.  And we have enough linear algebra tools now to show that these equations are always solvable (uniquely if A has full column rank).

**Further reading:** Strang, section 4.3, and video [lecture 16](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-16-projection-matrices-and-least-squares/).  (Note that Strang does this in a little bit of a different order: he does orthogonal projection and then fitting, and I do the reverse in order to motivate these techniques with the real-world application of least-square fits.)   The brief discussion at the end of lecture on Runge phenomena and equally spaced vs. Chebyshev points in polynomial fitting was just "for fun and profit" — this material goes outside the scope of 18.06 — but if you are interested, the [book by Trefethen](https://people.maths.ox.ac.uk/trefethen/ATAP/) and accompanying [video lectures](https://people.maths.ox.ac.uk/trefethen/atapvideos.html) are a great place to start.

## Lecture 14 (October 12)

Orthogonal projection onto C(A) and other subspaces, connection to least-square fitting, and the projection matrix P.

* Projection matrix P = aaᵀ/aᵀa onto 1d subspaces with a basis vector a.
* Projection matrix P = A(AᵀA)⁻¹Aᵀ onto n-dimensional subspaces C(A), where A is m×n with full column rank (rank n).
* Equivalence between orthogonal projection and least-squares: minimizing ‖b-Ax‖ is equivalent to minimizing ‖b-y‖ over y∈C(A), and the solution is y=Ax̂=Pb, where AᵀAx̂=Aᵀb as before.
* Key properties P²=P, P=Pᵀ, C(P)=C(A), N(P)=N(Aᵀ).
* Projection I-P onto the orthogonal complement of C(A), i.e onto N(Aᵀ).
* Projection P = B(BᵀB)⁻¹Bᵀ onto an arbitrary subspace, where B is a matrix whose columns are the basis vectors.  For example, if A is not full column rank, we can make a new matrix B out of the pivot columns and use B(BᵀB)⁻¹Bᵀ to project onto C(A)=C(B).

**Further reading:** Strang, section 4.2 and video [lecture 15](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-15-projections-onto-subspaces/).

## Lecture 15 (October 15)

* [Gram–Schmidt notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Gram-Schmidt.ipynb)

Orthonormal bases, matrices Q with orthonormal columns q₁,q₂,… (QᵀQ = I):

* Saying that the columns of Q are orthonormal vectors is *equivalent* to saying QᵀQ = I.
  - It follows that ‖Qx‖=‖x‖, and more generally (Qx)ᵀ(Qy) = xᵀy: dot products and lengths are preserved.
* The projection matrix onto C(Q) is just QQᵀ=q₁q₁ᵀ+q₂q₂ᵀ+⋯.  (The rank-1 matrix q₁q₁ᵀ is projection onto the line αq₁.)  In general, the **q component of a vector can be found just by a dot product.**
  - Similarly, the least-squares solution x̂ minimizing ‖b-Qx‖ is just x̂=Qᵀb.

If a matrix Q with orthonormal columns is square, then it is called **orthogonal** (or **unitary**).

* In this case, QᵀQ=I means that Qᵀ = Q⁻¹.
  - It also follows that QQᵀ = I: a unitary matrix has orthonormal rows *and* columns.
* One way of looking at this: **to change "coordinates" to an orthonormal basis just involves dot products.**
  - If you have a non-orthonormal basis a₁,a₂,…, then to write an arbitrary vector b in this basis, i.e. b = a₁x₁ + a₂x₂ + ⋯ with coefficients x₁,x₂,…, you need to solve a linear system Ax=b for x.  Hard!  (∼m³).
  - For an orthonormal basis q₁,q₂,… then to write b = q₁x₁ + q₂x₂ + ⋯ you can **just take dot products** x=Qᵀb.  For example, if you take the dot product q₁ᵀb, then you get x₁ (the coefficient of q₁), because all the other terms have dot product *zero*.

Gram-Schmidt orthogonalization: given a non-orthonormal basis a₁,a₂,…, we can *convert* it to an orthonormal basis that **spans the same space**.  All we do is to **take each vector and subtract the projections onto the previous vectors** to make them orthogonal, and divide by their lengths to normalize them.

* Conceptually, it is clearest to go directly from a₁,a₂,… to q₁,q₂,…:
  - q₁ = a₁ / ‖a₁‖
  - q₂ = (a₂ - q₁q₁ᵀa₂) / ‖⋯‖: subtract the projection q₁q₁ᵀa₂ of a₂ onto q₁ to make them orthogonal.
  - q₃ = (a₃ - q₁q₁ᵀa₃ - q₂q₂ᵀa₃) / ‖⋯‖: subtract the projections of a₃ onto q₁ and q₂
  - etcetera
* For hand calculation, it is perhaps easier to defer square roots to the end: first we compute a basis v₁,v₂,… that is *orthogonal but not normalized* and then we normalize to q₁=v₁/‖v₁‖, q₂=v₂/‖v₂‖, etcetera at the end.
  - v₁ = a₁
  - v₂ = a₂ - v₁v₁ᵀa₂/v₁ᵀv₁
  - v₃ = a₃ - v₁v₁ᵀa₃/v₁ᵀv₁ - v₂v₂ᵀa₃/v₂ᵀv₂
  - etcetera ... note that the vᵢ vectors are still orthogonal, which is why projecting them is still easy, even though they are not normalized to have unit length.

(The process described above and in the book is known as "classical" Gram-Schmidt.  In practice, the computer actually uses more sophisticated algorithms.  But classical Gram-Schmidt is still a good way to *think* about the process.

**Further reading:** Strang, section 4.4, and video [lecture 17](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-17-orthogonal-matrices-and-gram-schmidt/).

## Lecture 16 (October 17)

* [pset 6 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset6sol.ipynb)
* pset 7 coming soon (due Wed Oct 24 at 10:55am)
* [Orthogonal polynomials](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Orthogonal-Polynomials.ipynb)

Continuing with the notes from last lecture, explored why QᵀA gives an upper triangular matrix.
The key fact turns out to be that Gram–Schmidt works from left to right, and only ever combines
columns with *earlier* columns, so that aₖ is in the span of q₁,…,qₖ.  This means that we can
write A=QR where R is an invertible *upper triangular* matrix, and the entries of R are just the
dot products and lengths that we computed during the Gram–Schmidt process.   In fact, this
means that we have discovered **another matrix factorization** (like A=LU) where we have
factored A into a product of two simpler matrices A=QR.  This is called **QR factorization**.

Using QR to solve the least-squares problem: given A=QR, the normal equations AᵀAx̂=Aᵀb turn into the triangular system of equations Rx̂=Qᵀb.

Key practical facts to keep in mind if you ever need to do least-squares or orthogonal basis for real-world problems (not 18.06 exams!) involving data with finite precision (e.g. measurement or rounding errors):

* The cost of QR factorization for an m×n is proportional to mn².  For a square m×m matrix it is therefore ~ m³, similar to other matrix factorizations.  (We could see this by estimating the number of operations in Gram–Schmidt, but it is also true for other QR algorithms.)

* On a computer, (almost) never explicitly form AᵀA or solve the normal equations: it turns out that this greatly exacerbates the sensitivity to numerical errors (in 18.335, you would learn that it squares the [condition number](https://en.wikipedia.org/wiki/Condition_number))  Instead, use the A=QR factorization and solve Rx̂=Qᵀb.  Better yet, just do `A \ b` (in Julia or Matlab) or the equivalent in other languages, which will use a good algorithm.

* On a computer, never use Gram–Schmidt for large matrices, which turns out to be notoriously sensitive to small errors if some vectors are nearly parallel.  People still compute the "same" QR factorization, just using different methods! There is an improved version called "modified Gram–Schmidt" described in the book, but in practice computers actually use a completely different algorithm called "Householder reflections."  You should just use the built-in `Q,R = qr(A)` or `qrfact(A)` function in Julia (or other languages), which will do the right thing most of the time.

This is not unusual: there is often a difference between the way we conceptually *think* about linear algebra and the more sophisticated tricks that are required to make it *work well* on *large matrices* of real data in the presence of small numerical errors.

Another wonderful and far-reaching application of these ideas is to realize that the same concepts of orthogonal bases and Gram–Schmidt can be applied to *any* vector space once we define a dot product (giving a so-called [Hilbert space](https://en.wikipedia.org/wiki/Hilbert_space), though we won't use that level of abstraction much in 18.06).  In particular, it turns out to be especially powerful to think about **orthogonal/orthonormal bases of functions**.  Introduced a dot product f⋅g=∫fg for functions defined on x∈[-1,1], and started deriving an orthogonal basis of polynomials via Gram–Schmidt on {1,x,x²,x³,…}, resulting in the famous and important [Legendre polynomials](https://en.wikipedia.org/wiki/Legendre_polynomials).

**Further reading:** Strang, section 4.4, and video [lecture 17](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-17-orthogonal-matrices-and-gram-schmidt/).  Many advanced linear-algebra texts talk about the practical aspects of roundoff errors in QR and least-squares, e.g. *Numerical Linear Algebra* by Trefethen and Bau (the 18.335 textbook), but this is beyond the scope of 18.06.  For orthogonal polynomials, see these [TAMU notes on orthogonal polynomials](http://www.math.tamu.edu/~yvorobet/MATH304-503/Lect4-04web.pdf) and [these 18.06 notes on orthogonal polynomials](http://web.mit.edu/18.06/www/Spring09/legendre.pdf).

## Exam 2 (Oct 26, 11am in 54-100)

Exam 2 will cover the material through **lecture 17** and **pset 7**: exam-1 material, four fundamental subspaces (relationships among, dimensions/bases of, & connections to Ax=b), full row/col rank vs. rank-deficient A, solvability of and complete solutions to Ax=b, rref form, linear independence, bases, transposes and dot products, rank-1 matrices xyᵀ, orthogonal subspaces/complements, projections, least-square solutions, orthogonal/orthonormal bases, Gram–Schmidt and QR factorization, derivatives of matrix/vector expressions, orthogonal functions.

*Not covered:* Newton's method.

*Note:* The average on exam 2 is typically quite a bit lower than on exam 1.  We take this into account in the grading, but don't be complacent if you did well on exam 1!  Exam 2 contains a lot of new material even for people who had seen some linear algebra before.

**Practice problems:** [fall 2017 exam 2](https://github.com/stevengj/1806/blob/fall17/exams/exam2.pdf) ([solutions](https://github.com/stevengj/1806/blob/fall17/exams/exam2-sol.pdf)); [spring 2018 exam 2](https://web.mit.edu/18.06/www/quiz2.1806.s18.pdf) ([solutions](https://web.mit.edu/18.06/www/quiz2solutions.pdf)) problems 1–2; [spring 2017 exam 2](http://web.mit.edu/18.06/www/Spring17/exam2.pdf)  ([solutions](http://web.mit.edu/18.06/www/Spring17/exam2-sol.pdf)) problems 1(b,c), 2, 3; [fall 2014 exam 1](http://web.mit.edu/18.06/www/Fall14/midterm1_F14.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall14/Midterm1solF14.pdf)) problems 3,4; [fall 2014 exam 2](http://web.mit.edu/18.06/www/Fall14/midterm2_F14.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall14/Midterm2solF14.pdf)) problem 1; [spring 2014 exam 1](http://web.mit.edu/18.06/www/Spring14/quiz_1_draft.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring14/quiz_1_solution.pdf)) problem 3; [spring 2014 exam 2](http://web.mit.edu/18.06/www/Spring14/quiz_2_draft.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring14/StrangExamAprilSolutions.pdf)) problems 1,2,4; [spring 2013 exam 2](http://web.mit.edu/18.06/www/Spring13/Exam2blank.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring13/Exam2.pdf)) problems 1, 3; [fall 2012 exam 2](http://web.mit.edu/18.06/www/Fall12/Exam%202/quiz2-1806-f12.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall12/Exam%202/quiz2-1806-f12-sol.pdf)) problems 1,3,4; [spring 2009](http://web.mit.edu/18.06/www/Spring09/quiz1-s09.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring09/quiz1-s09-soln.pdf)) problem 3; [spring 2009 practice exam 2](http://web.mit.edu/18.06/www/Spring09/practice-quiz2-S09.pdf) problems 1–17; [spring 2009 exam 2](http://web.mit.edu/18.06/www/Spring09/quiz2-s09.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring09/quiz2-s09-soln.pdf)) problem 1–3