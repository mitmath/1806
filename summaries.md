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
* Equivalently, A⁻¹ is the matrix for which A⁻¹A = A⁻¹A = I (the m×m identity matrix).
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

**Further reading:** Textbook sections 2.6 ("The cost of elimination") and 11.1.  Textbook chapter 3.