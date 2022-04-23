# MIT Course 18.06, Spring 2022

This is a repository for the course [18.06: Linear Algebra](http://web.mit.edu/18.06) at MIT in Spring 2022.   See [other branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-branches-in-your-repository/viewing-branches-in-your-repository) of this repository for previous semesters.

**Instructor**: [Prof. Steven G. Johnson](http://math.mit.edu/~stevenj).  Course administrator: [Yair Shenfeld](https://www.yairshenfeld.com/).

**Lectures**: MWF11 in 10-250.  See [recordings](https://mit.hosted.panopto.com/Panopto/Pages/Sessions/List.aspx?folderID=68796547-c661-4d78-a50e-ae2e00efcbba) and [handwritten notes](https://www.dropbox.com/s/q6ff0kfu7jyjiuz/18.06%20Spring%202022.pdf?dl=0) posted online, along with other materials (slides, further reading) posted below.

**Exams**: 11am in 10-250, on Fridays **2/25**, **4/1**, and **5/6**.  Final exam: 9–12 in 10–250 on Wednesday **5/18**.

**Recitations**:
 * [Gary Choi](https://math.mit.edu/~ptchoi/): T2 in 2-136, T3 in 2-136 (office hours W10 [virtual](https://mit.zoom.us/j/99599310644), R11 in-person 2-246C)
 * [Haushuo Fu](https://math.mit.edu/directory/profile.php?pid=2229): T11 in 2-136, T12 in 2-136 (office hours M4 [virtual](https://mit.zoom.us/j/99599310644), W1 in-person 2-238)
 * [Sergei Korotkikh](https://math.mit.edu/directory/profile.php?pid=2113): T11 in 2-131, T1 in 2-136 (office hours W6 [virtual](https://mit.zoom.us/j/99599310644), R6 in-person 2-231D)
 * [Yair Shenfeld](https://www.yairshenfeld.com/): T9 in 2-132, T10 in 2-132 (office hours T4 [virtual](https://mit.zoom.us/j/99599310644), R5 in-person 2-231)

**Undergraduate Assistants**: [Subha Pushpita](https://snpushpi.mit.edu/), Isaac M Lopez, and Gaurav Arya.   Email them at **1806sp22_ua ατ mit.edu** for 1-on-1 technical help with Julia or other questions that don't work well over Piazza etc.   [Virtual](https://mit.zoom.us/j/99599310644) office hours: M7, T5:30, F1–3.

**Resources**: [Piazza discussion forum](https://piazza.com/mit/spring2022/1806), [math learning center](https://math.mit.edu/learningcenter/), [TSR^2 study/resource room](https://ome.mit.edu/programs/talented-scholars-resource-room-tsr2), [pset partners](https://psetpartners.mit.edu/).

This document is a *brief* summary of what was covered in each 18.06
lecture, along with links and suggestions for further reading.  It is
*not* a good substitute for attending lecture, but may provide a
useful study guide.  (You can also look at the analogous summaries from [Fall 2018](https://github.com/stevengj/1806/blob/fall18/summaries.md).)

## Lecture 1 (Jan 31)

* [course overview/syllabus](https://docs.google.com/presentation/d/1ivbV1nr67XfasBdXezZF9UWILzDoQtQev8vSqRKBfu0/edit?usp=sharing)
* [pset 0](psets/pset0.ipynb): due **Friday Feb 4 at 11am** (submit your solutions on Canvas).
* video: see *recordings* link above.

Slides giving the syllabus and the "big picture" of what 18.06 is about.  Introduction to thinking about matrices as linear operations, not just as "bags of numbers".

**Further reading**: Strang, chapter 1, and section 8.1 on linear transformations.  3blue1brown has a nice video on [matrix multiplication as composition of linear transformations](https://youtu.be/XkY2DOUCWMU).  If you've forgotten the basics of how to multiply matrices by vectors or matrices by matrices, google for some tutorial material online (e.g. [Khan academy](https://www.khanacademy.org/math/precalculus/x9e81a4f98389efdf:matrices/x9e81a4f98389efdf:multiplying-matrices-by-matrices/a/multiplying-matrices)) and do a quick brush-up.

## Lecture 2 (Feb 2)

* handwritten notes: see link above (at beginning)
* Gaussian-elimination [Julia notebook](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Gaussian-elimination.ipynb)

(Started with quick review of matrix–matrix multiplication from the end of lecture 1.)

[Gaussian
elimination](https://en.wikipedia.org/wiki/Gaussian_elimination) for **Ax=b**:  I
started with the grade-school/high-school viewpoint of writing out three equations
in three unknowns, adding/subtracting multiples of equations until we
were left with one equation in one unknown.  Then, I wrote the
same equations in matrix form, and renamed this process "Gaussian
elimination": we add/subtract multiples of matrix rows to introduce
zeros below the diagonal, i.e. to make the matrix [upper
triangular](https://en.wikipedia.org/wiki/Triangular_matrix) **U**.  We then do the same row operations to the right hand side **b** to get a new vector **c**.  Finally, we solve **Ux=c** for x by working from bottom (1 equation in 1 variable) to top, a process called "backsubstitution".

To do the same operations to both **A** and **b**, a useful trick for hand calculations is to [augment](https://en.wikipedia.org/wiki/Augmented_matrix) the matrix with a new column representing the right-hand side, forming **[A b]** before starting Gaussian elimination.

What comes next?  The problem with expressing Gaussian elimination this way, as operations on individual numbers in the matrix, is that it is impossible to follow the process in detail for anything except a very tiny matrix.   We need a higher-level "algebraic" way to express the process, both to help us understand it and also to help us to *use* it (e.g. to perform additional algebraic transformations afterwards).   To do this, we want to express the process, not as operations on individual numbers, but as matrix operations.

Rewrote Gaussian elimination in matrix form: we multiply a matrix A on the *left* by a sequence of **lower**-triangular "elimination matrices" Eₙ to arrive at an **upper**-triangular matrix U = EA.  To solve Ax=b, we can think of the earlier process as multiplying *both sides* on the *left* by **E**, the linear operator representing the composition (product) of all of the elimination steps, yielding Ux=EAx on the left and c=Eb on the right.

**Further reading:** Textbook sections 2.1, 2.2, 2.3.  Strang [lecture 2 video](https://www.youtube.com/watch?v=QVKj3LADCnA&list=PLE7DDD91010BC51F8&index=3).

## *Optional* Julia Tutorial (Feb 2 @ 5pm): [Zoom](https://mit.zoom.us/j/92693276240?pwd=TmhwQmRWcmJWVm51eTQ4Szg4cWI4dz09)

* [video recording](https://mit.zoom.us/rec/share/w7o2TQjDOnHsaRlJvbS1iysu5Sh23gGVFt3nX_VShRoRBr5UCsPlMhEu1EeyQrk.Vq1WOfArkC3v-Lma?startTime=1643839179000)

A basic overview of the Julia programming environment for numerical computations that we will use in 18.06 for simple computational exploration.   This (Zoom-based) tutorial will cover what Julia is and the basics of interaction, scalar/vector/matrix arithmetic, and plotting — we'll be using it as just a "fancy calculator" and no "real programming" will be required.

* [Tutorial materials](https://github.com/mitmath/julia-mit) (and links to other resources)

If possible, try to install Julia on your laptop beforehand using the instructions at the above link.  Failing that, you can run Julia in the cloud (see instructions above).

## Lecture 3 (Feb 4)

* handwritten notes
* [Matrix inverse and LU notebook](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Inverses-LU-intro.ipynb)
* [pset 0 solutions](psets/pset0sol.ipynb)
* [pset 1](psets/pset1.ipynb) (due Feb 11)

Showed that Gaussian elimination can be viewed as **LU factorization**:

* Gaussian elimination A ⟿ U=EA (without row swaps) can be thought of as A=LU: factorizing A into a **product of two simpler (triangular) matrices** (L=lower, U=upper).  U is the matrix that you normally get when you do elimination by hand, and L (the inverse of the elimination steps L=E⁻¹, a lower-triangular matrix with 1's on the diagonal) is essentially a *"record" of the elimination steps*.

L is the matrix that "reverses" Gaussian elimination: it tells you how to get A back from L.   Despite this, I showed in lecture that L is actually *easier* to get than E: all you do is make a diagonal matrix of 1's, and then fill in the *multipliers* from the elimination steps (flipping subtraction to addition) below the diagonal.  So, L just requires bookkeeping, and *no* computation.

Computing U is hard (elimination is a lot of work, even for a computer), but once you have U and L then many things that you might want to do with A become easy.

* For example, suppose you want to solve Ax=b, given A=LU.  Write LUx=b=L(Ux), and let y=Ux.  Then Ly=b, and we can solve for y by forward-substitution.  Given y, we can then solve Ux=y by back-substitution.  Both of these steps are easy because the systems are triangular.
  - Moreover, solving Ly=b turns out to *exactly* correspond to applying the elimination steps from A ⟿ U to b.   (The 1's on L's diagonal mean that there are no divisions required, either.)
* This means that we can re-use L and U to solve Ax=b for *many right-hand sides*.   In contrast, if you "augment" A with b and then do elimination (A|b)⟶(U|y), you get the *same* new right-hand side y but you haven't kept a record of the elimination steps, so if you have a new right-hand side you might naively repeat the whole elimination process (hard!) rather than solving Ly=b (easy!).
* More generally, whenever you have A as a product of "simpler" matrices (e.g. triangular, diagonal, …), you can solve Ax=b by a sequence of "simpler" solves.

Introduction to the concept of a matrix inverse more generally as the matrix that reverses the action of a linear operator.  Key ideas from the notebook:

* A⁻¹ is the matrix that does the "reverse" of A:  A⁻¹(Ax)=x for any x.   It also follows that A is the reverse of A⁻¹: A(A⁻¹x)=x for any x, i.e. (A⁻¹)⁻¹=A.
   -  That is, if Ax=b, then A⁻¹b=x (for any x).  (Equivalently, it gives the solution to Ax=b.)
   - It only exists for **square, nonsingular** matrices A.  (i.e. an m×m matrix A must give m nonzero pivots when you do elimination.)
* Equivalently, A⁻¹ is the matrix for which A⁻¹A = A⁻¹A = I (the m×m identity matrix).
  - I is an identity matrix, the matrix that gives Ix=x for any x or IA=A and AI=A for any A.  There are m×m identity matrices for all m, and when we write "I" we usually infer from context how big an I we mean.

In the next lecture (which will start with the end of this notebook), we will look at calculating inverses more generally (although it turns out that this is something that you should almost never do explicitly, even on a computer!).

**Further reading:** Textbook sections 2.5, 2.6.  Strang [lecture 4 video](https://www.youtube.com/watch?v=5hO3MrzPa0A) and [lecture 3 video](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-3-multiplication-and-inverse-matrices/).  See also "The key reason why A = LU" in section 2.6 of the textbook.


## Lecture 4 (Feb 7)

* handwritten notes
* [Matrix inverse and Gauss–Jordan](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Gauss-Jordan.ipynb)

Reviewed matrix inverses and key properties thereof.

Went through how to explicitly compute A⁻¹ by solving AA⁻¹ = I.   Essentially, this is just solving Ax=b multiple times, where b is each column of I. A common way to organize this for *hand* calculation (ugh) is the Gauss–Jordan algorithm (on a 3×3 example that can also be found in the textbook): If we do row operations on A to get I, then the *same* row operations on I give A⁻¹!  To carry this out by hand, we augment (A|I), do ordinary Gaussian elimination to get (U|C), and then do elimination "upwards" to get (I|A⁻¹).

Matrix inverses are mainly a *conceptual* tool that we use to move matrices around *symbolically* in equations.   Once you are through with your algebraic manipulations, you might end up with an expression like A⁻¹b — but when it comes time to actually *compute* the answer, you should **read "A⁻¹b" as "solve Ax=b for x by the best available method"**.

**Further reading:** Textbook sections 2.5, 2.6.  Strang [video lecture 3](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-3-multiplication-and-inverse-matrices/).

## Lecture 5 (Feb 9)

* Handwritten notes
* [LU factorization for real](https://nbviewer.org/github/mitmath/1806/blob/master/notes/LU-for-real.ipynb)

Brief review of previous topics in LU factorization with some more examples in the notebook:

* How the L matrix entries are just the multipliers from Gaussian elimination.  No extra work is required!
* How in practice, one rarely "augments" the matrix with the right-hand side.  Instead, you compute A=LU, substitute this into Ax=b=LUx, let c=Ux, solve Lc=b, then solve Ux=c.  In particular, solving Lc=b is *exactly* the same as performing the Gaussian-elimination steps on c.  (The "augmented" method is a little easier for human bookkeeping, but has essentially no advantage for the computer.)

Some new information about LU to complete the story:

* Given A=LU, you can efficiently solve multiple right-hand sides, or equivalently the **matrix equation** AX=B.
* How row swaps lead to the factorization PA=LU: in practice, the computer *almost always* does row swaps, and *always* gives you a permutation matrix P (or its equivalent).

We apply PA=LU to Ax=b in much the same way as for LU; the only difference is that we have to first apply the permutation P to b.

Permutation matrices P are a great example of a linear operator that is often easier to understand (and more efficient) if you *don't* write it as a matrix, but instead write it as a "vector" `p` of the permuted indices 1…n in the new order.  Then Px is just `x[p]` in Julia (and very similarly in Matlab and Numpy): just make a new vector by extracting the components p₁,p₂,… of x.

**Further reading:** Textbook sections 2.7 (on permutations; we will talk about transposes soon), and 11.1.  Strang [video lecture 4](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-4-factorization-into-a-lu/) and [video lecture 5](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-5-transposes-permutations-spaces-r-n/).   For 18.06, I *don't expect you to know* the details of how the permutation P in PA=LU is constructed even though you don't know the permutation in advance … you only need to know how to *use* PA=LU if it (or something similar) is *given* to you … but if you are interested this "partial pivoting" algorithm is described in lecture 21 of *Numerical Linear Algebra* by Trefethen and Bau, or in many other textbooks on numerical linear algebra.


## Lecture 6 (Feb 11)

* handwritten notes
* [Computational complexity](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Complexity.ipynb)
* [Singular matrices and rank](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/notes/Singular.ipynb)
* [pset 1 solutions](https://github.com/mitmath/1806/blob/master/psets/pset1sol.ipynb)
* [pset 2](psets/pset2.ipynb)

Complexity of matrix operations: why matrix × vector or backsubstitution scale like n² for n×n matrices, while matrix × matrix or Gaussian elimination (LU factorization) scale like n³.   Matrices much bigger than a few thousand square quickly become impractical, and really large problems are only tractable because they have special structure like [sparsity](https://en.wikipedia.org/wiki/Sparse_matrix).

Began talking about singular matrices.  With a relatively simple example, showed that singular matrices (matrices with not enough pivots) A can still have solutions to Ax=b, but only for certain right hand sides.  And when they do have solutions, they have *infinitely many* solutions.
As a measure of *how* singular a matrix is, we talk about its **rank r**, equal to the number of pivots that we have after elimination.   It will turn out that this number **r** is closely related to the *geometry* of solutions to singular (and non-square) matrix problems.   The solvable right-hand sides live in "**r** dimensions", a *subspace* of all possible right-hand sides — in our example, we had r=2 for a 3×3 matrix, so the allowed right-hand sides lived in a 2d *plane*.   And if the solutions exist to an n×n system with rank r, then we will see that the solutions "live" in n–r dimensions, e.g. a 1d line in our example.

To make this precise, we first have to go back and generalize our notion of a "vector" to a more abstract notion called a "vector space", and from this we can define "subspaces", and see how certain key subspaces related to a matrix A tell us the geometry of its solutions.

**Further reading:** Textbook sections 2.6 ("The cost of elimination") and 11.1.   For next time, textbook sections 3.1 and 3.2.

## Lecture 7 (Feb 14)

* Handwritten notes

Introduced **vector spaces** (informally, a set V of anything you can add x±y and multiply by scalars αx) and **subspaces** (a subset of V such that vector operations *stay in the subspace*).  Examples of vector spaces include real n-component vectors (ℝⁿ, or ℂⁿ for complex numbers), real m×n matrices, functions f(x) (ℝ↦ℝ, real numbers to real numbers).  Examples of subspaces includes planes or lines through the origin in ℝ³, or the origin itself.   The goal of this is to break vector spaces into smaller pieces that we can still do linear algebra on (hence the need for a subspace, not just any arbitrary subset).  Subspaces are especially important to help us understand the solutions (if any) of Ax=b for **non-square** matrices A.

For an m×n matrix A, introduced two important subspaces.

* First, the **column space C(A)**: the set {Ax for all x ∈ ℝⁿ}.  This is the set of *right-hand sides* b such that Ax=b is *solvable*, and is a subspace of the "output space" ℝᵐ (not ℝⁿ unless m=n!).  Equivalently, C(A) is all linear combinations of the *columns* of A, which we call the **span** of the columns.

* Second, the **null space N(A)** (also called the "kernel"): the set {x such that Ax=0} ⊆ ℝⁿ (i.e., a subspace of the "input space" ℝⁿ).  Given any solution x to Ax=b, then x+z is also a solution if z ∈ N(A) (i.e. Az=0 ⟹ A(x+z)=Ax+Az=Ax=b).

These are very important subspaces because they tell us a lot about the matrix A and solutions to Ax=b.  As a trivial example, if A is an n×n *invertible* matrix, C(A)=ℝⁿ and N(A)={0}.  Conversely, if A is an m×n matrix of zeros, then C(A)={0} and N(A)=ℝⁿ.

Defined a **basis** for a vector space as a *minimal* set of vectors (we will later say that they have to be *linearly independent*) whose
**span** (all linear combinations) produces everything in the space.

We can solve Ux=0 by breaking up x=(p,f) into the pivot variables p and the free variables f, and solve for p from f, and in fact this is an upper-triangular solve that we can do by backsubstitution.  This means that we can choose *any f we want* and *p is determined*.   If we choose the usual basis (1,0,0,…), (0,1,0,…) for f∈ℝⁿ⁻ʳ and solve for p, this gives us the **special solutions**, a basis for N(A).

Showed that the **nullspace is preserved by elimination (row) operations**, but that the column space is not.   So, to find N(A), we can instead do elimination and find N(U)=N(A) for the upper-triangular form U.   Defined the **rank** as the number of (nonzero) pivots, the pivot columns, and the free columns.  We now want to find *all* possible solutions to Ax=0.

**Further reading:** Textbook, sections 3.1—3.3; Strang [video lecture 6](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-6-column-space-and-nullspace/) and [lecture 7](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-7-solving-ax-0-pivot-variables-special-solutions/).   Note that Strang's lectures and book emphasize the "reduced row echelon" ("rref") form, which is essentially a bookkeeping trick (similar to Gauss–Jordan for inverses) to do the back-solves for the special solutions all at once.  I will *not* emphasize rref form this semester, but you can use it if you want.  (In practical applications, rref form is virtually never used, and for that matter one doesn't actually use elimination at all to find null spaces; instead, one uses something called the [SVD](https://en.wikipedia.org/wiki/Singular_value_decomposition) that we will cover later.)

## Lecture 8 (Feb 16)

* handwritten notes

Went through two examples of finding the special solutions as a basis for the nullspace.  They key point is always this: given the free variables, we can easily solve for the corresponding pivot variables.

We can now find the **complete solution** (i.e., all solutions) to a non-square linear system Ax=b.  Elimination turns this into Ux=c. We look for solutions in the form xₚ + xₙ: a **particular solution** xₚ plus any vector xₙ in N(A) (specified explicitly from the basis).  The particular solution xₚ can be *any* solution to Ax=b, but the simplest one to find is usually to *set the free variables* to zero.  That is, we write the solution xₚ=(p; 0) where p is the unknown values in the pivot rows, setting the other (free) rows to zero, then plug into Uxₚ=c to get p.  Since this extracts the part of U that is upper triangular, we can easily solve it.   Then we add in anything in N(A).

I used a 3×4 example matrix A (similar in spirit to one in the textbook, section 3.3) that was **rank deficient**: after elimination, we only had two pivots (rank r=2) in the first two rows, and a whole row of zeros.   Furthermore, its pivot columns were the first and *third* columns, with the second and fourth columns being free — this is possible (albeit unusual)!   Showed that we could still get the special solutions by solving for the pivot variables in terms of the free variables = (1,0,…) etcetera, and we still got dimension n-r (= 2) for the null space.   When solving Ax=b by elimination into Ux=c, however, we *only got a solution x if c was zero in the same rows as U*.  If the zero third row of U was matched by a zero third row of c, then we got a particular solution as before by setting the free variables to zero.  If the zero third row of U was *not* matched by a zero third row of c, then there is *no* solution: b was *not in the column space* C(A).  This gives an easy way to check whether the right-hand-side is in the column space.   We went through two example right-hand-sides: one with no solutions, and one with infinitely many solutions.

**Further reading:** Textbook sections 3.3–3.4, [lecture 8](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-8-solving-ax-b-row-reduced-form-r/).  As noted in lecture 7, I'm not emphasizing the trick of "rref" form (used extensively by Strang's book and lectures) which makes hand calculation *slightly* easier, but might push students towards memorizing formulas (which are useless in the long run).

## Lecture 9 (Feb 18)

* handwritten notes
* [pset 2 solutions](psets/pset2sol.ipynb)
* *short* [pset 3](psets/pset3.ipynb) (due **Wed** Feb 23)

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

### Four important cases for Ax=b

Went through four important cases for an m×n matrix A of rank r.  (Note that we must have r ≤ m and n: you can't have more pivots than there are rows or columns.)

1. If r=n, then A has **full column rank**.  We must have m ≥ n (it is a "tall" matrix), and N(A)={0} (there are no free columns).  Hence, any solution to Ax=b (if it exists at all) must be *unique*.  (If m > n, the problem is "overdetermined": more equations than unknowns.)

2. If r=m, then A has **full row rank**.  We must have n ≥ m (it is a "wide" matrix), and C(A)=ℝᵐ.  Ax=b is *always solvable* (but the solution will not be unique unless m=n).  (If m < n the problem is "underdetermined": more unknowns than equations.)

3. If r=m=n, then A is a square **invertible** matrix.  Ax=b is always solvable and the solution x=A⁻¹b is unique.

4. If r < m and r < n, then A is **rank deficient**.  Solutions to Ax=b may not exist and will not be unique if they do exist.

Cases (1)-(3) are called **full rank**: the rank is as big as possible given the shape of A.  In practice, most matrices that one encounters are full rank (this is essentially always true for *random* matrices).  If the matrix is rank deficient, it usually arises from some special structure of the problem (i.e. you usually want to look at where A came from to help you figure out why it is rank deficient, rather than computing the rank etcetera by mindless calculation).   (A separate problem is that of matrices that are *nearly* rank deficient because the pivots are very small, but the right tools to analyze this case won't come up until near the end of the course.)

**Further reading:** Textbook sections 3.3–3.4, [lecture 9](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-9-independence-basis-and-dimension/).

## Lecture 10 (Feb 22)

* handwritten notes
* [slides](https://docs.google.com/presentation/d/1SXAmVB07xdLRa8eBQFF5wI0RDpjC1u1-zHd1oPEtkXM/edit?usp=sharing)
* [notebook](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Newton-Thomson-example.ipynb): Newton's method example

Reviewed and broadened differential calculus (18.01 and 18.02) from the perspective of 18.06, where we view a derivative f′(x) as a **linear operator** acting on a small change in the input (dx) to give you the change in the output (df) to *first order* in dx ("linearized").   This viewpoint makes it easy to generalize derivatives, to scalar-valued functions of vectors where f′(x) is the transposed gradient (∇f)ᵀ, to vector-valued functions of vectors where f′(x) is the [Jacobian matrix](https://en.wikipedia.org/wiki/Jacobian_matrix_and_determinant), and even to matrix-valued functions of matrices like f(x)=A⁻¹ where f′(x) is the linear operator f′(x)[dA]=–A⁻¹dAA⁻¹.

Derivatives viewed as linear approximations have many important applications in science, machine learning, statistics, and engineering. For example, went over the **multidimensional Newton** algorithm for finding roots f(x)=0 of systems of nonlinear equations. At each step, you just solve a *linear* system of equations with the Jacobian matrix of f(x), and it converges incredibly rapidly.   Gave an example demo where we solved a 2d version of the famous [Thomson problem](https://en.wikipedia.org/wiki/Thomson_problem) to find the equilibrium position of N repulsive "point charges" constrained to lie on a circle (more generally, a sphere or hypersphere).

**Further reading**: This material was presented in much greater depth in our [18.S096: Matrix Calculus](https://github.com/mitmath/matrixcalc) course in IAP 2022.    The viewpoint of derivatives as linear operators (also called [Fréchet derivatives](https://en.wikipedia.org/wiki/Fr%C3%A9chet_derivative)) was covered in lectures 1 and 2, Newton's method was covered in lecture 4, and automatic differentiation was covered in lecture 5 — see the posted lecture materials and the further-reading links therein.

## Lecture 11 (Feb 24)

* handwritten notes
* [pset 3 solutions](psets/pset3sol.ipynb)
* [pset 4](psets/pset4.ipynb): due Friday March 4

Briefly discussed the end of lecture 10's [slides](https://docs.google.com/presentation/d/1SXAmVB07xdLRa8eBQFF5wI0RDpjC1u1-zHd1oPEtkXM/edit?usp=sharing): another important use of linear approximation via derivatives is for optimization.  The gradient gives you the "uphill" direction, so you can maximize/minimize a function by "walking uphill/downhill", leading to a family of algorithms known as [gradient ascent/descent](https://en.wikipedia.org/wiki/Gradient_descent), respectively.  There are lots of details I won't go into, but the upshot is that you can optimize functions of *millions* of variables (or more!), which is the key to machine learning (e.g. deep neural nets), large-scale engineering optimization, and more.

**Further reading:**  See part 2 of [*Matrix Calculus* lecture 4](https://github.com/mitmath/matrixcalc#lecture-4-jan-19) and further-reading thereof.

### Dot products, transposes, & orthogonality

Reviewed the dot product or **inner product** of two real column vectors, x⋅y, defined as ∑ᵢxᵢyᵢ.  In linear-algebra terms, we write this as x⋅y=xᵀy in terms of the *transpose* of the vector x: if x is a column vector, xᵀ is a row vector (sometimes more technically called a "dual" vector or "covector").  The *length* (or **norm**) of a vector is is the square root of the dot product with itself: ‖x‖=√xᵀx.

The [transpose](https://en.wikipedia.org/wiki/Transpose) Aᵀ of a linear operator A is defined  so that xᵀAy = x⋅(Ay) = (Aᵀx)⋅y = (Aᵀx)ᵀy: transposes move linear operators from one side to the other in an inner product.  In consequence, we find for matrices that Aᵀ is constructed by **swapping rows with columns** in A.   Key properties:

* (AB)ᵀ=BᵀAᵀ
* αᵀ = α for scalars.  Hence xᵀy = yᵀx (i.e. x⋅y = y⋅x)
* (A⁻¹)ᵀ = (Aᵀ)⁻¹

[Orthogonal](https://en.wikipedia.org/wiki/Orthogonality) vectors are those for which xᵀy = 0.   Defined the [orthogonal complement](https://en.wikipedia.org/wiki/Orthogonal_complement) S<sup>⟂</sup> of a subspace S ⊆ V as
{x ∈ V such that xᵀy=0 for all y ∈ S}.  Combining a basis for S and S<sup>⟂</sup> gives a basis for the whole vector space V, so the dimensions of S and S<sup>⟂</sup> sum to the dimension of V.

Taking the orthogonal complements of C(A) and N(A) leads us to the **four fundamental subspaces** for an m×n matrix A of rank r:

* column space C(A) ⊆ ℝᵐ, dimension r
* C(A)<sup>⟂</sup> = left nullspace N(Aᵀ) ⊆ ℝᵐ, dimension m-r
* nullspace N(A) ⊆ ℝⁿ, dimension n-r
* N(A)<sup>⟂</sup> = row space C(Aᵀ) ⊆ ℝⁿ, dimension r

**Further reading:** Textbook sections 3.5, 4.1; video
[lecture 10](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-10-the-four-fundamental-subspaces/), video [lecture 14](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-14-orthogonal-vectors-and-subspaces/).  Julia [notebook on transposes and orthogonality](https://github.com/mitmath/1806/blob/master/notes/Transposes.ipynb).

## Exam 1 (Feb 25, 11am ~~in 10-250~~ online, due 2pm)

**Update**: due to the snow emergency, MIT is closed and the **exam will be virtual**.  It will be posted on github at 11am, and you will have **until 2pm** to submit your solutions on Canvas.   (It is the *same 1-hour exam* that we would have used in person, but you may use all the time you want between 11am and 2pm … just leave yourself time to submit!)  The exam is **closed-book/closed-notes** and must be completed **on your own**.

* Virtual [exam 1](exams/exam1.pdf) and [solutions](exams/exam1sol.pdf).

Exam 1 will cover the material through **lecture 9** and **pset 3**, including: linear operators, matrix–matrix and matrix–vector operations and interpretations thereof, writing/working with equations in matrix form, solving systems of equations with one or more right-hand sides, Gaussian elimination, back/forward-substitution and triangular matrices, LU factorization and PA=LU, permutation matrices, matrix inverses and Gauss–Jordan, singular matrices, computational costs (which operations are ~ m² or ~ m³ etc and arranging calculations efficiently), rank of a matrix (= number of pivots), vector space & subspaces, null space & special solutions, pivot/free columns column spaces, bases and dimensions of vector spaces, checking whether Ax=b is solvabe, complete solutions to Ax=b (including non-square matrices).

* (Optional) **review session**: Thursday 2/24 4–5pm in 3-270.  Practice problems from review session: [spring 2017 problem 2](http://web.mit.edu/18.06/www/Spring17/exam1.pdf) ([solution](http://web.mit.edu/18.06/www/Spring17/exam1-sol.pdf)), [fall 2017 problem 1](https://github.com/stevengj/1806/blob/fall17/exams/exam1.pdf) ([solution](https://github.com/stevengj/1806/blob/fall17/exams/exam1-sol.pdf)), [spring 2008 problem 4](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08-soln.pdf)), [spring 2017 final problem 5(b–c)](https://github.com/mitmath/1806/blob/spring17/exams/final.pdf) ([solution](https://github.com/mitmath/1806/blob/spring17/exams/final-sol.pdf)),
[fall 2013 problem 3](http://web.mit.edu/18.06/www/Fall13/exam1_f13.pdf) ([solution](http://web.mit.edu/18.06/www/Fall13/exam1_f13_sol.pdf))

Practice problems: [spring 2017 exam 1](http://web.mit.edu/18.06/www/Spring17/exam1.pdf) problems 1–4 ([solutions](http://web.mit.edu/18.06/www/Spring17/exam1-sol.pdf)); [fall 2017 exam 1](https://github.com/stevengj/1806/blob/fall17/exams/exam1.pdf) problems 1-4 ([solutions](https://github.com/stevengj/1806/blob/fall17/exams/exam1-sol.pdf)); [fall 2017 exam 1](https://github.com/stevengj/1806/blob/fall17/exams/exam2.pdf) problem 1a,b ([solutions](https://github.com/stevengj/1806/blob/fall17/exams/exam2-sol.pdf));
[fall 2014 exam 1](http://web.mit.edu/18.06/www/Fall14/midterm1_F14.pdf) problems 1, 2, 3a, 3b, 3c  ([solutions](http://web.mit.edu/18.06/www/Fall14/Midterm1solF14.pdf));
[fall 2012 exam 1](http://web.mit.edu/18.06/www/Fall12/Exam%201/quiz1-1806-f12.pdf) problems 1–4 ([solutions](http://web.mit.edu/18.06/www/Fall12/Exam%201/quiz1-1806-f12-solution.pdf));
[spring 2008 exam 1](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08.pdf) problems 1–4 ([solutions](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08-soln.pdf));  [fall 2011 exam 1](http://web.mit.edu/18.06/www/Fall11/q1_f11.pdf) problem 1a, 1b, 2 ([solutions](http://web.mit.edu/18.06/www/Fall11/q1_f11_solution.pdf));
[spring 2012 exam 1](http://web.mit.edu/18.06/www/Spring12/q1_sp12.pdf) problems 1–4 ([solutions](http://web.mit.edu/18.06/www/Spring12/q1_sp12_sol.pdf));
[fall 2013 exam 1](http://web.mit.edu/18.06/www/Fall13/exam1_f13.pdf) problems 1, 2, 3, 5 ([solutions](http://web.mit.edu/18.06/www/Fall13/exam1_f13_sol.pdf));
[fall 2009 exam 1](http://web.mit.edu/18.06/www/Fall09/exam1.pdf) problems 1, 2, 3a–3d, 4 ([solutions](http://web.mit.edu/18.06/www/Fall09/exam1soln.pdf));
[spring 2008 exam 1](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08.pdf) problems 1, 3, 4
([solutions](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08-soln.pdf))

## Lecture 12 (Feb 28)

* handwritten notes

Continued discussion of 4 fundamental subspaces.

In particular, since elimination multiplies A on the *left*, it multiplies Aᵀ on the *right*
by an invertible matrix.  Therefore, C(Aᵀ) = C(Uᵀ), and the *pivot rows of
U* (not A!) are a basis for C(Aᵀ).   More importantly, this tells us a very non-obvious
fact: rank(Aᵀ) = rank(A).   (That is, if you did elimination on Aᵀ, you
would get the *same number of pivots*.)

Talked about the viewpoint that solving Ax=b when A has full column rank (i.e. independent columns) is equivalent to a change of basis, or writing b in a "new coordinate system".

However, viewing the columns of A as a basis or "coordinate system", it becomes clear that some bases are nicer than others.  If the basis vectors are *nearly linearly independent* (e.g. nearly parallel), or equivalently if *A is nearly singular*, then the new coordinate system can be difficult and confusing to use, e.g. tiny vectors can have huge coordinates (coefficients) in the new basis.

A *much nicer* "coordinate system" is an [orthonormal basis](https://en.wikipedia.org/wiki/Orthonormal_basis): vectors q₁,q₂,…,qₙ that are orthogonal to one another and have length 1.   One way of looking at this: **to change "coordinates" to an orthonormal basis just involves dot products.**
  - If you have a non-orthonormal basis a₁,a₂,…, then to write an arbitrary vector b in this basis, i.e. b = a₁x₁ + a₂x₂ + ⋯ with coefficients x₁,x₂,…, you need to solve a linear system Ax=b for x.  Hard!  (∼m³).
  - For an orthonormal basis q₁,q₂,… then to write b = q₁x₁ + q₂x₂ + ⋯ you can **just take dot products** xᵢ=qᵢᵀb.  For example, if you take the dot product q₁ᵀb, then you get x₁ (the coefficient of q₁), because all the other terms have dot product *zero*.

Next lecture, we will put these q₁,q₂,…,qₙ into a matrix Q and talk about its properties, leading us to the important concept of "orthogonal" or "unitary" matrices.

**Further reading:** 3blue1brown has a [nice video on changes of basis](https://www.youtube.com/watch?v=P2LTAUO1TdA).  Textbook sections 3.5, 4.1; video
[lecture 10](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-10-the-four-fundamental-subspaces/), video [lecture 14](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-14-orthogonal-vectors-and-subspaces/).

## Lecture 13 (Mar 2)

* handwritten notes

Orthonormal bases, matrices Q with orthonormal columns q₁,q₂,… (QᵀQ = I):

* Saying that the columns of Q are orthonormal vectors is *equivalent* to saying QᵀQ = I.
  - It follows that ‖Qx‖=‖x‖, and more generally (Qx)ᵀ(Qy) = xᵀy: dot products and lengths are preserved.
* The projection matrix onto C(Q) is just QQᵀ=q₁q₁ᵀ+q₂q₂ᵀ+⋯.  (The rank-1 matrix q₁q₁ᵀ is projection onto the line αq₁.)  In general, the **q component of a vector can be found just by a dot product.**
  - Similarly, the least-squares solution x̂ minimizing ‖b-Qx‖ is just x̂=Qᵀb.

If a matrix Q with orthonormal columns is square, then it is called **orthogonal** (or **unitary**).  In this case, QᵀQ=I means that Qᵀ = Q⁻¹. It also follows that QQᵀ = I: a unitary matrix has orthonormal rows *and* columns.

The way we've been finding a basis for C(A) etcetera is a conceptually nice way to understand the relationships between rank and dimensions.  But it isn't a practical tool.  Instead, the main tool for this kind of thing, both in practice and in theory, is the **singular value decomposition (SVD)**.   The key observation is this: orthonormal bases are ideal, but if you multiply *most* orthonormal bases by a matrix A the result is no longer orthogonal.  Miraculously, it turns out that there is a *special* orthonormal basis v₁,…,vᵣ of C(Aᵀ) such that Av₁,…,Avᵣ *are* orthogonal, and this basis leads to the SVD (next time).

To warm up, we saw that Ax for any x can be written as (Av₁v₁ᵀ + ⋯ Avᵣvᵣᵀ)x, where v₁,…,vᵣ is *any* orthonormal basis of C(Aᵀ).  That is, all that matters to A is the "projection" (components) of x along the v₁,…,vᵣ directions, and we can write A=Av₁v₁ᵀ + ⋯ + Avᵣvᵣᵀ as a sum of rank-1 matrices.  In general, these Av₁,…,Avᵣ are not orthogonal, however.

As an aside, considered **rank-1 matrices** abᵀ for a∈ℝᵐ and b∈ℝⁿ: if a and b are nonzero, then abᵀ is an m×n matrix of rank 1.   This is easy to see: every column is a multiple of a, so C(abᵀ)=C(b) is 1d, and similarly the row space is the 1d subspace spanned by b.  Since the dimension of the column/row space is the rank, then the rank is 1.

**Further reading:** Strang, section 4.4, and video [lecture 17](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-17-orthogonal-matrices-and-gram-schmidt/).

## Lecture 14 (Mar 4)

* handwritten notes
* [SVD introduction](https://nbviewer.org/github/stevengj/1806/blob/master/notes/SVD-intro.ipynb)
* [pset 4 solutions](psets/pset4sol.ipynb)
* [pset 5](psets/pset5.ipynb): due March 11

Introduction to the [singular value decomposition](https://en.wikipedia.org/wiki/Singular_value_decomposition) (**SVD**) and its application to [low rank approximation](https://en.wikipedia.org/wiki/Low-rank_approximation).

Started talking about **orthogonal projection**: for any subspace S ⊆ V, any vector b ∈ S can be written as a sum of two vectors, one in S and one in S<sup>⟂</sup>.   The former is the orthogonal projection Pb of b onto S, where P is the *projection matrix*, and the latter is b–Pb=(I–P)b (the orthogonal projection of b onto S<sup>⟂</sup>).

Derived the projection matrix P = aaᵀ/aᵀa onto 1d subspaces with a basis vector a.   For a normalized vector q=a/‖a‖, this is just qqᵀ.  (In the discussion of the SVD, we saw lots of these projections!)

**Further reading:** Beware that there are several slightly different forms of the SVD; what I've used here is called the "compact" SVD on Wikipedia and is denoted by an "r" subscript in Strang section 7.2; you can expand this to other forms by augmenting U and V with bases for the left and right nullspaces, respectively, and correspondingly adding rows and columns of zeros to Σ.   Strang, sections 7.1–7.2, and video [lecture 29](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-29-singular-value-decomposition/).  Note, however, that the connection of SVD to eigenvalues/eigenvectors of AᵀA is something that we won't cover until later in 18.06.   A cool example that uses the SVD to pull out a few key vectors from a big pile of data is the [eigenwalker demo](https://www.biomotionlab.ca/html5-bml-walker/).  The name for this technique in statistics is [principal component analysis (PCA)](https://en.wikipedia.org/wiki/Principal_component_analysis).  Strang section 4.2 on orthogonal projection.

## Lecture 15 (Mar 7)

Orthogonal projection onto C(A) and other subspaces, and the projection matrix P.

* Projection matrix P = aaᵀ/aᵀa onto 1d subspaces with a basis vector a.
* Projection matrix P = A(AᵀA)⁻¹Aᵀ onto n-dimensional subspaces C(A), where A is m×n with full column rank (rank n).
* Projection onto C(Q), i.e. a subspace with an orthonormal basis is simply QQᵀ.  For example, SVD AV=UΣ ⥰ A=A(VVᵀ + (I-VVᵀ))=UΣVᵀ.
* Key properties P²=P, P=Pᵀ, C(P)=C(A), N(P)=C(A)<sup>⟂</sup>=N(Aᵀ).
* Projection I-P onto the orthogonal complement of C(A), i.e onto N(Aᵀ).
* Equivalence between orthogonal projection and least-squares: minimizing ‖b-Ax‖ is equivalent to minimizing ‖b-y‖ over y∈C(A), and the solution is y=Ax̂=Pb, where AᵀAx̂=Aᵀb.

**Further reading:** Textbook 4.2; video [lecture 15](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-15-projections-onto-subspaces/).

## Lecture 16 (Mar 9)

* handwritten notes
* [Least-square fitting examples](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Least-Square%20Fitting.ipynb)
* [Global-warming regression example](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Global-warming-regression.ipynb)

Introduced the topic of least-square fitting of data to curves.  As long as the fitting function is linear in the unknown coefficients x, showed that minimizing the sum of the squares of the errors corresponds to minimizing the norm of the residual ‖b-Ax‖.  Went through several examples (see Julia notebooks).

Derived the fact that minimizing ‖b-Ax‖ or ‖b-Ax‖² (least squares) corresponds to orthogonal projection (hence AᵀAx̂=Aᵀb) using either algebra (showing ‖b-Ax‖²≥‖b-Ax̂‖² for any x) or calculus (setting ∇‖b-Ax‖²=0).   Also showed that if A is full column rank then the minimum x̂ is unique (i.e. every x≠x̂ gives a larger ‖b-Ax‖).

**Further reading:** Textbook section 4.3 and video [lecture 16](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-16-projection-matrices-and-least-squares/).   There are many, many books and other materials on [linear least-squares fitting](https://en.wikipedia.org/wiki/Linear_least_squares), from many different perspectives (e.g. numerical linear algebra, statistics, machine learning…) The brief discussion at the end of the notebook on [Runge phenomena](https://en.wikipedia.org/wiki/Runge%27s_phenomenon) and equally spaced vs. [Chebyshev points](https://en.wikipedia.org/wiki/Chebyshev_nodes) in polynomial fitting was an entry point into [approximation theory](https://en.wikipedia.org/wiki/Approximation_theory); if you are interested, the [book by Trefethen](https://people.maths.ox.ac.uk/trefethen/ATAP/) and accompanying [video lectures](https://people.maths.ox.ac.uk/trefethen/atapvideos.html) are a great place to start.

## Lecture 17 (Mar 11)

* handwritten notes
* [pset 5 solutions](psets/pset5sol.ipynb)
* [pset 6](psets/pset6.ipynb): due March 18, 11am

Showed that N(AᵀA)=N(A), and hence AᵀA is invertible whenever A has full column rank, and AᵀAx̂=Aᵀb is always solvable.

**Gram-Schmidt orthogonalization**: given a non-orthonormal basis a₁,a₂,…, we can *convert* it to an orthonormal basis that **spans the same space**.  All we do is to **take each vector and subtract the projections onto the previous vectors** to make them orthogonal, and divide by their lengths to normalize them.

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

## Lecture 18 (Mar 14)

* handwritten notes

Writing Gram–Schmidt in matrix form: it turns out that what we are "really" doing is factoring A=QR, where Q is a matrix with orthonormal columns spanning C(A) and R is an invertible upper-triangular matrix.

Using QR to solve the least-squares problem: given A=QR, the normal equations AᵀAx̂=Aᵀb turn into the triangular system of equations Rx̂=Qᵀb.

Talked about the computational complexity/scaling: for an m×n matrix A, solving least-squares problem by *either* the normal equations or by QR scale roughly as ~ mn² (dominated by the the cost of forming AᵀA for the normal equations in the former case, or by the cost of Gram–Schmidt or other algorithms for QR factorization in the latter case).

Some practical tips to keep in mind if you ever need to do least-squares or orthogonal basis for real-world problems (not 18.06 exams!) involving data with finite precision:

* Never explicitly form AᵀA or solve the normal equations: it turns out that this greatly exacerbates the sensitivity to numerical errors (in 18.335, you would learn that it squares the [condition number](https://en.wikipedia.org/wiki/Condition_number))  Instead, use the A=QR factorization and solve Rx̂=Qᵀb.  Better yet, just do `A \ b` (in Julia or Matlab) or the equivalent in other languages (e.g. [`numpy.linalg.lstsq`](https://numpy.org/doc/stable/reference/generated/numpy.linalg.lstsq.html)), which will use a good algorithm.   (Even professionals can [get confused about this](https://discourse.julialang.org/t/efficient-way-of-doing-linear-regression/31232/33?u=stevengj).)

* Never use Gram–Schmidt for large matrices, which turns out to be notoriously sensitive to small errors if some vectors are nearly parallel.  People still compute the "same" QR factorization, just using different methods! There is an improved version called "modified Gram–Schmidt" described in the book, but in practice computers actually use a completely different algorithm called "Householder reflections."  You should just use the built-in qr(A)` function in Julia (or similarly other languages), which will do the right thing most of the time.

This is not unusual: there is often a difference between the way we conceptually *think* about linear algebra and the more sophisticated tricks that are required to make it *work well* on *large matrices* of real data.

The QR factorization derived above from Gram–Schmidt is more precisely called the "thin" QR factorization.  There is also a related factorization called "full QR", in which Q is augmented by a basis for N(Aᵀ) to make it a square/unitary matrix and R is augmented by appending m–n rows of zeros.  See also [this blog post by Nick Higham](https://nhigham.com/2020/11/10/what-is-a-qr-factorization/).   In practice, most modern numerical libraries (e.g. Julia's [`qr`](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/#LinearAlgebra.qr) function or Numpy's [`linalg.qr`](https://numpy.org/doc/stable/reference/generated/numpy.linalg.qr.html)) compute the full QR factorization internally, but store Q *implicitly* as a sequence of reflection operations, so that you can quickly multiply by Q or Qᵀ without having to store the whole Q matrix.

**Further reading:** Strang, section 4.4, and video [lecture 17](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-17-orthogonal-matrices-and-gram-schmidt/).  Many advanced linear-algebra texts talk about the practical aspects of roundoff errors in QR and least-squares, e.g. *Numerical Linear Algebra* by Trefethen and Bau (the 18.335 textbook), but this is beyond the scope of 18.06.

## Lecture 19 (Mar 16)

* [Orthogonal polynomials](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Orthogonal-Polynomials.ipynb)

Another wonderful and far-reaching application of these ideas is to realize that the same concepts of orthogonal bases and Gram–Schmidt can be applied to *any* vector space once we define a dot product (giving a so-called [Hilbert space](https://en.wikipedia.org/wiki/Hilbert_space), though we won't use that level of abstraction much in 18.06).  In particular, it turns out to be especially powerful to think about **orthogonal/orthonormal bases of functions**.  Introduced a dot product f⋅g=∫fg for functions defined on x∈[-1,1], and we'll use it to make an orthogonal basis of polynomials, the [Legendre polynomials](https://en.wikipedia.org/wiki/Legendre_polynomials).

**Further reading:** Regarding orthogonal polynomials, for example, see these [TAMU notes on orthogonal polynomials](http://www.math.tamu.edu/~yvorobet/MATH304-503/Lect4-04web.pdf) and [these 18.06 notes on orthogonal polynomials](http://web.mit.edu/18.06/www/Spring09/legendre.pdf), or many other sources, e.g. [this book by Szego (1975)](https://people.math.osu.edu/nevai.1/SZEGO/szego=szego1975=ops=OCR.pdf).

## Lecture 20 (Mar 18)

* [Fourier sine series](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Sine-series.ipynb)
* [Determinants](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Determinants.ipynb)
* [pset 6 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset6sol.ipynb)
* [pset 7](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset7.ipynb) (3 problems): due **Wednesday** March 30

Showed another important example of orthogonal functions: Fourier series, and in particular the [Fourier sine series](https://en.wikipedia.org/wiki/Fourier_sine_and_cosine_series).

The **exam 2 material ends here**.

Started explaining **determinants** and their properties.  Considering how central a role determinants play for the 2×2 and 3×3 matrices you probably encountered before 18.06, you may be surprised that we didn't get to determinants until now.  The fact of the matter is that determinants play a much less important role in applied linear algebra for larger matrices — with a few exceptions, most things that you would want to use determinants for can be done more effectively in other ways.  They are a useful *conceptual* tool, however, especially for thinking about eigenvalues.

Followed notes through the 3 axioms (defining properties) of determinants: det(I)=1, row swap = sign flip, and linearity.

**Further reading (Fourier):** Strang, section 10.5 (Fourier series) and these [18.06 sine-series notes](http://web.mit.edu/18.06/www/Spring09/sines.pdf).  There is a [3blue1brown video](https://youtu.be/r6sGWTCMz2k) on Fourier series, along with many, many other resources and videos you can find online… Fourier series and their generalizations are vastly important for lots of applications as well as being a deep and beautiful mathematical subject for their own sake!

**Further reading (determinants):** Strang, section 5.1; video [lecture 18](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-18-properties-of-determinants).  (We will mostly skip Strang, section 5.2 and 5.3, because the formulas in those sections are not so useful in practice except for tiny matrices.)

## Lecture 21 (Mar 28)

* [Determinants](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Determinants.ipynb)
* [Eigenvalues and polynomials](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Eigenvalue-Polynomials.ipynb)

Finished determinant notebook from previous lecture: derive key properties of determinants from the axioms.

Started on our main topic for exam 3, **eigenvalues and eigenvectors**.  The goal, for an m×m matrix A, is to find a "magic" vector x≠0 such that Ax=λx: for this special "eigenvector", the **matrix acts just like a scalar** λ (the "eigenvalue").   For such a vector, all of linear algebra would become trivially easy, for example A³x=λ³x and A⁻¹x=x/λ.

The trick is to figure out for **what λ an eigenvector exists**, and the key is to realize that Ax=λx is equivalent to (A-λI)x=0: an **eigenvector is a nonzero vector in N(A-λI)**.  Such a nonzero nullspace vector only exists when A-λI is singular, or equivalently **det(A-λI)=0**.  This gives us a way to find eigenvalues λ, and then to find the corresponding eigenvectors x.

 **Further reading (eigenvalues):** Strang, section 6.1; video [lecture 21](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-21-eigenvalues-and-eigenvectors/).

## Lecture 22 (Mar 30)

* handwritten notes
* [Eigenvalues and polynomials](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Eigenvalue-Polynomials.ipynb)
* [pset 7 solutions](psets/pset7sol.ipynb)
* [pset 8](psets/pset8.ipynb): due Friday, April 8

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

## Exam 2 (April 1): 11am in 10-250

* [exam 2](exams/exam2.pdf) and [solutions](exams/exam2sol.pdf)

Exam 2 will cover the material through **lecture 20** and **pset 7**: it will include exam-1 material, but will focus mainly on **everything to do with orthogonality**.  Transposes and dot products, orthogonal subspaces/complements, projections, least-square solutions, orthogonal/orthonormal bases, Gram–Schmidt and QR factorization, orthogonal functions, and the SVD.   Matrix-calculus topics may also be included.

(*Not* covered: determinants and subsequent material.)

*Note:* The average on exam 2 is typically quite a bit lower than on exam 1.  We take this into account in the grading, but don't be complacent if you did well on exam 1!  Exam 2 contains a lot of new material even for people who had seen some linear algebra before.

**Practice problems:** [spring 2009 practice exam 2](http://web.mit.edu/18.06/www/Spring09/practice-quiz2-S09.pdf) problems 1–17; [spring 2009 exam 2](http://web.mit.edu/18.06/www/Spring09/quiz2-s09.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring09/quiz2-s09-soln.pdf)) problem 1–3; [spring 2017 exam 2](http://web.mit.edu/18.06/www/Spring17/exam2.pdf)  ([solutions](http://web.mit.edu/18.06/www/Spring17/exam2-sol.pdf)) problems 1(b,c), 2, 3; [fall 2014 exam 2](http://web.mit.edu/18.06/www/Fall14/midterm2_F14.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall14/Midterm2solF14.pdf)) problem 1; [spring 2014 exam 2](http://web.mit.edu/18.06/www/Spring14/quiz_2_draft.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring14/StrangExamAprilSolutions.pdf)) problems 1,2,4; [spring 2013 exam 2](http://web.mit.edu/18.06/www/Spring13/Exam2blank.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring13/Exam2.pdf)) problems 1, 3; [fall 2012 exam 2](http://web.mit.edu/18.06/www/Fall12/Exam%202/quiz2-1806-f12.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall12/Exam%202/quiz2-1806-f12-sol.pdf)) problems 1,3; [spring 2019 exam 2](https://github.com/mitmath/1806/blob/spring20/psets/quiz2-1806-S19.pdf) ([solutions](https://github.com/mitmath/1806/blob/spring20/psets/quiz2-1806-S19_solns.pdf)) problems 1 (SVD), 5 (calculus); [spring 2019 exam 2 practice](https://github.com/mitmath/1806/blob/spring20/psets/Exam%202%20Practice%20.ipynb) ([solutions](https://github.com/mitmath/1806/blob/spring20/psets/midterm_2_practice_problems_solns.ipynb)) problems 4 & 5 (calc), 9 & 10 & 12 & 13 (SVD);

**Review session** (4pm Mar 30, 32-155): [practice problems](https://www.dropbox.com/s/ulhfff1kn5dy1n9/18.06%20Exam%202%20Review.pdf?dl=0)

## Lecture 23 (April 4)

* handwritten notes
* [Diagonalization](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Diagonalization.ipynb)

Covered **diagonalization** of a matrix: the process of expanding a vector in the basis of eigenvectors, then multiplying each one by λ, then adding up the eigenvectors with the new coefficients, can be thought of as the matrix factorization A=XΛX⁻¹, where X is the matrix whose columns are the eigenvectors.   This only works if X is invertible: i.e. when for an m×m matrix A we have m eigenvalues (possibly repeated) and m independent eigenvectors (a *basis* of eigenvectors).  Such a matrix is called **diagonalizable**.

It turns out that **almost all matrices in practice are diagonalizable**, so for the most part we will only deal with diagonalizable matrices in 18.06.  The exceedingly rare exceptions are called **defective** matrices (and can only occur when there are *repeated roots* in the characteristic polynomial); we will talk about such defective (non-diagonalizable) cases much later.

Defined [similar matrices](https://en.wikipedia.org/wiki/Matrix_similarity) B=M⁻¹AM, and showed that similar matrices have the same *eigenvalues* (with eigenvectors related by a factor of M), the same *determinant*, the same *characteristic polynomial*, and the same *trace*.  Defined the [trace](https://en.wikipedia.org/wiki/Trace_(linear_algebra)) of a matrix tr(A),
and showed tr(AB)=tr(BA) for any m×n matrix A and n×m matrix B.  (We saw in lecture 12 that similar matrices essentially
represent the *same linear operation in a different coordinate system.*)  In hindsight, we
now see that a diagonalizable matrix A is *similar to a diagonal matrix Λ*.  Hence, we
see that det(A) is the *product* of the eigenvalues and tr(A) is the *sum* of the eigenvalues.

For a 2×2 matrix, it follows that det(A-λI)=λ²-λtr(A)+det(A), which is a useful formula when solving 2×2 eigenproblems.

**Further reading:** Strang, section 6.2; video [lecture 22](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-22-diagonalization-and-powers-of-a/) and video [lecture 28](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-28-similar-matrices-and-jordan-form/).

## Lecture 24 (April 6)

* [Recurrences and Fibonacci numbers](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Fibonacci.ipynb)
* [Markov matrices](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Markov.ipynb)
* [Analyzing Chutes & Ladders](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Chutes-and-Ladders.ipynb)

As an application of matrix powers, considered the famous [Fibonacci numbers](https://en.wikipedia.org/wiki/Fibonacci_number) 1,1,2,3,5,8,13,21,….  The n-th Fibonacci number fₙ satisfies the [linear recurrence relation](http://mathworld.wolfram.com/LinearRecurrenceEquation.html) fₙ=fₙ₋₁+fₙ₋₂, which we can express in terms of multiplication by a 2×2 matrix F that gives (fₙ,fₙ₋₁) from (fₙ₋₁,fₙ₋₂).  We found that the eigenvalues of F are (1±√5)/2.  The larger of these eigenvalues, (1+√5)/2≈1.618, is the so-called [golden ratio](https://en.wikipedia.org/wiki/Golden_ratio), and it means that the Fibonacci numbers blow up exponentially fast for large n.  Furthermore, we showed that the *ratio* fₙ/fₙ₋₁ of successive Fibonacci numbers goes to the golden ratio for large n.   Checked these facts numerically with a Julia notebook.

As another example of matrix powers, considered [Markov matrices](https://en.wikipedia.org/wiki/Stochastic_matrix) (particularly positive Markov matrices), their eigenvalues, and the *steady state* solution.  These have lots of fun applications in statistics, including analyzing simple games such as Chutes & Ladders.

**Further reading:** Strang, section 10.3 and video [lecture 24](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-24-markov-matrices-fourier-series/).

## Lecture 25 (April 8)

* [Complex eigenvalues](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Complex-Eigenvalues.ipynb)
* [pset 8 solutions](psets/pset8sol.ipynb)
* [pset 9](psets/pset9.ipynb): due Friday 4/15

Went over Chutes & Ladders Markov-matrix example from the previous lecture.

Briefly reviewed **complex numbers**, including the [complex conjugate](https://en.wikipedia.org/wiki/Complex_conjugate) z̄, the magnitude |z|=√zz̄, and the [polar form](https://en.wikipedia.org/wiki/Polar_coordinate_system#Complex_numbers) re<sup>iϕ</sup> using [Euler's formula](https://en.wikipedia.org/wiki/Euler%27s_formula) e<sup>iϕ</sup>=cos(ϕ)+isin(ϕ).

Discussed complex eigenvalues of **real** matrices A, and showed:

* The complex eigenvalues and corresponding eigenvectors come in *complex-conjugate pairs*.
* Expanding an arbitrary **real** vector x in the eigenvector basis (c=X⁻¹x) leads to *complex-conjugate* coefficients of the corresponding complex eigenvectors, and hence terms 2Re[cₖxₖ] in the expansion.
* Matrix powers Aⁿ lead to exponential growth/decay determined by the *magnitude* |λₖ| of the eigenvalues.  For complex eigenvalues, the *phase* e<sup>iϕₖ</sup> leads to *oscillating* terms.

**Further reading** This [brief review of complex numbers](https://web.stanford.edu/~boyd/ee102/complex-primer.pdf) (from Stephen Boyd at Stanford) is at about the level of my lecture.  There are many more basic reviews, e.g. from [Khan academy](https://www.khanacademy.org/math/algebra2/x2ec2f6f830c9fb89:complex), that you can find online.  Chapter 9 of Strang's textbook discusses complex vectors and matrices.

## Lecture 26 (April 11)

* [Ordinary differential equations (ODEs)](https://nbviewer.org/github/mitmath/1806/blob/master/notes/ODEs.ipynb).

We can now solve systems of ODEs dx/dt = Ax in terms of eigenvectors and eigenvalues.
Each eigenvector is multiplied by exp(λt) (where exp(x)=eˣ), so that solutions decay
if the eigenvalues have *negative real parts* (and approach a nonzero steady state
if one eigenvalue is *zero*).

Covered notebook (above), stopping just before the "Overdamping" section.

(Soon, we will also express this in terms of a new
Matrix operation eᴬᵗ, the [matrix exponential](https://en.wikipedia.org/wiki/Matrix_exponential).)

**Further reading:** Strang, section 6.3 and video [lecture 23](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-23-differential-equations-and-exp-at/).

## Lecture 27 (April 13)

* [Matrix exponentials eᴬ](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Matrix-Exponentials.ipynb).

Continued discussion of ODEs from last lecture, discussing the over/underdamped case and the example of multiple coupled masses and springs.

Next, reformulated the solution of dx/dt=Ax in terms of the [matrix exponential](https://en.wikipedia.org/wiki/Matrix_exponential) eᴬᵗ, and discussed the definition and properties of this fascinating and important matrix operation.

**Further reading:** Strang, section 6.3 and video [lecture 23](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-23-differential-equations-and-exp-at/).

## Lecture 28 (April 15)

* handwritten notes
* [pset 9 solutions](psets/pset9sol.ipynb)
* [pset 10](psets/pset10.ipynb)

### Complex matrices, vectors, and dot products: the adjoint H

To go further, we need
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

Now, for a Hermitian matrix A=Aᴴ (= real-symmetric if A is real) we have:

* All the eigenvalues λ are **real**.  (The eigenvectors are *not* generally real unless A is real.)_
* The matrix is always **diagonalizable** (no funny defective case).
* Eigenvectors for different λ are **orthogonal** (and hence eigenvectors can be chosen to be **an orthonormal basis**).

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

**Further reading:** Strang, sections 6.4, 9.2;  [lecture 25](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-25-symmetric-matrices-and-positive-definiteness/), and [lecture 26](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-26-complex-matrices-fast-fourier-transform/).

## Lecture 29 (April 20)

* handwritten notes

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

We can also easily see (e.g. via the xᴴAx > 0 property) that the *sum* of positive-definite matrices is also positive definite.

### Constructing postive-definite matrices: Masses and springs

As an application of real-symmetric and positive-definite matrices, I returned
to the system of masses and springs from our first ODE lectures, but this time I considered
n masses m and n+1 springs kᵢ.   I showed that Newton's laws take the form:

* mẍ = -DᵀKDx ⟹ ẍ = -Ax, where D is "difference" and K is a diagonal matrix of spring constants, so that A=Dᵀ(K/m)D.

A is obviously real-symmetric, so its eigenvalues λ are real.  With a little more work, we saw that it must be positive-definite.  For example, A=-BᵀB for B = √(K/m)D, with √(K/m) being the diagonal matrix with √(kᵢ/m) on the diagonal, so A must be negative semidefinite.

**Further reading:** Strang, sections 6.5;  [lecture 25](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-25-symmetric-matrices-and-positive-definiteness/).

## Lecture 30 (April 22)

* handwritten notes
* [pset 10 solutions](psets/pset10sol.ipynb)
* [pset 11](psets/pset11.ipynb), due Friday April 29.

### Masses and springs, continued

A little more consideration of the matrix from last lecture shows that A must be negative *definite*: it cannot have λ=0 eigenvalues, i.e. N(A)=N(B)=N(D)={0}.  Since Dᵀ is upper triangular, by inspection it has rank n (n pivots), and hence D has full column rank and N(D)={0}=N(A).

The fact that A is negative definite allowed us to derive that *any* such system of masses and springs has *orthogonal oscillating solutions* called the [normal modes](https://en.wikipedia.org/wiki/Normal_mode). In particular, given the eigenvectors vⱼ (orthogonal since A is real-symmetric!), satisfying Aqⱼ=λⱼqⱼ with λⱼ<0, we expanded the solution x(t)=∑ⱼcⱼ(t)qⱼ in the basis of these eigenvectors qⱼ.  For each eigenvector component, the matrix A acts just like a negative number λⱼ=-ωⱼ², allowing us to easily solve the equation c̈ⱼ=-ωⱼ²cⱼ to get sines and cosines, and hence to get the general solution:

* x(t) = ∑ⱼ [αⱼ cos(ωⱼt) + βⱼ sin(ωⱼt)] qⱼ

where ωⱼ=√-λⱼ, and αⱼ and βⱼ are determined from the initial conditions x(0) and ẋ(0).

The key point is that the **structure** of the problem told us that λⱼ<0 and
hence that the **frequencies** ωⱼ are **real** numbers.  (If they were complex, we would have exponentially growing or decaying solutions, which would make no physical sense for a system of lossless springs and masses.)  The moral of this story is that real-symmetric and definite matrices don't just fall down out of the sky, they arise from how the matrix was constructed, and that these matrix properties are often the key to understanding the physical properties of real problems.

### Eigenproblems and the SVD

For any m×n matrix A, there are two "nice" matrices AᴴA and AAᴴ, both of which are Hermitian positive semidefinite (orthonormal bases of eigenvectors, real eigenvalues ≥ 0).   How can we use these "nice" matrices to go back and help us **understand A**?   It turns out that this leads us directly back to the **singular value decomposition (SVD)**.

In particular we find:

* There are r positive eigenvalues λⱼ=σⱼ² of AᴴA, where r = rank A.  Let vⱼ be the corresponding orthormal eigenvectors — these are a basis for C(Aᴴ).
* The vectors uⱼ=Avⱼ/σⱼ are actually **eigenvectors** of AAᴴ, are **orthonormal**, and form a basis for C(A).
* These uⱼ, vⱼ and σⱼ are exactly the left and right singular vectors and the corresponding singular values of A!

**Further reading:** Strang, section 10.2.  See also [these notes on the springs-and-masses problem](https://github.com/mitmath/18303/blob/fall15/lecture-5.5.pdf) from [18.303](https://github.com/mitmath/18303/tree/fall15) (you can ignore the last two pages, which go beyond 18.06, and ignore the Δx factor which is used in 18.303 to connect the discrete problem to a continuous problem).  **SVD**: Strang, sections 7.1–7.2, and video [lecture 29](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-29-singular-value-decomposition/).  Notes on the [SVD as an eigenproblem](https://github.com/mitmath/1806/blob/master/notes/SVD-eigenproblem.ipynb).
