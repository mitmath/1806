# Fall 2017 Lecture Summaries

This document is a *brief* summary of what was covered in each 18.06
lecture, along with links and suggestions for further reading.  It is
*not* a good substitute for attending lecture, but may provide a
useful study guide.

I'll try to update it within a day of each lecture.

## Lecture 1 (Sep 6)

* [course overview
slides](https://github.com/stevengj/1806/blob/master/lectures/overview.pdf) and [Gaussian
elimination notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Gaussian-elimination.ipynb)
* [pset 1](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset1.ipynb) (due Wed 9/13, 11am in your recitation box)

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

What comes next?  The problem with expressing Gaussian elimination this way, as operations on individual numbers in the matrix, is that it is impossible to follow the process in detail for anything except a very tiny matrix.   We need a higher-level way to express the process, both to help us understand it and also to help us to *use* it (e.g. to perform additional algebraic transformations afterwards).   To do this, we want to express the process, not as operations on individual numbers, but as [multiplications of whole matrices](https://en.wikipedia.org/wiki/Matrix_multiplication).

In particular, our goal in the next lectures will be to find a matrix E such that multiplying both sides of Ax=b by E (on the left) transforms it into upper-triangular form.  That is, Gaussian elimination turns Ax=b into EAx=Ux=Eb=c, where U is upper triangular.  *Amazing fact*: it will turn out that E is *lower* triangular, and that by writing U=EA we have effectively written A=E⁻¹U=LU, where L is lower triangular too.  This is called the [LU factorization of A](https://en.wikipedia.org/wiki/LU_decomposition), and is an *incredibly useful* way to look at Gaussian elimination.  The computer gives us L and U, and then given those matrices it turns out that we can figure out lots of things that would have been hard to do with A alone.

**Further reading:** Textbook sections 2.1 and 2.2.  Strang [lecture 2 video](https://www.youtube.com/watch?v=QVKj3LADCnA).

## Lecture 2 (Sep 8)

* [Matrix-multiplication and LU notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Matrix-mult-perspectives.ipynb)

Went over several different perspectives on matrix multiplication: the *same arithmetic operations* can be viewed as row×columns, matrix×columns, rows×matrix, columns×rows, and more.   If you are doing hand calculations (but who does that, really?), rows×columns is probably the easiest.  But the other viewpoints help us *think* about matrix multiplication in different ways, both to understand what is going on and also to *design* matrices to perform certain operations.

Using this understanding, we rewrote Gaussian elimination in matrix form: we multiply a matrix A on the *left* by a sequence of **lower**-triangular elimination matrices to arrive at an **upper**-triangular matrix U.    This turns out to be *extremely* useful
as both a computational and a theoretical tool, because triangular matrices are much easier to work with than general matrices — we've already seen that it is easy to solve triangular systems of equations, and we will find that they are nice in other ways as well.

In the next lecture, we will reverse the elimination steps to obtain the [LU factorization](https://en.wikipedia.org/wiki/LU_decomposition) A=LU.

**Further reading:** Textbook sections 2.4, 2.3, 2.6.  Strang [lecture 1 video](https://www.youtube.com/watch?v=ZK3O402wf1c), [lecture 4 video](https://www.youtube.com/watch?v=5hO3MrzPa0A).

## Lecture 3 (Sep 11)

* [Matrix inverse and LU notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Inverses-LU-intro.ipynb)

Introduction to the concept of a matrix inverse via the identity matrix.  Key ideas from the notebook:

* I is an identity matrix, the matrix that gives Ix=x for any x or IA=A and AI=A for any A.  There are m×m identity matrices for all m, and when we write "I" we usually infer from context how big an I we mean.
* A⁻¹ is the matrix that does the "reverse" of A: if Ax=b, then A⁻¹b=x (for any x).  (Equivalently, it gives the solution to Ax=b.)  It only exists for **square, nonsingular** matrices A.  (i.e. an m×m matrix A must give m nonzero pivots when you do elimination.)
* Equivalently, A⁻¹ is the matrix for which A⁻¹A = A⁻¹A = I (the m×m identity matrix).
* An important property: (AB)⁻¹ = B⁻¹A⁻¹.

Our first application is not to compute general matrix inverses, but rather to invert the elimination steps from the last lecture and compute the [LU factorization](https://en.wikipedia.org/wiki/LU_decomposition) A=LU of a matrix.  Inverting elimination steps is easy — by inspection, whenever we subtracted a multiple of a row, to invert it we just add instead — and turns out to be just flipping the signs of the entries below the diagonal.  Key idea:

* Gaussian elimination EA=U (without row swaps) can be thought of as A=LU: factorizing A into a **product of two simpler (triangular) matrices** (L=lower, U=upper).  U is the matrix that you normally get when you do elimination by hand, and L (the inverse of the elimination steps L=E⁻¹, a lower-triangular matrix with 1's on the diagonal) is essentially a *"record" of the elimination steps*.
* Computing L and U is hard (elimination is a lot of work, even for a computer), but once you have L and U then many things that you might want to do with A become easy.
  - For example, suppose you want to solve Ax=b, given A=LU.  Write LUx=b=L(Ux), and let y=Ux.  Then Ly=b, and we can solve for y by forward-substitution.  Given y, we can then solve Ux=y by back-substitution.  Both of these steps are easy because the systems are triangular.
  - This means that we can re-use L and U to solve Ax=b for *many right-hand sides*.   In contrast, if you "augment" A with b and then do elimination (A|b)⟶(U|y), you get the *same* new right-hand side y but you haven't kept a record of the elimination steps, so if you have a new right-hand side you might naively repeat the whole elimination process (hard!) rather than solving Ly=b (easy!).

In the next lecture (which will start with the end of this notebook), we will look at calculating inverses more generally (although it turns out that this is something that you should almost never do explicitly, even on a computer!).   I gave a quick preview of how to do it: from AA⁻¹ = I, it turns out that we just need to solve Ax=b for a sequence of right-hand sides b.  If the b's are the columns of I, then the x's will be the columns of A⁻¹!  And solving each of these right-hand sides is easy once you have A=LU.  (This is essentially how the computer gets A⁻¹ when you do `inv(A)`.)

**Further reading:** Textbook sections 2.5, 2.6.  Strang [lecture 4 video](https://www.youtube.com/watch?v=5hO3MrzPa0A) and [lecture 3 video](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-3-multiplication-and-inverse-matrices/).

## Optional Julia Tutorial (Monday Sep 11, 5pm, 32-155)

On **Monday** at 5pm, there will be an optional tutorial session in 32-155
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

## Lecture 4 (Sep 13)

* [pset 1 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset1-sol.ipynb)
* [pset 2](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset2.ipynb) (due Wed 9/20 at 11am)
* lecture notes: [Matrix inverses and complexity](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Inverses-Complexity-Transposes.ipynb)

Went through how to explicitly compute A⁻¹ by solving AA⁻¹ = I.  In particular, went through the Gauss–Jordan algorithm (on a 3×3 example that can also be found in the textbook): If we do row operations on A to get I, then the *same* row operations on I give A⁻¹!  To carry this out by hand, we augment (A|I), do ordinary Gaussian elimination to get (U|C), and then do elimination "upwards" to get (I|A⁻¹).  (This is not in the Julia notebook, but can be found in the textbook.)

In practice, people hardly ever do Gauss–Jordan anymore to get inverses by hand.  (For 2×2 and 3×3 matrices, you can just [google the formula](https://www.dr-lex.be/random/matrix-inv.html) for the inverse, while for larger matrices hand computation is too annoying to be practical.)  However, it *is* important to understand *why* it works, because understanding that gets at the heart of what elimination and inverses truly are.

Going through the Gauss–Jordan process also highlights how much unnecessary work it normally is to compute a matrix inverse.  For an m×m matrix A, finding A⁻¹ involves all the work to do Gaussian elimination on A *plus* all of the work to solve m right-hand-sides (the columns of I).   If you just want to solve Ax=b, you would have to be crazy to compute A⁻¹ first and then multiply A⁻¹b to get x — instead, just solve Ax=b directly, either via `A \ b` (on a computer) or by augmenting (A|b) and doing elimination and backsubstitution by hand.  Even if you have many right-hand sides, it is almost always a better idea to compute the LU factorization of A and then do back/forward-substitution for each new right-hand side.

This does not mean that matrix inverses are useless!  However, they are mainly a *conceptual* tool that we use to move matrices around *symbolically* in equations.   Once you are through with your algebraic manipulations, you might end up with an expression like A⁻¹b — but when it comes time to actually *compute* the answer, you should **read "A⁻¹b" as "solve Ax=b for x by the best available method"**.

* Complexity of matrix operations: why matrix × vector or backsubstitution scale like n² for n×n matrices, while matrix × matrix or Gaussian elimination (LU factorization) scale like n³.   Matrices much bigger than a few thousand square quickly become impractical, and really large problems are only tractable because they have special structure like sparsity.

(*Skipped the sections of the notebook on transposes and permutations, for now!*)

**Further reading:** Textbook sections 2.5, 2.6 ("The cost of elimination"), and 11.1.  Strang [video lecture 3](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-3-multiplication-and-inverse-matrices/).

## Lecture 5 (Sep 15)

* [LU factorization notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/LU-for-real.ipynb)

Went through a more realistic and complete discussion of LU factorization, with some blackboard aids, covering:

* How the L matrix entries are just the multipliers from Gaussian elimination.  No extra work is required!
* How in practice, one rarely "augments" the matrix with the right-hand side.  Instead, you compute A=LU, substitute this into Ax=b=LUx, let c=Ux, solve Lc=b, then solve Ux=c.  In particular, solving Lc=b is *exactly* the same as performing the Gaussian-elimination steps on c.  (The "augmented" method is a little easier for human bookkeeping, but has essentially no advantage for the computer.)
* Given A=LU, you can efficiently solve multiple right-hand sides, or equivalently the **matrix equation** AX=B.
* How row swaps lead to the factorization PA=LU: in practice, the computer *always* does row swaps, and always gives you a permutation matrix P (or its equivalent).

Next week, we will start talking more about singular matrices, subspaces, and the "null space" of a matrix.

**Further reading:** Textbook, sections 2.6, 2.7 (on permutations; we will talk about transposes a little later), and 11.1.  Strang [video lecture 4](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-4-factorization-into-a-lu/) and [video lecture 5](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-5-transposes-permutations-spaces-r-n/).   For 18.06, I *don't expect you to know* the details of how the permutation P in PA=LU is constructed even though you don't know the permutation in advance, but if you are interested it is described in [lecture 21 of *Numerical Linear Algebra* by Trefethen and Bau](http://library.books24x7.com.libproxy.mit.edu/assetviewer.aspx?bookid=9436&chunkid=389684869) (readable online with MIT certificates; this is a *graduate-level* textbook used for 18.335, so don't let it scare you!).

## Lecture 6 (Sep 18)

Defined the **rank** of a matrix = # pivots (note that pivots are nonzero by definition).   An invertible matrix, i.e. a square non-singular matrix, has **full rank**: rank = number of rows = number of columns; more generally, a non-square **full rank** matrix has rank equal to *either* the number of rows or columns (whichever is *smaller*).   A **rank-deficient** matrix has a rank *less than both* the number of rows or the number of columns.  Our main goal for the next few weeks will be to understand non-square and rank-deficient matrix problems.

Introduced vector spaces (a set V of anything you can add x+y and multiply by scalars αx) and subspaces (a subset of V such that vector operations *stay in the subspace*).  Examples of vector spaces include real n-component vectors (ℝⁿ, or ℂⁿ for complex numbers), real m×n matrices, functions f(x) (ℝ↦ℝ, real numbers to real numbers).  Examples of subspaces includes planes or lines through the origin in ℝ³, or the origin itself.   The goal of this is to break vector spaces into smaller pieces that we can still do linear algebra on (hence the need for a subspace, not just any arbitrary subset).

For an m×n matrix A, introduced two important subspaces.

* First, the column space C(A): the set {Ax for all x ∈ ℝⁿ}.  This is the set of *right-hand sides* b such that Ax=b is *solvable*, and is a subspace of ℝᵐ (not ℝⁿ unless m=n!).  Equivalently, C(A) is all linear combinations of the *columns* of A, which we call the **span** of the columns.
  - Did an 3×2 example in which C(A) was a plane in ℝ³, and noticed via elimination that the "dimensionality" ("2d") of this subspace matched the rank (2).
  - Did a 2×3 example in which C(A) was all of ℝ²: all right-hand sides b of Ax=b had solutions x.  (Again, the dimensionality of C(A) matched the rank of our example, and later we will see that this is generally true.) However, the matrix is not square and cannot be invertible, and the difference is that the solutions are *not unique*.

* Second, the null space (also called the "kernel") N(A): the set {x such that Ax=0} ⊆ ℝⁿ (i.e., a subspace of ℝⁿ).  Given any solution x to Ax=b, then x+z is also a solution if z ∈ N(A) (i.e. Az=0 ⟹ A(x+z)=Ax+Az=Ax=b).
  - In our 2×3 example, the null space was determined to be a *line* in ℝ³, and we saw that this gave a line of solutions.

These are very important subspaces because they tell us a lot about the matrix A and solutions to Ax=b.  As a trivial example, if A is an n×n *invertible* matrix, C(A)=ℝⁿ and N(A)={0}.  Conversely, if A is the n×n matrix of *all zeros* (the "most singular" matrix), then C(A)={0} and N(A)=ℝⁿ.  Our goal in the next lectures will be to understand how C(A) and N(A) relate to each other (and another two important subspaces) and to the *elimination* process on A, and then use this to find more systematic ways to compute/describe them.

**Further reading:** Textbook, sections 3.1 and 3.2; Strang [video lecture 6](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-6-column-space-and-nullspace/).

## Lecture 7 (Sep 20)

* [pset 2 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset2-sol.ipynb)
* [pset 3](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset3.ipynb), due Wed Sep 27

Generalizations of vector spaces and subspaces.  These aren't limited to the n-component vectors (ℝⁿ, or ℂⁿ for complex numbers) that we use in 18.06!  Other examples include real m×n matrices, functions f(x) (ℝ↦ℝ, real numbers to real numbers).  Examples of subspaces includes planes or lines through the origin in ℝ³, or the origin itself; polynomial functions; polynomials of degree ≤ 3, continuous functions, or functions that are zero at some points.   This generality is useful!  It is quite common to have problems where the unknowns are *matrices* rather than vectors (e.g. a [Sylvester equation](https://en.wikipedia.org/wiki/Sylvester_equation) or [multilinear algebra](https://en.wikipedia.org/wiki/Multilinear_algebra)) or problems where the unknowns are *functions* (e.g. partial differential equations like Maxwell's equations in electromagnetism and [functional analysis](https://en.wikipedia.org/wiki/Functional_analysis)), and the fact they they are vector spaces means that a lot of the tools and concepts of linear algebra can be applied.  (This happens in many engineering and physics courses; in math, see e.g. 18.303.)

More on nullspace and column space.  Reviewed the definitions, and the fact that Ax=b is solvable if and only if ("iff") b ∈ C(A).  Given a particular solution xₚ satisfying Axₚ=b, xₚ+x is *also* a solution for any x ∈ N(A).

Showed that N(A) ⊆ N(BA) for any matrix B, and that the two are equal
if B is invertible.  However, C(A) and C(BA) are in general quite
distinct (neither is contained in the other), although they have the
same dimension if B is invertible.  In consequence, elimination steps
(or any other row operations), which correspond to multiplying by
invertible matrices on the left, don't change the nullspace.

Defined a **basis** for a vector space as a *minimal* set of vectors (we
will later say that they have to be *linearly independent*) whose
**span** (all linear combinations) produces everything in the space.
The **dimension** of a vector space is the number of vectors in a
basis.

Went through a couple of examples of applying elimination to singular
and nonsquare matrices.  Defined the **rank** as the number of (nonzero)
pivots, the pivot columns, and the
free columns.  Showed that the null space is preserved by elimination, so that N(A)=N(U), and how we can solve for the null space by solving Ux=0: for each free column, we find a "special solution" (a linear combination of the pivot columns that cancels that free column), and this gives us a *basis* for the null space N(A).

* Understanding how the various fundamental subspaces like N(A) and C(A) are *affected by matrix operations*, e.g. elimination or factorization.

* Understanding how the rank r, the size m×n of the matrix, and the dimensions of the subspaces are *related*.

* Understanding how to determine the nullspace etc. for matrices with *special structure*, like upper-triangular matrices and (next time) the reduced row echelon form.

**Further reading:** Textbook, sections 3.2-3.3.  OCW video [lecture 6](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-6-column-space-and-nullspace/), [lecture 7](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-7-solving-ax-0-pivot-variables-special-solutions/)

## Lecture 8 (Sep 22)

In the previous lecture, we reduced an m×n matrix A to the form U=[T B], where T was an r×r upper-triangular matrix (r = rank) consisting of the pivot columns, and the remaining n-r "free" columns are B.  This situation is called **full row rank**: the rank equals the number of rows.

Since N(A)=N(U), to we can solve Ux=0 by breaking up x=(p,f) into the pivot rows p and the free rows f, and we find that they satisfy Tp=-Ff.  Since T is invertible, this means that we can choose *any f we want* and *p is determined*.   If we choose the usual basis (1,0,0,…), (0,1,0,…) for f∈ℝⁿ⁻ʳ and solve for p, this gives us the **special solutions**, a basis for N(A).    By the same reasoning we can see that the **dimension of N(A) is n-r**, #columns – #pivots.  This is **true for all matrices**, and is known as the [rank-nullity theorem](https://en.wikipedia.org/wiki/Rank%E2%80%93nullity_theorem).

Solving for the special solutions one by one is a bit tedious (but not hard since T is upper triangular: we use backsubstitution!), but there is a handy trick to solve for them all at once: the **reduced row echelon form** (abbreviated "rref").   Similar to Gauss–Jordan, we take U and eliminate "upwards" in the pivot columns to turn T into I, i.e. to **turn the pivot columns into an identity matrix**.   Then, in the full row rank case, we get a rref matrix R=[I F]: an r×r identity matrix followed by n-r free columns.   From this, showed a neat trick where we can just "read off" the special solutions: they are just -F "on top of" I!

* **Remark**: Though the rref form is a neat trick for hand calculation, as usual it is more important to understand *why* it works than to get really quick at the calculation itself.  (If you just try to memorize it, it is easy to get wrong.  When in doubt, just solve for the special solutions one by one, by setting the free rows of the solution to (1,0,0,…) etcetera!)   As a practical matter, the rref form is used almost exclusively for teaching.  (Even computer programs don't really use it.)

Given the special solutions, we can now find the **complete solution** (i.e., all solutions) to a non-square linear system Ax=b.  Elimination turns this into Ux=c or (in rref form) Rx=d. We look for solutions in the form xₚ + xₙ: a **particular solution** xₚ plus any vector xₙ in N(A) (specified explicitly by giving a basis).  The particular solution xₚ can be *any* solution to Ax=b, but the simplest one to find is usually to *set the free variables* to zero.  That is, we write the solution xₚ=(p; 0) where p is the unknown values in the pivot rows, setting the other (free) rows to zero, then plug into Uxₚ=c to get Tp=c (in the full row-rank case).  Since this is triangular and invertible, we can solve for any c, and find p to get xₚ.

Not every matrix is so nice, however.   I gave another 3×6 example matrix A (from Strang, section 3.3) that was **rank deficient**: after elimination, we only had two pivots (rank r=2) in the first two rows, and a whole row of zeros.   Furthermore, its pivot columns were the first and *third* columns, with the second and fourth columns being free — this is possible (albeit unusual)!   Showed that we could still get the special solutions by solving for the pivot variables in terms of the free variables = (1,0,…) etcetera, and we still got dimension n-r (= 2) for the null space.   When solving Ax=b by elimination into Ux=c, however, we *only got a solution x if c was zero in the same rows as U*.  If the zero third row of U was matched by a zero third row of c, then we got a particular solution as before by setting the free variables to zero.  If the zero third row of U was *not* matched by a zero third row of c, then there is *no* solution: b was *not in the column space* C(A).  In general, problems that are *not full row rank may not have solutions*.

**Further reading:** Textbook, sections 3.2-3.3.  OCW video [lecture 6](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-6-column-space-and-nullspace/), [lecture 7](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-7-solving-ax-0-pivot-variables-special-solutions/)

## Optional Exam 1 Review (Friday Sep 22, 4–5pm in 4-163)

In this optional review session, we'll just go over a few practice problems from past exams.  (The specific practice problems will be posted here after the review.)

* Practice problems covered (all from exam 1 of previous terms, see links below for solutions): fall 2008 problem 1, fall 2012 problem 2, fall 2012 problem 3, spring 2017 problem 4, fall 2014 problem 1, part of fall 2009 problem 1 (finding A⁻¹ from A=LU), spring 2017 problem 3a.

## Exam 1 (Sep 25, 11am in 50-340)

Exam 1 will cover the material through **lecture 6**: matrix-vector operations, matrix multiplication interpretations, writing/working with equations in matrix form, solving systems of equations with one or more right-hand side, Gaussian elimination, back/forward-substitution and triangular matrices, LU factorization and PA=LU, permutation matrices, matrix inverses and Gauss–Jordan, singular matrices, computational costs (which operations are ~ m² or ~ m³ and arranging calculations efficiently), rank of a matrix (= numbrer of pivots).  Some basics of column space C(A) and nullspace N(A) and subspaces: what it means to be a subspace (i.e. what things are subspaces and what aren't), and what the meanings of C(A) and N(A) are (but *not* how to find a basis).

*Note:* For scheduling reasons, exam 1 came a little earlier this term than in previous terms, so some of the topics on exam 1 from previous terms will have to wait until exam 2.  In particular, questions about "finding a basis" for various subspaces or finding the "complete solution" to a singular or non-square system of equations will *not* be asked on exam 1 (but *will* be on exam 2).

Practice problems: [spring 2017 exam 1](http://web.mit.edu/18.06/www/Spring17/exam1.pdf) problems 1a, 1c, 3a, 4 ([solutions](http://web.mit.edu/18.06/www/Spring17/exam1-sol.pdf));
[fall 2012 exam 1](http://web.mit.edu/18.06/www/Fall12/Exam%201/quiz1-1806-f12.pdf) problems 2, 3 ([solutions](http://web.mit.edu/18.06/www/Fall12/Exam%201/quiz1-1806-f12-solution.pdf));
[fall 2007 exam 1](http://web.mit.edu/18.06/www/Fall07/quiz1-1806-F07.pdf) problems 2, 3 ([solutions](http://web.mit.edu/18.06/www/Fall07/quiz1-1806-F07-sol.pdf)); [spring 2008 exam 1](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08.pdf) problems 1, 2 ([solutions](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08-soln.pdf));  [fall 2011 exam 1](http://web.mit.edu/18.06/www/Fall11/q1_f11.pdf) problem 2 ([solutions](http://web.mit.edu/18.06/www/Fall11/q1_f11_solution.pdf));
[spring 2012 exam 1](http://web.mit.edu/18.06/www/Spring12/q1_sp12.pdf) problem 4 ([solutions](http://web.mit.edu/18.06/www/Spring12/q1_sp12_sol.pdf));
[fall 2014 exam 1](http://web.mit.edu/18.06/www/Fall14/midterm1_F14.pdf) problems 1, 2 ([solutions](http://web.mit.edu/18.06/www/Fall14/Midterm1solF14.pdf);
[fall 2013 exam 1](http://web.mit.edu/18.06/www/Fall13/exam1_f13.pdf) problems 1a, 5 ([solutions](http://web.mit.edu/18.06/www/Fall13/exam1_f13_sol.pdf);
[fall 2009 exam 1](http://web.mit.edu/18.06/www/Fall09/exam1.pdf) problems 1, 2 ([solutions](http://web.mit.edu/18.06/www/Fall09/exam1soln.pdf));
[spring 2008 exam 1](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08.pdf) problems 1, 3
([solutions](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08-soln.pdf))

* [Exam 1](exams/exam1.pdf) and [solutions](exams/exam1-sol.pdf).

## Lecture 9 (Sep 27)

* [pset 3 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset3-sol.ipynb)
* [pset 4](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset4.ipynb) (due Wed Oct 4)

### Linear independence and a basis for C(A)

Started talking about bases, dimension, and independence.   Earlier, I defined a basis as a minimal set of vectors whose span gives an entire vector space, and the dimension of the space as the size of the basis.  Now, we want to think more carefully about the term "minimal".   If we have too many vectors in our basis, the problem is that some of the vectors might be redundant (you can get them from the other basis vectors).  We now rephrase this as saying that such vectors are *linearly dependent*: some linear combination (with nonzero multipliers) of them gives the zero vector, and we want every basis to be **linearly independent**.    The **dimension** of a subspace is still the number of basis vectors.

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

### Two more subspaces

The reason we are introducing transposes now is that we are missing two important subspaces, which turn out to be
the **row space** C(Aᵀ) and the **left nullspace** N(Aᵀ).

As usual with transposes, we expect to find a dot product somewhere, and in this case we will see that it is because the row space and the left nullspace are *orthogonal* to N(A) and C(A), respectively.

More on these next lecture!

**Further reading:** Textbook sections 3.4, 2.7.  [video lecture 5](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-5-transposes-permutations-spaces-r-n/), [lecture 9](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-9-independence-basis-and-dimension/).

## Lecture 10 (Oct 2)

In summary, for an m×n matrix A of rank r, we find the **four fundamental subspaces**:

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

Showed that these subspaces are **orthogonal complements**, defining the orthogonal complement S<sup>⟂</sup> of a subspace S as
{x such that xᵀy=0 for all y ∈ S}.  In particular, N(Aᵀ)=C(A)<sup>⟂</sup> and N(A)=C(Aᵀ)<sup>⟂</sup>.  This is why their dimensions sum to m and n, respectively: combining a basis for S and S<sup>⟂</sup> gives a basis for the whole vector space.

In particular, showed explicitly that if x is orthogonal to every vector in C(A), then x is necessarily in N(Aᵀ) (and vice versa), hence C(A) and N(Aᵀ) are orthogonal complements.   (The reasoning for C(Aᵀ) and N(A) is identical: just replace A with Aᵀ.)

This often gives an nice way to check if a vector is in C(A): b is in C(A) if and only if b is orthogonal to N(Aᵀ) (or to a basis thereof).   Gave an example where C(A) is a plane in ℝ³, N(Aᵀ) is the line through 0 orthogonal to that plane, and the equation for b ∈ C(A) was yᵀb=0 for a y ∈ N(Aᵀ).

As another example, considered **rank-1 matrices** uvᵀ for u∈ℝᵐ and v∈ℝⁿ: if u and v are nonzero, then uvᵀ is an m×n matrix of rank 1.   This is easy to see: every column is a multiple of u, so C(uvᵀ)=C(u) is 1d, and similarly the row space is the 1d subspace spanned by v.  Since the dimension of the column/row space is the rank, then the rank is 1.

**Further reading:** Textbook sections 3.5, 4.1; video
[lecture 10](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-10-the-four-fundamental-subspaces/), video [lecture 14](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-14-orthogonal-vectors-and-subspaces/)

## Lecture 11 (Oct 4)

* [pset 4 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset4-sol.ipynb)

* [pset 5](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset5.ipynb)

* [Graphs and networks notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Graphs-Networks.ipynb)

**Further reading:** Textbook section 10.1; video [lecture 14](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-12-graphs-networks-incidence-matrices/).

## Lecture 12 (Oct 6)

* [Multidimensional Newton’s method notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Multidimensional-Newton.ipynb)

The key point of this lecture is that *linear* algebra can even be used to solve *nonlinear* equations.  There are many methods to convert a nonlinear equation into a *sequence* of *approximate* linear equations whose solutions *converge* to the nonlinear solution.   The most famous is Newton’s method.  You learned the 1d version of Newton’s method in first-year calculus.  The generalization, for *n* nonlinear equations in *n* unknowns, is a sequence of *n*×*n* matrix problems.

**Further reading:** Strang's textbook does not discuss this topic.   [Section 9.6 of Numerical Recipes in C](http://www.it.uom.gr/teaching/linearalgebra/NumericalRecipiesInC/c9-6.pdf) is a decent high-level review.  A somewhat more mathematically sophisticated review can be found in [these lecture notes](http://fabcol.free.fr/pdf/lectnotes5.pdf) by [Fabrice Collard](http://fabcol.free.fr/notes.html) or in these [2014 notes](http://www.math.cmu.edu/CNA/summer_institute/2014/projects/SUAMI_revised_paper.pdf) by Nicolle Eagan.

## Lecture 13 (October 11)

* [pset 5 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset5-sol.ipynb)
* [pset 6](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset6.ipynb)
* [Least-square fitting notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Least-Square%20Fitting.ipynb)

Introduced the topic of least-square fitting of data to curves.  As long as the fitting function is linear in the unknown coefficients x, showed that minimizing the sum of the squares of the errors corresponds to minimizing the norm of the residual ‖b-Ax‖.   By straightforward (if somewhat tedious) calculus, found that this corresponds to solving the **normal equations** AᵀAx̂=Aᵀb for the fit coefficients x̂.  And we have enough linear algebra tools now to show that these equations are always solvable (uniquely if A has full column rank).

**Further reading:** Strang, section 4.3, and video [lecture 16](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-16-projection-matrices-and-least-squares/).  (Note that Strang does this in a little bit of a different order: he does orthogonal projection and then fitting, and I do the reverse in order to motivate these techniques with the real-world application of least-square fits.)   The brief discussion at the end of lecture on Runge phenomena and equally spaced vs. Chebyshev points in polynomial fitting was just "for fun and profit" — this material goes outside the scope of 18.06 — but if you are interested, the [book by Trefethen](https://people.maths.ox.ac.uk/trefethen/ATAP/) and accompanying [video lectures](https://people.maths.ox.ac.uk/trefethen/atapvideos.html) are a great place to start.

## Lecture 14 (October 13)

Orthogonal projection onto C(A) and other subspaces, and the projection matrix P.

* Projection matrix P = aaᵀ/aᵀa onto 1d subspaces with a basis vector a.
* Projection matrix P = A(AᵀA)⁻¹Aᵀ onto n-dimensional subspaces C(A), where A is m×n with full column rank (rank n).
* Equivalence between orthogonal projection and least-squares: minimizing ‖b-Ax‖ is equivalent to minimizing ‖b-y‖ over y∈C(A), and the solution is y=Ax̂=Pb, where AᵀAx̂=Aᵀb as before.
* Key properties P²=P, P=Pᵀ, C(P)=C(A), N(P)=N(Aᵀ).
* Projection I-P onto the orthogonal complement of C(A), i.e onto N(Aᵀ).
* Projection P = B(BᵀB)⁻¹Bᵀ onto an arbitrary subspace, where B is a matrix whose columns are the basis vectors.  For example, if A is not full column rank, we can make a new matrix B out of the pivot columns and use B(BᵀB)⁻¹Bᵀ to project onto C(A)=C(B).

**Further reading:** Strang, section 4.2, and video [lecture 15](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-15-projections-onto-subspaces/).

## Lecture 15 (October 16)

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

## Lecture 16 (October 18)

* [pset 6 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset6-sol.ipynb)
* [pset 7](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset7.ipynb)

Writing Gram–Schmidt in matrix form: it turns out that what we are "really" doing is factoring A=QR, where Q is a matrix with orthonormal columns spanning C(A) and R is an invertible upper-triangular matrix.

Using QR to solve the least-squares problem: given A=QR, the normal equations AᵀAx̂=Aᵀb turn into the triangular system of equations Rx̂=Qᵀb.

Key practical facts to keep in mind if you ever need to do least-squares or orthogonal basis for real-world problems (not 18.06 exams!) involving data with finite precision:

* Never explicitly form AᵀA or solve the normal equations: it turns out that this greatly exacerbates the sensitivity to numerical errors (in 18.335, you would learn that it squares the [condition number](https://en.wikipedia.org/wiki/Condition_number))  Instead, use the A=QR factorization and solve Rx̂=Qᵀb.  Better yet, just do `A \ b` (in Julia or Matlab) or the equivalent in other languages, which will use a good algorithm.

* Never use Gram–Schmidt for large matrices, which turns out to be notoriously sensitive to small errors if some vectors are nearly parallel.  People still compute the "same" QR factorization, just using different methods! There is an improved version called "modified Gram–Schmidt" described in the book, but in practice computers actually use a completely different algorithm called "Householder reflections."  You should just use the built-in `Q,R = qr(A)` or `qrfact(A)` function in Julia (or other languages), which will do the right thing most of the time.

This is not unusual: there is often a difference between the way we conceptually *think* about linear algebra and the more sophisticated tricks that are required to make it *work well* on *large matrices* of real data in the presence small numerical errors.

Another wonderful and far-reaching application of these ideas is to realize that the same concepts of orthogonal bases and Gram–Schmidt can be applied to *any* vector space once we define a dot product (giving a so-called [Hilbert space](https://en.wikipedia.org/wiki/Hilbert_space), though we won't use that level of abstraction much in 18.06).  In particular, it turns out to be especially powerful to think about **orthogonal/orthonormal bases of functions**.  Introduced a dot product f⋅g=∫fg for functions defined on x∈[-1,1], and we'll use it next time to make an orthogonal basis of polynomials.

**Further reading:** Strang, section 4.4, and video [lecture 17](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-17-orthogonal-matrices-and-gram-schmidt/).  Many advanced linear-algebra texts talk about the practical aspects of roundoff errors in QR and least-squares, e.g. *Numerical Linear Algebra* by Trefethen and Bau (the 18.335 textbook), but this is beyond the scope of 18.06.

## Lecture 17 (October 20)

* [Orthogonal polynomials](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Orthogonal-Polynomials.ipynb)

* [Fourier sine series](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Sine-series.ipynb)

Orthogonal and orthonormal bases of functions.  See the notebooks for two examples: orthogonal polynomials called [Legendre polynomials](https://en.wikipedia.org/wiki/Legendre_polynomials) and the [Fourier sine series](https://en.wikipedia.org/wiki/Fourier_sine_and_cosine_series).

**Further reading:** Strang, section 10.5 (Fourier series), these [18.06 sine-series notes](http://web.mit.edu/18.06/www/Spring09/sines.pdf), these [TAMU notes on orthogonal polynomials](http://www.math.tamu.edu/~yvorobet/MATH304-503/Lect4-04web.pdf) and [these 18.06 notes on orthogonal polynomials](http://web.mit.edu/18.06/www/Spring09/legendre.pdf).

## Lecture 18 (October 22)

* [Determinants notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Determinants.ipynb)

Explained determinants and their properties.  Considering how central a role determinants play for the 2×2 and 3×3 matrices you probably encountered before 18.06, you may be surprised that we didn't get to determinants until now.  The fact of the matter is that determinants play a much less important role in applied linear algebra for larger matrices — with a few exceptions, most things that you would want to use determinants for can be done more effectively in other ways.  They are a useful *conceptual* tool, however, especially for thinking about eigenvalues.

(Went through notes up to property 9.)

**Further reading:** Strang, section 5.1; video [lecture 18](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-18-properties-of-determinants).  (We will mostly skip Strang, section 5.2 and 5.3, because the formulas in those sections are nearly useless in computational settings for large matrices, as explained in the notebook.)

## Lecture 19 (October 24)

* [pset 7 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset7-sol.ipynb)
* [pset 8](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset8.ipynb) (due **Friday** November 3 at 11am)

Finished determinant notebook: det(A)=det(Aᵀ), and outlined the "big permutation formula" for determinants.  This last formula is not normally used for computing determinants (except maybe for 2×2 and 3×3), but is useful conceptually (e.g. it tells us that the determinant of an integer matrix is an integer).

Started on our main topic for exam 3, **eigenvalues and eigenvectors**.  The goal, for an m×m matrix A, is to find a "magic" vector x≠0 such that Ax=λx: for this special "eigenvector", the **matrix acts just like a scalar** λ (the "eigenvalue").   For such a vector, all of linear algebra would become trivially easy, for example A³x=λ³x and A⁻¹x=x/λ.

The trick is to figure out for **what λ an eigenvector exists**, and the key is to realize that Ax=λx is equivalent to (A-λI)x=0: an **eigenvector is a nonzero vector in N(A-λI)**.  Such a nonzero nullspace vector only exists when A-λI is singular, or equivalently **det(A-λI)=0**.  This gives us a way to find eigenvalues λ, and then to find the corresponding eigenvectors x.

Our "big permutation formula" is useful here: it tells us that det(A-λI) is a **polynomial of degree m** in λ, called the **characteristic polynomial**, and the eigenvalues are the **roots** of this polynomial.  This gives us a *lot* of information about eigenvalues.  In particular, I highlighted three points:

* An **m×m** matrix A will typically have **m eigenvalues**, since a degree-m polynomial typically has m roots.  (It could have fewer eigenvalues, since sometimes you get repeated roots, but we will defer that unusual case until later.)

* Even a **real matrix may have complex eigenvalues**, since real-coefficient polynomials may have complex roots.   We can't avoid complex numbers for much longer in 18.06!

* Computing eigenvalues of large matrices is hard, as hard as computing roots of high-degree polynomials.  Mostly, in 18.06 we will avoid the question of how to find eigenvalues and eigenvectors — the computer gives them to us — and focus on how to *use* them and what their properties are.
  - There is a [famous theorem](https://en.wikipedia.org/wiki/Abel%E2%80%93Ruffini_theorem) that there is no closed-form formula, like the quadratic formula, for the roots of polynomials of degree > 4.  Because of this, eigenvalue algorithms are intrinsically different than things like Gaussian elimination: instead of giving an "exact" answer in a finite number of steps, they only converge asymptotically towards the eigenvalues, giving you as many digits as you want but never quite giving an "exact" answer.

 **Further reading:** Strang, section 6.1; video [lecture 21](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-21-eigenvalues-and-eigenvectors/).

## Lecture 20 (October 26)

* [Eigenvalues and polynomials](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Eigenvalue-Polynomials.ipynb)

Reviewed eigenvalues, eigenvectors.

The eigenvalues are the roots of the characteristic polynomial det(A–λI). This
is a good way to *think* about eigenvalue problems (e.g. it tells you immediately
to expect ≤ m eigenvalues, possibly complex, from an m×m matrix).  But it is not
really a good way to compute them except for tiny (e.g. 2×2) matrices.

In fact, it's actually the reverse: one of the best ways to compute roots of
polynomials is to convert the polynomial into a matrix and find the eigenvalues.
Showed how this is done, by constructing the *companion matrix* to a polynomial.

The actual way eigenvalues are computed is a topic for another class (e.g. 18.335);
in 18.06, we will focus mainly on their properties and usage.  The computer
will mostly handle finding them.

Started using the *basis* of eigenvectors:

* The key way we use eigenvectors is to take *any* vector x and write it in the basis of eigenvectors xᵢ.  Then, for any linear operation involving A, you replace A by the number λᵢ when acting on each xᵢ.  Finally, you add up the eigenvectors.

Applied this process to the 2×2 matrix from the notebook, expanding the vector x=(3,4)=2x₁+x₂.   Then, for example, A⁻¹ or A¹⁰⁰ or A⁻¹⁰⁰ acting on x just becomes λ⁻¹ or λ¹⁰⁰ or λ⁻¹⁰⁰ multiplying each eigenvector.    We can see that, for example, A¹⁰⁰x is approximately parallel to x₂ (the eigenvector with the biggest |λ|), and that Aⁿx blows up as n⟶+∞ and vanishes as n⟶-∞.  Matrix powers turn out to be incredibly useful, so we will spend more time on this in subsequent lectures.

**Further reading:** Strang, section 6.1 and video [lecture 21](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-21-eigenvalues-and-eigenvectors/)

## Optional Exam 2 Reviews (Thursday and Friday)

There will be two optional review sessions for exam 2:

* Thursday Oct 26, 4–5pm, room 4-370 (S. G. Johnson).  Did spring 2014 exam 1 problem 2, spring 2009 exam 2 problem 3, spring 2017 exam 2 problem 3, and spring 2009 exam 2 problem 2.
* Friday Oct 27, 4–5pm, room 2-449 (I. Vogt).

In these optional review sessions, we'll mainly just go over a few practice problems from past exams.  (The specific practice problems will be posted here after the review.)

## Exam 2 (Oct 30, 11am in 50-340)

Exam 2 will cover the material through **lecture 17** and **pset 7**: exam-1 material, four fundamental subspaces (relationships among, dimensions/bases of, & connections to Ax=b), full row/col rank vs. rank-deficient A, solvability of and complete solutions to Ax=b, rref form, linear independence, transposes and dot products, rank-1 matrices xyᵀ, orthogonal subspaces/complements, projections, least-square solutions, orthogonal/orthonormal bases, Gram–Schmidt and QR factorization, graphs and incidence matrix, derivatives of matrix/vector expressions.

*Not covered:* Physics (e.g. Kirchhoff's laws … but if you are *given* an equation from physics etcetera, you should of course be able to translate it into linear-algebra form), Newton's method, dot products of functions and orthogonal functions, determinants.

*Note:* The average on exam 2 is typically quite a bit lower than on exam 1.  We take this into account in the grading, but don't be complacent if you did well on exam 1!  Exam 2 contains a lot of new material even for people who had seen some linear algebra before.

**Practice problems:** [spring 2017 exam 2](http://web.mit.edu/18.06/www/Spring17/exam2.pdf)  ([solutions](http://web.mit.edu/18.06/www/Spring17/exam2-sol.pdf)) problems 1(b,c), 2, 3; [fall 2014 exam 1](http://web.mit.edu/18.06/www/Fall14/midterm1_F14.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall14/Midterm1solF14.pdf)) problems 3,4; [fall 2014 exam 2](http://web.mit.edu/18.06/www/Fall14/midterm2_F14.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall14/Midterm2solF14.pdf)) problem 1; [spring 2014 exam 1](http://web.mit.edu/18.06/www/Spring14/quiz_1_draft.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring14/quiz_1_solution.pdf)) problems 1–3; [spring 2014 exam 2](http://web.mit.edu/18.06/www/Spring14/quiz_2_draft.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring14/StrangExamAprilSolutions.pdf)) problems 1,2,4; [fall 2013 exam 1](http://web.mit.edu/18.06/www/Fall13/exam1_f13.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall13/exam1_f13_sol.pdf)) problem 2; [spring 2013 exam 1](http://web.mit.edu/18.06/www/Spring13/Exam1blank.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring13/Exam1.pdf)) problem  2; [spring 2013 exam 2](http://web.mit.edu/18.06/www/Spring13/Exam2blank.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring13/Exam2.pdf)) problems 1, 3; [fall 2012 exam 1](http://web.mit.edu/18.06/www/Fall12/Exam%201/quiz1-1806-f12.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall12/Exam%201/quiz1-1806-f12-solution.pdf)) problem 4; [fall 2012 exam 2](http://web.mit.edu/18.06/www/Fall12/Exam%202/quiz2-1806-f12.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall12/Exam%202/quiz2-1806-f12-sol.pdf)) problems 1,3,4; [spring 2009](http://web.mit.edu/18.06/www/Spring09/quiz1-s09.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring09/quiz1-s09-soln.pdf)) problem 3; [spring 2009 practice exam 2](http://web.mit.edu/18.06/www/Spring09/practice-quiz2-S09.pdf) problems 1–17; [spring 2009 exam 2](http://web.mit.edu/18.06/www/Spring09/quiz2-s09.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring09/quiz2-s09-soln.pdf)) problem 1–3

* [Exam 2](exams/exam2.pdf) and [solutions](exams/exam2-sol.pdf).

## Lecture 21 (November 1)

* [Diagonalization](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Diagonalization.ipynb)

Covered **diagonalization** of a matrix: the process of expanding a vector in the basis of eigenvectors, then multiplying each one by λ, then adding up the eigenvectors with the new coefficients, can be thought of as the matrix factorization A=XΛX⁻¹, where X is the matrix whose columns are the eigenvectors.   This only works if X is invertible: i.e. when for an m×m matrix A we have m eigenvalues (possibly repeated) and m independent eigenvectors (a *basis* of eigenvectors).  Such a matrix is called **diagonalizable**.

It turns out that **almost all matrices in practice are diagonalizable**, so for the most part we will only deal with diagonalizable matrices in 18.06.  The exceedingly rare exceptions are called **defective** matrices (and can only occur when there are *repeated roots* in the characteristic polynomial); we will talk about such defective (non-diagonalizable) cases much later.

Defined [similar matrices](https://en.wikipedia.org/wiki/Matrix_similarity) B=M⁻¹AM, and showed that similar matrices have the same *eigenvalues* (with eigenvectors related by a factor of M), the same *determinant*, the same *characteristic polynomial*, and the same *trace*.  Defined the [trace](https://en.wikipedia.org/wiki/Trace_(linear_algebra)) of a matrix tr(A),
and showed tr(AB)=tr(BA) for any m×n matrix A and n×m matrix B.  (Similar matrices essentially
represent the same linear operation in a different coordinate system.)  In hindsight, we
now see that a diagonalizable matrix A is *similar to a diagonal matrix Λ*.  Hence, we
see that det(A) is the *product* of the eigenvalues and tr(A) is the *sum* of the eigenvalues.

For a 2×2 matrix, it follows that det(A-λI)=λ²-λtr(A)+det(A), which is a useful formula when solving 2×2 eigenproblems.

**Further reading:** Strang, section 6.2; video [lecture 22](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-22-diagonalization-and-powers-of-a/) and video [lecture 28](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-28-similar-matrices-and-jordan-form/).

## Lecture 22 (November 3)

* [pset 8 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset8-sol.ipynb)
* [pset 9](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset9.ipynb) (due **Wednesday** Nov. 8 at 11am)

* [Diagonalization](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Diagonalization.ipynb)
* skipped: [Fibonacci numbers](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Fibonacci.ipynb)
* [Markov matrices](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Markov.ipynb)

Briefly reviewed diagonalization etcetera.   Showed a useful formula for 2×2 matrix calculations in terms of trace and determinant: for a 2×2 matrix A, the characteristic polynomial det(A-λI) is λ²-λ⋅tr(A)+det(A).

Diagonalization of matrix powers (see notebook): Aⁿ=XΛⁿX⁻¹.  This even works for non-integer n!    As an example considered the **matrix square root**, a matrix √A such that √A squared gives A.  For a diagonalizable matrix, this is easy to find: we just use √A=X√ΛX⁻¹, where √Λ is the diagonal matrix with √λ on the diagonal.  Equivalently, for an eigenvector Ax=λx, √Ax=√λx: the matrix acts like a number λ, so √A acts like √λ on an eigenvector.   Used this to explicitly compute the square root of our 2×2 example matrix.

Started discussing [Markov matrices](https://en.wikipedia.org/wiki/Stochastic_matrix).  Got through the notebook up to the point where we showed that there is a steady-state (λ=1) eigenvector.

**Further reading:** Strang, sections 6.2, 8.3, video [lecture 22](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-22-diagonalization-and-powers-of-a/), and video [lecture 24](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-24-markov-matrices-fourier-series/).

## Lecture 23 (November 6)

* [Markov matrices](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Markov.ipynb)
* [Analyzing Chutes & Ladders](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Chutes-and-Ladders.ipynb)

Finished Markov matrices notebook.

Spent a little time on an example of a Markov-matrix application: analyzing the game "Chutes and Ladders".   (Note that this is not a statistics class, so the calculations analyzing the probability distribution of the number of moves were just for fun.)

**Further reading:** Strang, section 8.3 and video [lecture 24](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-24-markov-matrices-fourier-series/).

## Lecture 24 (November 8)

* [pset 9 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset9-sol.ipynb)
* [pset 10](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset10.ipynb) (due Wednesday Nov. 15 at 11am)

* [Ordinary differential equations (ODEs)](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/ODEs.ipynb).

We can now solve systems of ODEs dx/dt = Ax in terms of eigenvectors and eigenvalues.
Each eigenvector is multiplied by exp(λt) (where exp(x)=eˣ), so that solutions decay
if the eigenvalues have *negative real parts* (and approach a nonzero steady state
if one eigenvalue is *zero*).  Next time, we will also express this in terms of a new
Matrix operation eᴬᵗ, the [matrix exponential](https://en.wikipedia.org/wiki/Matrix_exponential).

**Further reading:** Strang, section 6.3 and video [lecture 23](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-23-differential-equations-and-exp-at/).

## Lecture 25 (November 13)

* [Matrix exponentials eᴬ](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Matrix-Exponentials.ipynb).

Continued discussion of ODEs from last lecture, focusing now on oscillating solutions and complex eigenvalues λ (see notebook).   Then reformulated the solution of dx/dt=Ax in terms of the [matrix exponential](https://en.wikipedia.org/wiki/Matrix_exponential) eᴬᵗ, and discussed the properties of this fascinating and important matrix operation.

**Further reading:** Strang, section 6.3 and video [lecture 23](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-23-differential-equations-and-exp-at/).


## Lecture 26 (November 15)

* [pset 10 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset10-sol.ipynb)
* [pset 11](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset11.ipynb) (due Wednesday Nov. 22 at 11am; electronic submission on Stellar is acceptable)

Finished matrix-exponential notes from lecture 25.

Began discussing **symmetric matrices**.  A real-symmetric matrix A
(i.e. a real A where A = Aᵀ), has three key properties:

* All the eigenvalues λ are **real**.  (It follows that the eigenvectors are real too.)
* Eigenvalues for different λ are **orthogonal** (and hence eigenvectors can be chosen to be **orthonormal**).
* The matrix is always **diagonalizable** (no funny defective case).

This is extremely important.  Just by looking at the *structure* of such a matrix,
we learn a lot.   And symmetric matrices come up in lots of physics and engineering
applications (e.g. we already saw the symmetric matrix AYAᵀ in circuit problems),
and the properties above are often intimately related to crucial physical facts.

### Complex matrices, vectors, and dot products: the adjoint H

To prove the facts claimed about symmetric matrices above, we need
to generalize our notion of a "dot product" to complex vectors.  The "transpose"
is actually not the right notion here.  Instead, we define:

* xᴴ and Aᴴ are the **conjugate-transpose** of a vector or matrix (that is, you transpose and then take the complex conjugate of every element).  This is also called the ("Hermitian") [adjoint](https://en.wikipedia.org/wiki/Conjugate_transpose) operation.  *For a real matrix, the adjoint is the same as the transpose.*

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

### Hermitian and real-symmetric matrices

Now, given a Hermitian matrix A=Aᴴ (= real-symmetric if A is real), we can
easily prove that the eigenvalues are real.  Given an eigensolution Ax=λx, we
just took the dot products of both sides with x:

* xᴴAx=λxᴴx=(Aᴴx)ᴴx=(Ax)ᴴx=(λx)ᴴx=λ̄xᴴx

Since x≠0 for any eigenvector, we have xᴴx>0 and can divide by it to obtain
λ=λ̄, which means that **λ is real**.  (It follows that the eigenvector x is also real *if*
the matrix A is real-symmetric.)

**Further reading:** Strang, sections 6.3–6.4, 9.2; video [lecture 23](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-23-differential-equations-and-exp-at/), [lecture 25](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-25-symmetric-matrices-and-positive-definiteness/), and [lecture 26](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-26-complex-matrices-fast-fourier-transform/).


## Lecture 27 (November 17)

Continued discussing **Hermitian matrices** A = Aᴴ.  (Real-symmetric matrices are a special case of this.)  These have three key properties.

* All the eigenvalues λ are **real**.  (The eigenvectors are *not* generally real unless A is real.)_
* The matrix is always **diagonalizable** (no funny defective case).
* Eigenvalues for different λ are **orthogonal** (and hence eigenvectors can be chosen to be **an orthonormal basis**).

We showed that λ is real in the previous lecture.

Similarly, given two eigensolutions Ax₁=λ₁x₁ and Ax₂=λ₂x₂ with λ₁≠λ₂, we
can take the dot product x₁ᴴAx₂=λ₂x₁ᴴx₂=⋯, and after a couple of lines
we immediately found x₁ᴴx₂=0.  The **eigenvectors are orthogonal**, and
they can be chosen (scaled) to be **orthonormal**.

I didn't prove diagonalizability.  (There are various proofs you can easily find online.  See e.g. [this video](https://www.youtube.com/watch?v=_2gGqEGA_IY) if you are curious, but
they seem slightly too tricky for 18.06.)

Since a **Hermitian matrix has an orthonormal basis of eigenvectors**, we
can call the eigenvectors q₁,q₂,⋯, and put them as the columns of a
**unitary** matrix Q (= orthogonal if A is real).  (Formerly, we called this X.)
We can write:

* A = QΛQᴴ = ∑ₖ λₖqₖqₖᴴ

Equivalently, to **expand an arbitrary vector x** in the eigenvector basis,
we **just need to take dot products**.   Formerly, to write x=∑ₖcₖxₖ, to find
the coefficients c we had to solve Xx=x, or c=X⁻¹x.   Now, to write x=∑ₖcₖqₖ,
the coefficients are just **cₖ=qₖᴴx**, or x=∑ₖqₖ(qₖᴴx).  *Expressing a vector
in an orthonormal basis is easy.*

Gave some examples of how you could use this to more easily understand
e.g. working out Aⁿx if A is Hermitian (or real-symmetric).

### Positive-definite/semidefinite matrices

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
"> 0" with "≥ 0", and A = BᴴB is positive semidefinite for *any* B (not necessarily full rank).  (The pivots are > 0, but A may be singular.)

(There are also "negative definite" and "negative semidefinite" matrices, which
are the same things except with the opposites signs, i.e. "< 0" or "≤ 0" above.)

**Further reading:** Strang, sections 6.4–6.5, 9.2, and video [lecture 25](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-25-symmetric-matrices-and-positive-definiteness/) and [lecture 26](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-26-complex-matrices-fast-fourier-transform/).

# Lecture 28 (Nov 20)

* [SVD](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/SVD.ipynb)

The **singular value decomposition** (SVD), with application to image processing.

* Defined the SVD, both as the factorization A=UΣVᵀ and by writing A as a sum of rank-1 matrices.

* Explained how the singular vectors (columsn of U and V) give (arguably) the "best" orthonormal bases for the four subspaces of A.

* Discussed the usage of the SVD for [low rank approximation](https://en.wikipedia.org/wiki/Low-rank_approximation): if we take only a few of the biggest singular values σ and drop the remaining terms, then we have a lower-rank *approximation* for A that is often very good.   Showed graphically how this gives a "compressed" version of some images — often just a few of the singular values suffices to make the image recognizable.

* Connection of SVD to eigenvalues:  showed that the singular values σ² are the *nonzero eigenvalues* of *either* AᵀA *or* AAᵀ, the right singular vectors v are corresponding eigenvectors of  AᵀA, and the left singular vectors are eigenvectors of AAᵀ.   Long ago, we already showed that rank(AᵀA)=rank(AAᵀ)=rank(A)=rank(Aᵀ).   Now, showed that AᵀA and AAᵀ always have the *same nonzero eigenvalues*.  They can have different numbers of *zero* eigenvalues because N(AᵀA)=N(A) ≠ N(Aᵀ)=N(AAᵀ) in general.

**Further reading:** Strang, sections 7.1–7.2, and video [lecture 29](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-29-singular-value-decomposition/)

# Lecture 29 (Nov 22)

* [pset 11 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset11-sol.ipynb)
* pset 12: no pset this week

As an application of real-symmetric and positive-definite matrices, I returned
to the system of masses and springs from lecture 23, but this time I considered
n masses m and n+1 springs.   I showed that Newton's laws take the form:

* mẍ = -DᵀKDx ⟹ ẍ = Ax, where D is an incidence matrix, K is a diagonal matrix of spring constants, and A=-DᵀWD where W=K/m.

A is obviously real-symmetric, so its eigenvalues λ are real.  With a little more work, we saw that it must be negative-definite.  In particular, take any eigensolution Ax=λx for x≠0.  We showed that xᵀAx=λxᵀx<0, which implies λ<0.  The reason is that xᵀAx=-xᵀDᵀWDx=-(Dx)ᵀWDx=-yᵀWy where y=Dx, and (i) y≠0 since D is full column rank (Dᵀ is upper triangular so we could just "read off" its rank), and (ii) W is a diagonal matrix of positive entries so it is automatically positive-definite, or alternatively we can just write out yᵀWy and see that it is positive for y≠0.

The fact that A is negative definite allowed us to derive that *any* such system of masses and springs has *orthogonal oscillating solutions* called the [normal modes](https://en.wikipedia.org/wiki/Normal_mode). In particular, given the eigenvectors qⱼ (chosen orthonormal), satisfying Aqⱼ=λⱼqⱼ with λⱼ>0, we expanded the solution x(t)=∑ⱼcⱼqⱼ in the basis of these eigenvectors.  For each eigenvector component, the matrix A acts just like a number λ, allowing us to easily solve the equation c̈ⱼ=-λⱼcⱼ to get sines and cosines, and hence to get the general solution:

* x(t) = ∑ⱼ [αⱼ cos(ωⱼt) + βⱼ sin(ωⱼt)] qⱼ

where ωⱼ=√-λⱼ, and αⱼ and βⱼ are determined from the initial conditions x(0) and ẋ(0).  (You solved a similar problem in homework, except that there the matrix A had no special structure.)

The key point is that the **structure** of the problem told us that λⱼ<0 and
hence that the **frequencies** ωⱼ are **real** numbers.  (If they were complex, we would have exponentially growing or decaying solutions, which would make no physical sense for a system of lossless springs and masses.)  The moral of this story is that Hermitian and definite matrices don't just fall down out of the sky, they arise from how the matrix was constructed, and that these matrix properties are often the key to understanding the physical properties of real problems.

Finally, for fun, I pointed out that essentially the same structure A=-DᵀWD arises for *two-dimensional grids of springs and masses*.  D is still the incidence matrix, just for a more complicated graph, and W is still a diagonal matrix of spring constants divided by masses.   I showed some example eigenfunctions from various such grids, which can be thought of as the **oscillating modes of a drum** (stretched membrane).

**Further reading:** Strang, section 10.2.  See also [these notes on the springs-and-masses problem](http://math.mit.edu/~stevenj/18.303/lecture-5.5.pdf) from [18.303](http://math.mit.edu/~stevenj/18.303/) (you can ignore the last two pages, which go beyond 18.06, and ignore the Δx factor which is used in 18.303 to connect the discrete problem to a continuous problem).  My vibrating-drum examples were taken from this [18.303 notebook](http://nbviewer.jupyter.org/url/math.mit.edu/~stevenj/18.303/min-max-examples.ipynb),
but the math in that notebook is focused on another topic that may be a bit hard to follow for 18.06 students.

## Exam 3 (Nov 27, 11am in 50-340)

Exam 3 will cover the material through **lecture 27** and **pset 11**: exam-1 and exam-2 material, determinants, eigenvalues/eigenvectors, diagonalization, similar matrices, matrix powers and linear recurrences xₙ=Aⁿx₀, linear ODEs, matrix exponentials, complex matrices and the adjoint Aᴴ, real-symmetric/Hermitian matrices, positive-definite matrices.

Not covered: SVD or singular values.

* Review session: Tuesday, Nov. 21, 4–5pm, in room 2-190.  Covered Spring 2009 exam 3 problems 2–3, Fall 2006 exam 3 problem 2, Fall 2007 exam 3 problem 2, and Fall 2013 exam 2 problem 3a–c.

* Practice problems: [Spring 2009 exam 3](http://web.mit.edu/18.06/www/Spring09/examsS09.html); [Spring 2014 exam 3, problems 1–2](http://web.mit.edu/18.06/www/Spring14/oldS14.html) ([solutions](http://web.mit.edu/18.06/www/Spring09/quiz3-s09-soln.pdf)); [Fall 2013 exam 2, problem 3](http://web.mit.edu/18.06/www/Fall13/exam2_f13.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall13/exam2_f13_sol.pdf)); [Fall 2013 exam 3, problems 2–3](http://web.mit.edu/18.06/www/Fall13/oldF13.html) ([solutions](http://web.mit.edu/18.06/www/Fall13/exam3_f13_sol.pdf)); [Fall 2012 exam 3, problem 1](http://web.mit.edu/18.06/www/Fall12/oldF12.html) ([solutions](http://web.mit.edu/18.06/www/Fall12/Exam%203/quiz3-1806-f12-solution.pdf)); [Spring 2012 exam 3, problems 1, 2, 3a, 3b](http://web.mit.edu/18.06/www/Spring12/oldS12.html) ([solutions](http://web.mit.edu/18.06/www/Spring12/q3_sp12_sol.pdf)); [Fall 2011 exam 3, problems 1.1, 1.2, 3](http://web.mit.edu/18.06/www/Fall11/oldF11.html) ([solutions](http://web.mit.edu/18.06/www/Fall11/q3_f11_sol.pdf)); [Fall 2011 exam 2, problem 3](http://web.mit.edu/18.06/www/Fall11/q2_f11.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall11/q2_f11_sol.pdf)); [Fall 2007 exam 3](http://web.mit.edu/18.06/www/Fall07/examsF07.html) ([solutions](http://web.mit.edu/18.06/www/Fall07/quiz3-1806-F07-sol.pdf))

* [Exam 3](exams/exam3.pdf) and [solutions](exams/exam3-sol.pdf).

# Lecture 30 (Nov. 29)

* [Statistics and PCA](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Statistics-and-PCA.ipynb)
* [Eigen-walker demo](https://www.biomotionlab.ca/Demos/BMLwalker.html)
* pset 12: coming soon.

Discussed the relationship of mean, variance, and covariance/correlation to linear algebra, expressing them in terms of dot products and projections.  Given an m×n matrix A whose rows are a bunch of different datasets, with the means subtracted, defined the covariance matrix S=AAᵀ/(n-1).   The eigenvectors of S define a coordinate system of *uncorrelated variables*, with the eigenvalues λ=σ² being the variances in each uncorrelated direction.   This is called **principal components analysis** in statistics, and allows us to identify the *uncorrelated variables that are responsible for most of the variation* (biggest σ²) in the data.

Showed that PCA is exactly what the SVD of A gives us.  The left singular vectors of A are precisely the orthonormal eigenvectors of AAᵀ, and the singular values σ are precisely the square roots of the variances (if you normalize correctly).

Gave some examples (see notebook), and closed with the [eigen-walker data](http://blogs.mathworks.com/cleve/2016/04/11/the-eigenwalker-model-of-the-human-gait/): PCA from a real experiment measuring human gaits, resulting in the cool animation of the singular vectors linked above.

**Further reading**: Strang book, sections 7.3, 12.1, 12.2.  Googling "principal components analysis" or looking it up in any applied-statistics textbook will give you a lot more detail and examples.

# Lecture 31 (Dec 1)

* [Notes on Jordan vectors](lectures/jordan-vectors.pdf)
* [pset 12](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset12.ipynb) (due **Friday** Dec. 8 at 11am)

Most matrices are diagonalizable.  (*Any* n×n matrix with n distinct eigenvalues is diagonalizable, as is *any* Hermitian A=Aᴴ, unitary A⁻¹=Aᴴ, or anti-Hermitian A=-Aᴴ matrix.)  Non-diagonalizable matrices in practical situations typically arise only by design: you start with a "non-normal" matrix and play with the entries until you *force* two eigenvalues and eigenvectors to coincide.  This does not mean that such "exceptional" or "defective" cases are not interesting, however!   Even more commonly, on encounters a matrix that is *nearly* defective (i.e. the matrix X of eigenvectors is *nearly singular*).

To understand what happens with defective matrices, I introduce Jordan vectors (also called [generalized eigenvectors](https://en.wikipedia.org/wiki/Generalized_eigenvector) and Jordan chains.  I don't focus on formal proofs of the *existence* of these chains and the theoretical construct of the "Jordan form" of a matrix.  Instead, I want to explore their *consequences* for the Aⁿx and dx/dt=Ax types of problems that we have spent a lot of time on.  We show that, for a defective A, Aⁿx gives an extra term that grows as n×λⁿ, not just λⁿ!  And dx/dt=Ax gives an extra term that grows as t×exp(λt), not just exp(λt).

**Further reading**: Strang book, section 8.3.  Going far beyond 18.06, there is a wonderful book, *Spectra and Pseudospectra* by Trefethen and Embree, entirely devoted to cases where diagonalization fails (or nearly fails).

# Lecture 32 (Dec 4)

* [Circulant matrices](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Circulant-Matrices.ipynb)

In this lecture, I want to introduce you to a new type of matrix: circulant matrices. Like Hermitian matrices, they have orthonormal eigenvectors, but unlike Hermitian matrices we know exactly what their eigenvectors are! Moreover, their eigenvectors are closely related to the famous Fourier transform and Fourier series. Even more importantly, it turns out that circulant matrices and the eigenvectors lend themselves to incredibly efficient algorithms called FFTs, that play a central role in much of computational science and engineering.

**Further reading**: The textbook, sections 8.3 and 9.3, has some basic information on these topics.  The Wikipedia articles on [Circulant matrix](https://en.wikipedia.org/wiki/Circulant_matrix), [discrete Fourier transform](https://en.wikipedia.org/wiki/Discrete_Fourier_transform), and [fast Fourier transform](https://en.wikipedia.org/wiki/Fast_Fourier_transform) aren't too bad.  Some [elementary lecture notes on FFTs](https://math.mit.edu/~stevenj/18.335/fft-iap3.pdf) from 18.095 talk more about the algorithms.

# Lecture 33 (Dec 6)

* [Errors and condition numbers](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Conditioning.ipynb)

When doing numerical calculations, we keep running into little roundoff errors that arise from the computer only keeping a finite number of digits in its arithmetic.   Mostly, we've been ignoring these or waving our hands, but a huge branch of mathematics is devoted to the origin and propagation of **errors** in calculations.

In this lecture, we take a first step in that subject by asking a simple question: if we solve Ax=b and have a little error Δb in b (either due to roundoff, or measurement errors, or something else), how big is the resulting error in Δx?   This deceptively simple question leads to lots of interesting topics, e.g. induced **matrix norms** and matrix **condition numbers**.

**Further reading**: Strang, section 9.2.   For a much more thorough discussion of these topics, see classes like 18.335 or (to a lesser extent) 18.330, as well as more advanced textbooks like *Numerical Linear Algebra* by Trefethen and Bau.

# Lecture 33 (Dec 8)

* [pset 12 solutions](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset12-sol.ipynb)

* [Dense and sparse linear algebra](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Dense-and-Sparse.ipynb)
* [Power method for eigenproblems](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Power-Method.ipynb)

Large-scale linear algebra: the computational techniques (but not the *conceptual approaches*) of linear algebra completely change when one looks at large-scale matrix problems (100000×100000 or more).  There, the focus turns to exploiting matrix **sparsity** (matrices that are mostly zero) and other structures that let you multiply matrices by vectors quickly (and let you avoid storing the whole matrix).

This material will not be on the final exam, but is still very useful for practical applications of linear algebra!

**Further reading**: Textbook, section 11.3 has some discussion of iterative methods.  More advanced treatments include the book *Numerical Linear Algebra* by Trefethen and Bao, and surveys of algorithms can be found in the *Templates* books for [Ax=b](http://www.netlib.org/linalg/html_templates/Templates.html) and [Ax=λx](http://web.cs.ucdavis.edu/~bai/ET/contents.html).  Sparse-direct solvers are described in detail by the book *Direct Methods for Sparse Linear Systems* by Davis.  The course 18.335 spends much more time on these methods.

# Lecture 34 (Dec 11)

Continued notes from last lecture: discussed iterative solvers for Ax=b, via the "toy" algorithm of steepest descent.

In serious applications, you want to use a more sophisticated algorithm like conjugate gradients. You also often want to find a somewhat magical matrix called a "preconditioner": essentially, an easy-to-invert approximation P for your matrix A, such that P⁻¹A is "closer" to the identity (technically: you want it to have eigenvalues that are more "clustered").  (Finding a good preconditioner is difficult, often a research-level problem for "new" matrices.)   Explaining all of these details fully is beyond the scope of 18.06, but I want you to have some notion of what to look for if you encounter this kind of large-scale problem.

**Further reading**: Textbook, section 11.3 has some discussion of iterative methods.  More advanced treatments include the book *Numerical Linear Algebra* by Trefethen and Bao, and surveys of algorithms can be found in the *Template* book for [Ax=b](http://www.netlib.org/linalg/html_templates/Templates.html).  The course 18.335 spends much more time on these methods.

# Lecture 35 (Dec 13)

Examined the analogues of Hermitian positive-definite matrices, matrix exponentials, etcetera, for *infinite-dimensional* linear algebra.  (This material will *not* be on the final.)   It turns out that this is tremendously important for understanding [partial differential equations (PDEs)](https://en.wikipedia.org/wiki/Partial_differential_equation) arising in science and engineering.

Earlier in the class, we already saw how we can define infinite-dimensional vector spaces of functions, "dot products" of functions via integrals, and hence orthogonal bases of functions, projection, etcetera.  Now, we look at linear operators on functions, and in particular I looked at A=d²/dx² acting on functions u(x)
over a [domain Ω](https://en.wikipedia.org/wiki/Domain_of_a_function) = [0,L], i.e. functions for 0 ≤ x ≤ L, with the [boundary condition](https://en.wikipedia.org/wiki/Dirichlet_boundary_condition) u(0)=u(L)=0.

First, we looked at the eigenfunctions, satisfying Au=λu.  These are easy to find: uₙ(x)=sin(nπx/L) for n=1,2,3,…, with eigenvalues λₙ=-(nπ/L)².   Notice that the eigenvalues are real and negative.  And the
eigenfunctions are none other than our "Fourier sine series" basis functions, way back from lecture 16, which are orthogonal under the dot product u⋅v=∫ūv.   So, it looks much like a real-symmetric negative-definite eigenproblem!  But in what sense can we say "Aᴴ=A" when A is a derivative?

The key property of a transpose/adjoint is not that it swaps rows and columns, but rather that (Aᴴx)⋅y=x⋅(Ay) for any real vectors x and y, and a Hermitian matrix has (Ax)⋅y=x⋅(Ay).   In fact, we can use this as the *definition* of the "adjoint" for any vector space with a dot product: Aᴴ is defined as the operator that makes (Aᴴu)⋅v=u⋅(Av) for any u,v.    If we apply that to A=d²/dx², we have u⋅(Av)=∫ūv″, and "transposing" A means [integrating by parts](https://en.wikipedia.org/wiki/Integration_by_parts) to make the derivatives act on u instead of v.   Integrating by parts twice, and applying the boundary conditions u(0)=u(L)=0=v(0)=v(L) from our function space, we find that (Au)⋅v=u⋅(Av): **A=d²/dx² is a real-symmetric operator**.

I then showed how the fact that λ is real and the eigenfunctions are orthogonal follows — in fact, the proof is essentially identical to the proof for matrices.   Furthermore, if we integrate by parts only once, we saw that u⋅Au=-∫|u′|²≤0, and =0 only if u=0, so A is negative definite, and the proof that λ<0 is the same as before.

Furthermore, just as we solved dx/dt = Ax by eᴬᵗx(0) and interpreted this as multiplying each eigenvector by exp(λt), we can similarly solve the partial differential equation ∂u/∂t=∂²u/∂x² (the [diffusion equation](https://en.wikipedia.org/wiki/Diffusion_equation)) as multiplying u(x,0) by the operator exponential exp(t ∂²/∂x²).  This seems horrible until we realize that it again just multiplies each eigenfunction by exp(λt).  So, if we expand the initial condition in the uₙ basis (a Fourier sine series), then each term is just multiplied by exp(λₙt) to get the solution u(x,t).  This is **exponentially decaying** because the eigenvalues are negative.  Similarly, if we solve ü=∂²u/∂t²=∂²u/∂x² (the [wave equation](https://en.wikipedia.org/wiki/Wave_equation)), it is essentially the same as ẍ=Ax from the previous mass-and-spring lecture: the solutions are **oscillating** with real frequencies ω=√-λ because the eigenvalues λ of ∂²/∂x² are < 0.

The wonderful thing about this approach is that it allows us to derive real λ<0 and orthogonal eigenfunctions even in cases that we can't solve.  e.g. a slight variation is to consider the operator Bu=(cu′)′ for some given real function c(x)>0.  In this case, we can't find the eigenfunctions or eigenvalues analytically for most c(x), but essentially the same derivation again shows B=Bᴴ and negative-definite, so we know that the eigenvalues are real and positive and the eigenfunctions are orthogonal (an orthogonal basis).  In a diffusion equation u̇=(cu′)′, the function c(x) represents a variable "diffusivity" (or thermal conductivity) representing how easy it is to diffuse in different materials.  Even though we can no longer solve this problem analytically, we *still* know it has decaying solutions.  Or, in a wave equation ü=(cu′)′, the function c(x) could represent a variable "springiness" at different points in space (different materials), and we *still* know it has *oscillating* solutions.   This is an extremely powerful way to understand PDEs (which usually cannot be solved in closed form) by looking at their *structure*.

The main complication with functions is understanding when the operator is "diagonalizable," i.e. when the functions uₙ form a basis for "all" functions.  This is tricky, because functions can do crazy things (like blow up or oscillate infinitely fast) that column vectors can't, and rigorous analysis devotes a lot of effort to carefully defining the set of functions and operators that are "nicely behaved" so that linear algebra works as expected.  (Figuring out when, exactly, the Fourier sine series converges took 150 years!)  In physical settings, however, such "crazy" functions rarely arise, and it is often reasonable to assume that the eigenfunctions uₙ of a Hermitian operator form a basis for all functions that you care about.   Another tricky issue is defining what it means for the operator to be "square", which essentially corresponds to comparing the *domains* of A and and its adjoint Aᴴ.

**Further reading**:  Linear algebra applied to functions and PDEs can be found in [18.303](http://math.mit.edu/~stevenj/18.303/), 18.101 (functional analysis), and many other courses (e.g. quantum mechanics 8.04+ is taught this way).   See also my [notes on Hermitian operators for 18.06 from Fall 2007](http://web.mit.edu/18.06/www/Fall07/operators.pdf) which gives an informal introduction similar to my presentation in class.  Strang's book [Computational Science and Engineering](http://math.mit.edu/~gs/cse/) gives a more computational viewpoint on this subject.  The linear-algebra approach to the 1d case of functions u(x) and second-derivative operators is often called [Sturm–Liouville theory](https://en.wikipedia.org/wiki/Sturm%E2%80%93Liouville_theory), but nowadays people apply similar concepts to more complicated operators in higher dimensions.  Scientists and engineers usually adopt an informal approach to this subject, whereas a rigorous approach is much more tricky and requires the spaces of allowed functions and operators to be carefully circumscribed, leading to the topic of [functional analysis](https://en.wikipedia.org/wiki/Functional_analysis).

# Final Exam (Tues Dec 19, 9am–noon, duPont)

* **Review session**: Thursday, December 14, 1–3pm, in 2-190.  Went over spring 2013 problem 2, 2016 ASE problems 1–3, spring 2009 problems 4 and 6.

* Potential topics: all topics from exams 1–3, SVDs, Jordan vectors and defective matrices.
* Not covered: physics (i.e. you don't need to know any physics, but if you are *given* an equation from physics etcetera, you should of course be able to express/analyze it in linear-algebra form), Newton's method, orthogonal functions, statistics, circulant matrices, sparse/iterative solvers (except for the [power method](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Power-Method.ipynb), which is essentially exam-3 material), condition numbers and error bounds, Hermitian operators and eigenfunctions.
* Bring your ID — attendance will be taken.

* Practice problems: practice problems from exams 1–3.  [spring 2017 final](https://github.com/stevengj/1806/blob/spring17/exams/final.pdf) and [solutions](https://github.com/stevengj/1806/blob/spring17/exams/final-sol.pdf), [2016 ASE](https://github.com/stevengj/1806/blob/spring17/exams/2016-ase.pdf) and [solutions](https://github.com/stevengj/1806/blob/spring17/exams/2016-ase-sol.pdf); [spring 2009 final](http://web.mit.edu/18.06/www/Spring09/final-s09.pdf) and [solutions](http://web.mit.edu/18.06/www/Spring09/final-s09-soln.pdf); [fall 2007 practice final](http://web.mit.edu/18.06/www/Fall07/practicefinal-sol.pdf); [fall 2015 final](http://web.mit.edu/18.06/www/Fall15/FinalSols.pdf), problems 1–5,7; [spring 2013 final](http://web.mit.edu/18.06/www/Spring13/Examfblank.pdf) and [solutions](http://web.mit.edu/18.06/www/Spring13/final_s13_sol.pdf), problems 2,3,4,5,7; [spring 2007](http://web.mit.edu/18.06/www/Spring07/final.pdf) problems 1–5.  Also review your homework problems.

* [Final exam](exams/final.pdf) and [solutions](exams/final-sol.pdf).
