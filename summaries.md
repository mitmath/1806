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

In particular, showed explicitly that if y is orthogonal to every vector in C(A), then y is necessarily in N(Aᵀ) (and vice versa), hence C(A) and N(Aᵀ) are orthogonal complements.   (The reasoning for C(Aᵀ) and N(A) is identical: just replace A with Aᵀ.)

This often gives an nice way to check if a vector is in C(A): b is in C(A) if and only if b is orthogonal to N(Aᵀ) (or to a basis thereof).   Gave an example where C(A) is a plane in ℝ³, N(Aᵀ) is the line through 0 orthogonal to that plane, and the equation for b ∈ C(A) was yᵀb=0 for a y ∈ N(Aᵀ).

As another example, considered **rank-1 matrices** uvᵀ for u∈ℝᵐ and v∈ℝⁿ: if u and v are nonzero, then uvᵀ is an m×n matrix of rank 1.   This is easy to see: every column is a multiple of u, so C(uvᵀ)=C(u) is 1d, and similarly the row space is the 1d subspace spanned by v.  Since the dimension of the column/row space is the rank, then the rank is 1.

**Further reading:** Textbook sections 3.5, 4.1; video
[lecture 10](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-10-the-four-fundamental-subspaces/), video [lecture 14](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-14-orthogonal-vectors-and-subspaces/)
