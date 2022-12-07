# MIT Course 18.06, Fall 2022

This is a repository for the course [18.06: Linear Algebra](http://web.mit.edu/18.06) at MIT in Fall 2022.   See [other branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-branches-in-your-repository/viewing-branches-in-your-repository) of this repository for previous semesters.

**Instructor**: [Prof. Steven G. Johnson](http://math.mit.edu/~stevenj).  Course administrator: [Sergei Korotkikh](https://math.mit.edu/directory/profile.php?pid=2113).

**Lectures**: MWF11 in 26-100.  [Handwritten notes](https://www.dropbox.com/s/a1xy4oh6wb2i5ub/18.06%20Fall%202022.pdf?dl=0) are posted online, along with video recordings ([on Canvas Panopto Video](https://mit.hosted.panopto.com/Panopto/Pages/Sessions/List.aspx?folderID=87c54afd-f3c7-4cb8-b173-af0e00faf1d0)) and other materials (slides, further reading) in the lecture summaries below.

**Exams**: 11am in 26-100, on 10/7, 11/14, & 12/9.  Final exam: 12/22 9am-noon in Dupont Gym.

**Recitations**:

 * R01,R02 — [Chirag Falor](https://web.mit.edu/directory/?id=cfalor&d=mit.edu): T9 in 2-143, T10 in 2-146 (office hours Mon 3pm [via Zoom](https://mit.zoom.us/j/96071172098), Wed 3pm in 2-449).
 * R03,R05 — [Melissa Sherman-Bennett](https://sites.google.com/view/mshermanbennett): T11 in 2-147, T12 in 2-147 (office hours Wed 10am [via Zoom](https://mit.zoom.us/j/96071172098), Thurs 10am in 2-136).
 * R04 — [Sergei Korotkikh](https://math.mit.edu/directory/profile.php?pid=2113): T11 in 2-146 (office hours Tues 6pm [via Zoom](https://mit.zoom.us/j/96071172098), Thurs 6pm in 2-231D).
 * R06,R09 — [Victor Rong](https://web.mit.edu/directory/?id=vrong&d=mit.edu): T12 in 2-146, T1 in 2-146 (office hours Mon 8pm [via Zoom](https://mit.zoom.us/j/96071172098), Tues 2pm in 2-361).
 * R07,R08 — [Mitchell Harris](https://math.mit.edu/directory/profile.php?pid=2180): T12 in 2-361, T1 in 2-142 (office hours Mon 2pm [via Zoom](https://mit.zoom.us/j/96071172098), Fri 2pm in 32-D707).
 * R10,R11 — [Ishan Levy](https://math.mit.edu/directory/profile.php?pid=2185): T1 in 2-136, T2 in 2-142 (office hours Thurs 10:30am [via Zoom](https://mit.zoom.us/j/96071172098), Wed 2pm in 2-390).
 * R12,R13 — [Gefei Dang](https://math.mit.edu/directory/profile.php?pid=2178): T2 in 2-146, T3 in 2-142 (office hours Thurs 4pm [via Zoom](https://mit.zoom.us/j/96071172098), Wed 5pm in 2-239).

**Undergraduate Assistants**: Raza Abbas, Alvin Chen, Christina Mirro, and Daniel Villagran.   Email them at **1806fall22_ua ατ mit.edu** for 1-on-1 technical help with Julia or other questions that don't work well over Piazza etc.

**Resources**: [Piazza discussion forum](https://piazza.com/class/l7g5ixuivav3rm), [math learning center](https://math.mit.edu/learningcenter/), [TSR^2 study/resource room](https://ome.mit.edu/programs/talented-scholars-resource-room-tsr2), [pset partners](https://psetpartners.mit.edu/).

This document is a *brief* summary of what was covered in each 18.06
lecture, along with links and suggestions for further reading.  It is
*not* a good substitute for attending lecture, but may provide a
useful study guide.  (You can also look at the analogous summaries from [Spring 2022](https://github.com/stevengj/1806/blob/spring22/README.md).)

## Lecture 1 (Sep 7)

* [course overview/syllabus](https://docs.google.com/presentation/d/1ivbV1nr67XfasBdXezZF9UWILzDoQtQev8vSqRKBfu0/edit?usp=sharing)
* [pset 1](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset1.ipynb): due **Friday Sep 16 at 11am** (submit your solutions on Gradescope).
* [video](https://mit.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=19855fd0-d2be-4252-aa41-af0900816383)

Slides giving the syllabus and the "big picture" of what 18.06 is about.  Introduction to thinking about matrices as linear operations, not just as "bags of numbers".

**Further reading**: Strang, chapter 1, and section 8.1 on linear transformations.  3blue1brown has a nice video on [matrix multiplication as composition of linear transformations](https://youtu.be/XkY2DOUCWMU).  If you've forgotten the basics of how to multiply matrices by vectors or matrices by matrices, google for some tutorial material online (e.g. [Khan academy](https://www.khanacademy.org/math/precalculus/x9e81a4f98389efdf:matrices/x9e81a4f98389efdf:multiplying-matrices-by-matrices/a/multiplying-matrices)) and do a quick brush-up.

## Lecture 2 (Sep 9)

* handwritten notes: see link above (at beginning)
* [video](https://mit.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=b9662b0d-6280-448a-b745-af090062417b)

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

We're not done: it turns out to be even more fruitful to *reverse* the process, and write A = LU: L represents the operations required to turn the matrix U back into A, and turns out toe be a **lower**-triangular matrix whose entries are just a record of the elimination steps.  This **LU factorization** is extremely useful and important because it allows us to replace a *complicated* matrix A with two *much simpler* (triangular) ones.  For example, solving Ax=b turns into LUx=b, and we can do this just by two "triangular" solves.  More on this next time.

**Further reading:** Textbook sections 2.1, 2.2, 2.3.  Strang [lecture 2 video](https://www.youtube.com/watch?v=QVKj3LADCnA&list=PLE7DDD91010BC51F8&index=3).   And there is a Gaussian-elimination [Julia notebook](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Gaussian-elimination.ipynb) that covers the same steps in Julia form.
See also "The key reason why A = LU" in section 2.6 of the textbook.

## Lecture 3 (Feb 4): recorded

* video (only): see the [spring 2022 recording](https://mit.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=885fb286-4dab-4aa6-9ef0-ae2e00f05ceb), lecture 3
* handwritten notes
* [Matrix inverse and LU notebook](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Inverses-LU-intro.ipynb)

(Prof. Johnson is sick and so we will use the recorded lecture from spring.)

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

## *Optional* Julia Tutorial: recorded

* [video recording](https://mit.zoom.us/rec/share/w7o2TQjDOnHsaRlJvbS1iysu5Sh23gGVFt3nX_VShRoRBr5UCsPlMhEu1EeyQrk.Vq1WOfArkC3v-Lma?startTime=1643839179000)

(No live tutorial since Prof. Johnson is sick.)

A basic overview of the Julia programming environment for numerical computations that we will use in 18.06 for simple computational exploration.   This (Zoom-based) tutorial will cover what Julia is and the basics of interaction, scalar/vector/matrix arithmetic, and plotting — we'll be using it as just a "fancy calculator" and no "real programming" will be required.

* [Tutorial materials](https://github.com/mitmath/julia-mit) (and links to other resources)

If possible, try to install Julia on your laptop beforehand using the instructions at the above link.  Failing that, you can run Julia in the cloud (see instructions above).

## Lecture 4 (Sep 14)

* [video recording](https://mit.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=faf2a3ef-fcc2-4ff4-a928-af0900628908)
* [Matrix inverse and Gauss–Jordan](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Gauss-Jordan.ipynb)

Reviewed matrix inverses and key properties thereof.

Went through how to explicitly compute A⁻¹ by solving AA⁻¹ = I.   Essentially, this is just solving Ax=b multiple times, where b is each column of I. A common way to organize this for *hand* calculation (ugh) is the Gauss–Jordan algorithm (on a 3×3 example that can also be found in the textbook): If we do row operations on A to get I, then the *same* row operations on I give A⁻¹!  To carry this out by hand, we augment (A|I), do ordinary Gaussian elimination to get (U|C), and then do elimination "upwards" to get (I|A⁻¹).

Matrix inverses are mainly a *conceptual* tool that we use to move matrices around *symbolically* in equations.   Once you are through with your algebraic manipulations, you might end up with an expression like A⁻¹b — but when it comes time to actually *compute* the answer, you should **read "A⁻¹b" as "solve Ax=b for x by the best available method"**.

**Further reading:** Textbook sections 2.5, 2.6.  Strang [video lecture 3](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-3-multiplication-and-inverse-matrices/).


## Lecture 5 (Sep 16)

* [Video recording](https://mit.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=32b37815-81a0-42aa-a2a5-af0c00d75c55)
* [pset 1 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset1sol.ipynb)
* [pset 2](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset2.ipynb): due **Mon** Sep 26 (Friday is a holiday).
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

## Lecture 6 (Sep 19)

* video: Panopto Video link on Canvas
* handwritten notes
* [Computational complexity](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Complexity.ipynb)

Complexity of matrix operations: why matrix × vector or backsubstitution scale like n² for n×n matrices, while matrix × matrix or Gaussian elimination (LU factorization) scale like n³.   Matrices much bigger than a few thousand square quickly become impractical, and really large problems are only tractable because they have special structure like [sparsity](https://en.wikipedia.org/wiki/Sparse_matrix).

The next few weeks will be devoted to problems arising from **singular** and **non-square** matrices.   A "singular" square matrix is one for which we "run out of pivots" when doing elimination (we hit zeros on the diagonal we can't remove with row swaps).   Non-square matrices are either "tall" (arising in **overdetermined** systems with more equations than unknowns, leading to **fitting** problems and *approximate* solutions) or "wide" (arising in **underdetermined** systems with more unknowns than equations, leading to *freedom* in the choice of solution and *regularization* techniques to impose "priors" on this choice).   A key technique that will help us understand these equations is to **break vectors into simpler/smaller vectors**.   To do this we must first broaden our concept of a "vector".

Introduced **vector spaces** (informally, a set V of anything you can add x±y and multiply by scalars αx) and **subspaces** (a subset of V such that vector operations *stay in the subspace*).  Examples of vector spaces include real n-component vectors (ℝⁿ, or ℂⁿ for complex numbers), real m×n matrices, functions f(x) (ℝ↦ℝ, real numbers to real numbers).  Examples of subspaces includes planes or lines through the origin in ℝ³, or the origin itself.   The goal of this is to break vector spaces into smaller pieces that we can still do linear algebra on (hence the need for a subspace, not just any arbitrary subset).  Subspaces are especially important to help us understand the solutions (if any) of Ax=b for **non-square** matrices A.

**Further reading:** Textbook sections 2.6 ("The cost of elimination") and 11.1.   Section 3.1 and 3.2 on vector spaces and subspaces.

## Lecture 7 (Sep 21)

* video: Panopto Video link on Canvas
* Handwritten notes

Reviewed **vector spaces** (informally, a set V of anything you can add x±y and multiply by scalars αx) and introduced **subspaces** (a subset of V such that vector operations *stay in the subspace*).  Examples of vector spaces include real n-component vectors (ℝⁿ, or ℂⁿ for complex numbers), real m×n matrices, functions f(x) (ℝ↦ℝ, real numbers to real numbers).  Examples of subspaces includes planes or lines through the origin in ℝ³, or the origin itself.   The goal of this is to break vector spaces into smaller pieces that we can still do linear algebra on (hence the need for a subspace, not just any arbitrary subset).  Subspaces are especially important to help us understand the solutions (if any) of Ax=b for **non-square** matrices A.

For an m×n matrix A, introduced two important subspaces.

* First, the **column space C(A)**: the set {Ax for all x ∈ ℝⁿ}.  This is the set of *right-hand sides* b such that Ax=b is *solvable*, and is a subspace of the "output space" ℝᵐ (not ℝⁿ unless m=n!).  Equivalently, C(A) is all linear combinations of the *columns* of A, which we call the **span** of the columns.

* Second, the **null space N(A)** (also called the "kernel"): the set {x such that Ax=0} ⊆ ℝⁿ (i.e., a subspace of the "input space" ℝⁿ).  Given any solution x to Ax=b, then x+z is also a solution if z ∈ N(A) (i.e. Az=0 ⟹ A(x+z)=Ax+Az=Ax=b).

These are very important subspaces because they tell us a lot about the matrix A and solutions to Ax=b.  As a trivial example, if A is an n×n *invertible* matrix, C(A)=ℝⁿ and N(A)={0}.  Conversely, if A is an m×n matrix of zeros, then C(A)={0} and N(A)=ℝⁿ.

Defined a **basis** for a vector space as a *minimal* set of vectors (we will later say that they have to be *linearly independent*) whose
**span** (all linear combinations) produces everything in the space.  The number of vectors in any basis is the **dimension** of the vector space.

Showed that the **nullspace is preserved by elimination (row) operations**, but that the column space is not.   So, to find N(A), we can instead do elimination and find N(U)=N(A) for the upper-triangular form U.   We now want to find *all* possible solutions to Ax=0.

**Further reading:** Textbook, sections 3.1—3.3; Strang [video lecture 6](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-6-column-space-and-nullspace/) and [lecture 7](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-7-solving-ax-0-pivot-variables-special-solutions/).   Note that Strang's lectures and book emphasize the "reduced row echelon" ("rref") form, which is essentially a bookkeeping trick (similar to Gauss–Jordan for inverses) to do the back-solves for the special solutions all at once.  I will *not* emphasize rref form this semester, but you can use it if you want.  (In practical applications, rref form is virtually never used, and for that matter one doesn't actually use elimination at all to find null spaces; instead, one uses something called the [SVD](https://en.wikipedia.org/wiki/Singular_value_decomposition) that we will cover later.)

## Lecture 8 (Sep 26)

* video: Panopto Video link on Canvas
* handwritten notes
* [pset 2 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset2sol.ipynb)
* [pset 3](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset3.ipynb): due **Friday** Sep 30

Went through two examples of finding the special solutions as a basis for the nullspace.  They key point is always this: given the free variables, we can easily solve for the corresponding pivot variables.

We can now find the **complete solution** (i.e., all solutions) to a non-square linear system Ax=b.  Elimination turns this into Ux=c. We look for solutions in the form xₚ + xₙ: a **particular solution** xₚ plus any vector xₙ in N(A) (specified explicitly from the basis).  The particular solution xₚ can be *any* solution to Ax=b, but the simplest one to find is usually to *set the free variables* to zero.  That is, we write the solution xₚ=(p; 0) where p is the unknown values in the pivot rows, setting the other (free) rows to zero, then plug into Uxₚ=c to get p.  Since this extracts the part of U that is upper triangular, we can easily solve it.   Then we add in anything in N(A).

I used a 3×4 example matrix A (similar in spirit to one in the textbook, section 3.3) that was **rank deficient**: after elimination, we only had two pivots (rank r=2) in the first two rows, and a whole row of zeros.   Furthermore, its pivot columns were the first and *third* columns, with the second and fourth columns being free — this is possible (albeit unusual)!   Showed that we could still get the special solutions by solving for the pivot variables in terms of the free variables = (1,0,…) etcetera, and we still got dimension n-r (= 2) for the null space.   When solving Ax=b by elimination into Ux=c, however, we *only got a solution x if c was zero in the same rows as U*.  If the zero third row of U was matched by a zero third row of c, then we got a particular solution as before by setting the free variables to zero.  If the zero third row of U was *not* matched by a zero third row of c, then there is *no* solution: b was *not in the column space* C(A).  This gives an easy way to check whether the right-hand-side is in the column space.  Went through an example right-hand-sides with no solutions, and in next lecture I'll cover one with infinitely many solutions.

**Further reading:** Textbook sections 3.3–3.4, [lecture 8](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-8-solving-ax-b-row-reduced-form-r/).  As noted in lecture 7, I'm not emphasizing the trick of "rref" form (used extensively by Strang's book and lectures) which makes hand calculation *slightly* easier, but might push students towards memorizing formulas (which are useless in the long run).

## Lecture 9 (Sep 28)

* handwritten notes and lecture video (see links above).

Finished the discussion of "complete solutions" of Ax=b from last lecture, by choosing a right-hand side b ∈ C(A), finding the particular solution (by setting the free variables to zero and solving for the pivot variables), and then adding in the null-space vectors to describe all possible solutions.

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

## Lecture 10 (Sep 30)

* handwritten notes and lecture video (see links above).
* [pset 3 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset3sol.ipynb)
* [pset 4](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset4.ipynb): a short pset due Wed Oct 5

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

(The consequence of this is an amazing fact: A and Aᵀ have the **same rank** r, since C(A) and C(Aᵀ) must have the same dimension r.   Thus, if you do Gaussian elimination on A and Gaussian elimination on Aᵀ, you will get the **same number of pivots** in both cases even though the elimination processes are quite different.)

**Further reading:** Textbook sections 3.5, 4.1; video
[lecture 10](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-10-the-four-fundamental-subspaces/), video [lecture 14](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-14-orthogonal-vectors-and-subspaces/).  Julia [notebook on transposes and orthogonality](https://github.com/mitmath/1806/blob/master/notes/Transposes.ipynb).

## Lecture 11 (Oct 3)

* handwritten notes and lecture video (see links above).
* [slides](https://docs.google.com/presentation/d/1SXAmVB07xdLRa8eBQFF5wI0RDpjC1u1-zHd1oPEtkXM/edit?usp=sharing)

Reviewed and broadened differential calculus (18.01 and 18.02) from the perspective of 18.06, where we view a derivative f′(x) as a **linear operator** acting on a small change in the input (dx) to give you the change in the output (df) to *first order* in dx ("linearized").   This viewpoint makes it easy to generalize derivatives, to scalar-valued functions of vectors where f′(x) is the transposed gradient (∇f)ᵀ, to vector-valued functions of vectors where f′(x) is the [Jacobian matrix](https://en.wikipedia.org/wiki/Jacobian_matrix_and_determinant), and even to matrix-valued functions of matrices like f(x)=A⁻¹ where f′(x) is the linear operator f′(x)[dA]=–A⁻¹dAA⁻¹.

Derivatives viewed as linear approximations have many important applications in science, machine learning, statistics, and engineering. For example, went over the **multidimensional Newton** algorithm for finding roots f(x)=0 of systems of nonlinear equations. At each step, you just solve a *linear* system of equations with the Jacobian matrix of f(x), and it converges incredibly rapidly.   (See notebook for

**Further reading**: This material was presented in much greater depth in our [18.S096: Matrix Calculus](https://github.com/mitmath/matrixcalc) course in IAP 2022 and IAP 2023.    The viewpoint of derivatives as linear operators (also called [Fréchet derivatives](https://en.wikipedia.org/wiki/Fr%C3%A9chet_derivative)) was covered in lectures 1 and 2, Newton's method was covered in lecture 4, and automatic differentiation was covered in lecture 5 — see the posted lecture materials and the further-reading links therein.   This [notebook](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Newton-Thomson-example.ipynb) has a Newton's method example demo where we solve a 2d version of the famous [Thomson problem](https://en.wikipedia.org/wiki/Thomson_problem) to find the equilibrium position of N repulsive "point charges" constrained to lie on a circle; more generally, a sphere or hypersphere.

## Lecture 12 (Oct 5)

* handwritten notes and lecture video (see links above).
* [pset 4 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset4sol.ipynb)
* [pset 5](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset5.ipynb), due Friday Oct 14

*Continued from lecture 11*: Analyzed derivatives of matrix-valued functions of matrices, like f(x)=A⁻¹ where we showed that f′(x) is the linear operator f′(x)[dA]=–A⁻¹dAA⁻¹.  Using this, if we have a matrix A(p) as a function of a parameter p, showed that we can compute d(A⁻¹)/dp = –A⁻¹(dA/dp)A⁻¹ easily.  This has enormous applications, for example in engineering optimization where you often want to differentiate the solution to a physical problem (often expressed as Ax=b) with respect to parameters of the problem (in A and/or b), in order to optimize the physics (e.g. to maximize the strength of a structure with a given amount of material): see slides from lecture 11.

### Orthonormal bases

Talked about the viewpoint that solving Ax=b when A has full column rank (i.e. independent columns) is equivalent to a change of basis, or writing b in a "new coordinate system".

However, viewing the columns of A as a basis or "coordinate system", it becomes clear that some bases are nicer than others.  (Especially if the basis vectors are *nearly linearly independent* (e.g. nearly parallel), or equivalently if *A is nearly singular*, then the new coordinate system can be difficult and confusing to use.)

A *much nicer* "coordinate system" is an [orthonormal basis](https://en.wikipedia.org/wiki/Orthonormal_basis): vectors q₁,q₂,…,qₙ that are orthogonal to one another and have length 1.   One way of looking at this: **to change "coordinates" to an orthonormal basis just involves dot products.**
  - If you have a non-orthonormal basis a₁,a₂,…, then to write an arbitrary vector b in this basis, i.e. b = a₁x₁ + a₂x₂ + ⋯ with coefficients x₁,x₂,…, you need to solve a linear system Ax=b for x.  Hard!  (∼m³).
  - For an orthonormal basis q₁,q₂,… then to write b = q₁x₁ + q₂x₂ + ⋯ you can **just take dot products** xᵢ=qᵢᵀb.  For example, if you take the dot product q₁ᵀb, then you get x₁ (the coefficient of q₁), because all the other terms have dot product *zero*.

Equivalently, we can put these q₁,q₂,…,qₙ into a matrix Q:

* Saying that the columns of Q are orthonormal vectors is *equivalent* to saying QᵀQ = I.
* If Qx=b is solvable, then the solution simply is x=Qᵀb, which is *equivalent* to taking the dot products of b with each qₖ vector to get xₖ as above.

We will have much more to say about such Q matrices in the coming lectures.

**Further reading:** 3blue1brown has a [nice video on changes of basis](https://www.youtube.com/watch?v=P2LTAUO1TdA).  Textbook sections 3.5, 4.1; video
[lecture 10](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-10-the-four-fundamental-subspaces/), video [lecture 14](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-14-orthogonal-vectors-and-subspaces/).

## Exam 1 (Friday Oct 7 at 11am in 26-100)

Exam 1 will cover the material through **lecture 10** and **pset 4**, including: linear operators, matrix–matrix and matrix–vector operations and interpretations thereof, writing/working with equations in matrix form, solving systems of equations with one or more right-hand sides, Gaussian elimination, back/forward-substitution and triangular matrices, LU factorization and PA=LU, permutation matrices, matrix inverses and Gauss–Jordan, singular matrices, computational costs (which operations are ~ m² or ~ m³ etc and arranging calculations efficiently), rank of a matrix (= number of pivots), vector space & subspaces, null space & special solutions, pivot/free columns column spaces, bases and dimensions of vector spaces, checking whether Ax=b is solvabe, complete solutions to Ax=b (including non-square matrices), transposes and dot products, orthogonality and orthogonal complements, the four fundamental subspaces.

The exam is **closed book/notes**. (No calculators or computers either.)

* [Exam 1](exams/exam1.pdf) and [solutions](exams/exam1sol.pdf)

* (Optional) **review session**: Thursday 5/6 4–5pm via Zoom: see [recording](https://mit.zoom.us/rec/share/RVnjARqopGxQtnhnCqP57okdWmccGq2MQac8FSuZVkQnmB_WVUH5MQx6GAvP1Z7R.g-ofGE6IRBUuAD2L?startTime=1665086667000), [handwritten notes](https://www.dropbox.com/s/xnowl6zoe1js1t8/18.06%20Fall%2022%20Exam%20Reviews.pdf?dl=0), and practice problems: [spring 2022 exam 1](https://github.com/mitmath/1806/blob/spring22/exams/exam1.pdf) problems 1 and 3 ([solutions](https://github.com/mitmath/1806/blob/spring22/exams/exam1sol.pdf)), fall 2014 exam 1 (below) problem 4, spring 2008 exam 1 (below) problem 1, [spring 2022 final exam](https://github.com/mitmath/1806/blob/spring22/exams/final.pdf) problems 1 and 5 ([solutions](https://github.com/mitmath/1806/blob/spring22/exams/finalsol.pdf)).

Some practice problems: [spring 2017 exam 1](http://web.mit.edu/18.06/www/Spring17/exam1.pdf) problems 1–4 ([solutions](http://web.mit.edu/18.06/www/Spring17/exam1-sol.pdf)); [fall 2017 exam 1](https://github.com/stevengj/1806/blob/fall17/exams/exam1.pdf) problems 1-4 ([solutions](https://github.com/stevengj/1806/blob/fall17/exams/exam1-sol.pdf)); [fall 2017 exam 2](https://github.com/stevengj/1806/blob/fall17/exams/exam2.pdf) problem 1a,b ([solutions](https://github.com/stevengj/1806/blob/fall17/exams/exam2-sol.pdf));
[fall 2014 exam 1](http://web.mit.edu/18.06/www/Fall14/midterm1_F14.pdf) problems 1, 2, 3, 4c/d/e  ([solutions](http://web.mit.edu/18.06/www/Fall14/Midterm1solF14.pdf));
[fall 2012 exam 1](http://web.mit.edu/18.06/www/Fall12/Exam%201/quiz1-1806-f12.pdf) problems 1–4 ([solutions](http://web.mit.edu/18.06/www/Fall12/Exam%201/quiz1-1806-f12-solution.pdf));
[spring 2008 exam 1](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08.pdf) problems 1–4 ([solutions](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08-soln.pdf));  [fall 2011 exam 1](http://web.mit.edu/18.06/www/Fall11/q1_f11.pdf) problem 1–3 ([solutions](http://web.mit.edu/18.06/www/Fall11/q1_f11_solution.pdf));
[spring 2012 exam 1](http://web.mit.edu/18.06/www/Spring12/q1_sp12.pdf) problems 1–4 ([solutions](http://web.mit.edu/18.06/www/Spring12/q1_sp12_sol.pdf));
[fall 2013 exam 1](http://web.mit.edu/18.06/www/Fall13/exam1_f13.pdf) problems 1, 2, 3, 5 ([solutions](http://web.mit.edu/18.06/www/Fall13/exam1_f13_sol.pdf));
[fall 2009 exam 1](http://web.mit.edu/18.06/www/Fall09/exam1.pdf) problems 1, 2, 3, 4 ([solutions](http://web.mit.edu/18.06/www/Fall09/exam1soln.pdf));
[spring 2008 exam 1](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08.pdf) problems 1, 3, 4
([solutions](http://web.mit.edu/18.06/www/Spring08/quiz1-1806-S08-soln.pdf))

## Lecture 13 (Oct 12)

* handwritten notes and lecture video (see links above).

Started talking about **orthogonal projection**: for any subspace S ⊆ V, any vector b ∈ V can be written as a sum of two vectors, one in S and one in S<sup>⟂</sup>.   The former is the orthogonal projection Pb of b onto S, where P is the *projection matrix*, and the latter is b–Pb=(I–P)b (the orthogonal projection of b onto S<sup>⟂</sup>).  Covered:

* Projection matrix P = aaᵀ/aᵀa onto 1d subspaces with a basis vector a.  If a=q (normalized), then P = qqᵀ
* Projection matrix P = A(AᵀA)⁻¹Aᵀ onto n-dimensional subspaces C(A), where A is m×n with full column rank (rank n), i.e. its columns are a basis.
* Projection onto C(Q), i.e. a subspace with an orthonormal basis is simply QQᵀ.

**Further reading:** Textbook 4.2; video [lecture 15](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-15-projections-onto-subspaces/).

## Lecture 14 (Oct 14)

* handwritten notes and lecture video (see links above).
* [pset 5 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset5sol.ipynb)
* [pset 6](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset6.ipynb) due Oct 21

More on projections:

* Key properties P²=P, P=Pᵀ, C(P)=C(A), N(P)=C(A)<sup>⟂</sup>=N(Aᵀ).
* P = I for full-row-rank A, for which C(A) is all of ℝᵐ.
* Why AᵀA is invertible for full-column-rank A, and why the normal equations AᵀAx̂=Aᵀb are solvable for *any* A: rank(AᵀA) = rank(A), N(AᵀA) = N(A), and C(Aᵀ) = C(AᵀA).
* Projection I-P onto the orthogonal complement of C(A), i.e onto N(Aᵀ).
* Equivalence between orthogonal projection and least-squares: minimizing ‖b-Ax‖ is equivalent to minimizing ‖b-y‖ over y∈C(A), and the solution is p=Ax̂=Pb, where AᵀAx̂=Aᵀb.

Introduced the topic of least-square approximation: the projection p=Ax̂ of b onto C(A) is the *closest* vector to b in C(A), and hence is the solution that *minimizes* ‖b-Ax‖ over all possible x.  The vector x̂ is an **approximate solution** to Ax=b that *minimizes* the error ‖b-Ax‖ when no exact solution exists.

**Further reading:** Textbook section 4.3 and video [lecture 16](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-16-projection-matrices-and-least-squares/).

## Lecture 15 (Oct 17)

* handwritten notes and lecture video (see links above).
* [Least-square fitting examples](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Least-Square%20Fitting.ipynb)

Introduced the topic of least-square fitting of data to curves.  As long as the fitting function is linear in the unknown coefficients x, showed that minimizing the sum of the squares of the errors corresponds to minimizing the norm of the residual ‖b-Ax‖.  Went through several examples (see Julia notebook).

Derived the fact that minimizing ‖b-Ax‖ or ‖b-Ax‖² (least squares) corresponds to orthogonal projection (hence AᵀAx̂=Aᵀb) using either algebra (showing ‖b-Ax‖²≥‖b-Ax̂‖² for any x) or calculus (setting ∇‖b-Ax‖²=0).

**Further reading:** Textbook section 4.3 and video [lecture 16](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-16-projection-matrices-and-least-squares/).   There are many, many books and other materials on [linear least-squares fitting](https://en.wikipedia.org/wiki/Linear_least_squares), from many different perspectives (e.g. numerical linear algebra, statistics, machine learning…) The brief discussion at the end of the notebook on [Runge phenomena](https://en.wikipedia.org/wiki/Runge%27s_phenomenon) and equally spaced vs. [Chebyshev points](https://en.wikipedia.org/wiki/Chebyshev_nodes) in polynomial fitting was an entry point into [approximation theory](https://en.wikipedia.org/wiki/Approximation_theory); if you are interested, the [book by Trefethen](https://people.maths.ox.ac.uk/trefethen/ATAP/) and accompanying [video lectures](https://people.maths.ox.ac.uk/trefethen/atapvideos.html) are a great place to start.

## Lecture 16 (Oct 19)

* handwritten notes and lecture video (see links above).

**Gram-Schmidt orthogonalization**: given a non-orthonormal basis a₁,a₂,…, we can *convert* it to an orthonormal basis that **spans the same space**.  All we do is to **take each vector and subtract the projections onto the previous vectors** to make them orthogonal, and divide by their lengths to normalize them.

To go directly from a₁,a₂,… to q₁,q₂,…:
1. q₁ = a₁ / ‖a₁‖
2. q₂ = (a₂ - q₁q₁ᵀa₂) / ‖⋯‖: subtract the projection q₁q₁ᵀa₂ of a₂ onto q₁ to make them orthogonal.
3. q₃ = (a₃ - q₁q₁ᵀa₃ - q₂q₂ᵀa₃) / ‖⋯‖: subtract the projections of a₃ onto q₁ and q₂
4. etcetera

(The process described above and in the book is known as "classical" Gram-Schmidt.  In practice, the computer actually uses more sophisticated algorithms.  But classical Gram-Schmidt is still a good way to *think* about the process.

Writing Gram–Schmidt in matrix form: it turns out that what we are "really" doing is factoring A=QR, where Q is a matrix with orthonormal columns spanning C(A) and R is an invertible upper-triangular matrix.

Using QR to solve the least-squares problem: given A=QR, the normal equations AᵀAx̂=Aᵀb turn into the triangular system of equations Rx̂=Qᵀb.

Talked about the computational complexity/scaling: for an m×n matrix A, solving least-squares problem by *either* the normal equations or by QR scale roughly as ~ mn² (dominated by the the cost of forming AᵀA for the normal equations in the former case, or by the cost of Gram–Schmidt or other algorithms for QR factorization in the latter case).  (In practice, the AᵀA normal-equations method is easier by hand, and is actually slightly faster on a computer too, but computers generally prefer the QR method for reasons discussed below.)

Some practical tips to keep in mind if you ever need to do least-squares or orthogonal basis for real-world problems (not 18.06 exams!) involving data with finite precision:

* Rarely (on a computer) explicitly form AᵀA or solve the normal equations: it turns out that this greatly exacerbates the sensitivity to numerical errors (in 18.335, you would learn that it squares the [condition number](https://en.wikipedia.org/wiki/Condition_number))  Instead, use the A=QR factorization and solve Rx̂=Qᵀb.  Better yet, just do `A \ b` (in Julia or Matlab) or the equivalent in other languages (e.g. [`numpy.linalg.lstsq`](https://numpy.org/doc/stable/reference/generated/numpy.linalg.lstsq.html)), which will use a good algorithm.   (Even professionals can [get confused about this](https://discourse.julialang.org/t/efficient-way-of-doing-linear-regression/31232/33?u=stevengj).)

* Rarely use Gram–Schmidt for large matrices, which turns out to be notoriously sensitive to small errors if some vectors are nearly parallel.  People still compute the "same" QR factorization, just using different methods! There is an improved version called "modified Gram–Schmidt" described in the book (or you can also do Gram–Schmidt twice), but in practice computers mostly use a completely different algorithm called "Householder reflections."  You should just use the built-in `qr(A)` function in Julia (or similarly other languages), which will do the right thing most of the time.

This is not unusual: there is often a difference between the way we conceptually *think* about linear algebra and the more sophisticated tricks that are required to make it *work well* on *large matrices* of real data.

**Further reading:** Strang, section 4.4, and video [lecture 17](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-17-orthogonal-matrices-and-gram-schmidt/).   Many advanced linear-algebra texts talk about the practical aspects of roundoff errors in QR and least-squares, e.g. *Numerical Linear Algebra* by Trefethen and Bau (the 18.335 textbook), but this is beyond the scope of 18.06.   A nice historical review can be found in the article [Gram-Schmidt orthogonalization: 100 years and more](https://doi.org/10.1002/nla.1839).

## Lecture 17 (Oct 21)

* lecture video (see link above).
* [SVD introduction](https://nbviewer.org/github/stevengj/1806/blob/master/notes/SVD-intro.ipynb)
* [SVD low-rank approximation demos](https://computationalthinking.mit.edu/Spring21/structure/) from the spring 2021 *Computational Thinking* class
* [pset 6 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset6sol.ipynb)
* [pset 7](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset7.ipynb): due Friday Oct 28.

Guest lecture by Prof. Alan Edelman.

Introduction to the [singular value decomposition](https://en.wikipedia.org/wiki/Singular_value_decomposition) (**SVD**), the fact that it gives the "right" orthonormal bases for the row and column spaces of a matrix, and its application to [low rank approximation](https://en.wikipedia.org/wiki/Low-rank_approximation).

(Traditionally, the SVD is often left to near the end of an introductory linear algebra course.  One reason for this is that it takes a lot of linear-algebra machinery to *derive* the SVD, much less to calculate yourself.  In fact, it is almost completely impractical to compute by hand except for the nearly useless 2×2 case.   So at this point, **don't worry** about *why* the SVD exists, and trust Julia to calculate it for you.  The main goal for now is to understand what the SVD tells you once you have it.)

**Further reading:** Beware that there are several slightly different forms of the SVD; what I've used in the notebook is called the "compact" SVD on Wikipedia and is denoted by an "r" subscript in Strang section 7.2; you can expand this to other forms by augmenting U and V with bases for the left and right nullspaces, respectively, and correspondingly adding rows and columns of zeros to Σ.   Strang, sections 7.1–7.2, and video [lecture 29](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-29-singular-value-decomposition/).  Note, however, that the connection of SVD to eigenvalues/eigenvectors of AᵀA is something that we won't cover until later in 18.06.   A cool example that uses the SVD to pull out a few key vectors from a big pile of data is the [eigenwalker demo](https://www.biomotionlab.ca/html5-bml-walker/).  The name for this technique in statistics is [principal component analysis (PCA)](https://en.wikipedia.org/wiki/Principal_component_analysis).  Strang section 4.2 on orthogonal projection.

## Lecture 18 (Oct 24)

* [Orthogonal polynomials](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Orthogonal-Polynomials.ipynb)
* [Fourier sine series](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Sine-series.ipynb)

Another wonderful and far-reaching application of these ideas is to realize that the same concepts of orthogonal bases and Gram–Schmidt can be applied to *any* vector space once we define a dot product (giving a so-called [Hilbert space](https://en.wikipedia.org/wiki/Hilbert_space), though we won't use that level of abstraction much in 18.06).  In particular, it turns out to be especially powerful to think about **orthogonal/orthonormal bases of functions**.  Introduced a dot product f⋅g=∫fg for functions defined on x∈[-1,1], and we'll use it to make an orthogonal basis of polynomials, the [Legendre polynomials](https://en.wikipedia.org/wiki/Legendre_polynomials).

Showed another important example of orthogonal functions: Fourier series, and in particular the [Fourier sine series](https://en.wikipedia.org/wiki/Fourier_sine_and_cosine_series).

**Further reading (polynomials):** For example, see these [TAMU notes on orthogonal polynomials](http://www.math.tamu.edu/~yvorobet/MATH304-503/Lect4-04web.pdf) and [these 18.06 notes on orthogonal polynomials](http://web.mit.edu/18.06/www/Spring09/legendre.pdf), or many other sources, e.g. [this book by Szego (1975)](https://people.math.osu.edu/nevai.1/SZEGO/szego=szego1975=ops=OCR.pdf).

**Further reading (Fourier):** Strang, section 10.5 (Fourier series) and these [18.06 sine-series notes](http://web.mit.edu/18.06/www/Spring09/sines.pdf).  There is a [3blue1brown video](https://youtu.be/r6sGWTCMz2k) on Fourier series, along with many, many other resources and videos you can find online… Fourier series and their generalizations are vastly important for lots of applications as well as being a deep and beautiful mathematical subject for their own sake!

## Lecture 19 (Oct 26)

* [Statistics and PCA](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Statistics-and-PCA.ipynb)

*Finished discussion of Fourier series from last lecture.  We will return to these again in the context of differential equations later in the course.*

Discussed the relationship of mean, variance, and covariance/correlation to linear algebra, expressing them in terms of dot products and projections. Given an m×n matrix A whose columns are a bunch of different datasets, with the means subtracted, defined the covariance matrix S=AAᵀ/(m-1). The right singular vectors of A define a coordinate system of uncorrelated variables, with the squared singular values σ² being the variances in each uncorrelated direction. This is called [principal component analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) in statistics, and allows us to identify the uncorrelated variables that are responsible for most of the variation (biggest σ²) in the data.

**Further reading:** Strang book, sections 7.3, 12.1, 12.2. Googling "principal components analysis" or looking it up in any applied-statistics textbook will give you a lot more detail and examples.  The fossil example in the notebook is taken from [this AMS review article](https://mathvoices.ams.org/featurecolumn/2021/08/01/principal-component-analysis/).

## Lecture 20 (Oct 28)

* handwritten notes
* [Determinants](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Determinants.ipynb)
* [pset 7 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset7sol.ipynb)
* [pset 8](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset8.ipynb): due Friday Nov 4

Introduced **determinants** and their properties.  Considering how central a role determinants play for the 2×2 and 3×3 matrices you probably encountered before 18.06, you may be surprised that we didn't get to determinants until now.  The fact of the matter is that determinants play a much less important role in applied linear algebra for larger matrices — with a few exceptions, most things that you would want to use determinants for can be done more effectively in other ways.  They are a useful *conceptual* tool, however, especially for thinking about eigenvalues.

Following Strang, we will define determinants by starting with a few axioms we want them to obey, then working out many more properties and finally a way to compute them by elimination as ± the product of the pivots.  (In the end, there *is* also a "big formula" for determinants, but it's not very practically useful because it has [n factorial](https://en.wikipedia.org/wiki/Factorial) terms.)  Two of the least obvious properties are det(AB)=(det A)(det B) and det(Aᵀ)=det(A).

**Further reading:** Strang, section 5.1; video [lecture 18](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-18-properties-of-determinants).  (We will mostly skip Strang, section 5.2 and 5.3, because the formulas in those sections are not so useful in practice except for tiny matrices.)  Wikipedia has a nice list of [lots of determinant properties](https://en.wikipedia.org/wiki/Determinant), more than we will cover in 18.06.

## Lecture 21 ([Oct 31](https://youtu.be/ZVuToMilP0A))

* handwritten notes and lecture video (see links above).

Discussed briefy why |det A| is the volume of an m-dimensional parallelepiped whose edges are the columns of A, and det A is a signed volume: the volume obeys the same 3 axioms as the determinant.  This is why Jacobian factors |det J| arise from changes of variables in 18.02, because they relate the volumes of little hypercubes dxdydz in two coordinate systems.  **END OF EXAM-2 MATERIAL.**

Started on our main topic for exam 3, **eigenvalues and eigenvectors**.  The goal, for an m×m matrix A, is to find a "magic" vector x≠0 such that Ax=λx: for this special "eigenvector", the **matrix acts just like a scalar** λ (the "eigenvalue").   For such a vector, all of linear algebra would become trivially easy, for example A³x=λ³x and A⁻¹x=x/λ.  It turns out that we can almost always find a *basis* of m eigenvectors, in which case the general procedure is:

1. Find m linearly independent eigenvectors x₁,x₂,…,xₘ and corresponding eigenvalues λ₁,λ₂,…,λₘ.   (This is almost always possible; the rare "defective" exceptions will be dealt with much later in 18.06.)

2. For an arbitrary vector y, expand it in the **basis** of these eigenvectors.

3. Anything you want to do with the matrix A (e.g. Aⁿ, A⁻¹, eᴬ, …) becomes just a number (e.g. λⁿ, λ⁻¹, exp(λ), …) acting on an eigenvector.  Do this term-by-term on each eigenvector for the expansion of y in the eigenvector basis.

The trick for (1) is to figure out **for which λ an eigenvector exists**, and the key is to realize that Ax=λx is equivalent to (A-λI)x=0: an **eigenvector is a nonzero vector in N(A-λI)**.  Such a nonzero nullspace vector only exists when A-λI is singular, or equivalently **det(A-λI)=0**.  This gives us a way (in principle) to find eigenvalues λ, and then to find the corresponding eigenvectors x: find the roots λₖ of the [characteristic polynomial](https://en.wikipedia.org/wiki/Characteristic_polynomial) det(A-λI), a degree-m polynomial, and then eigenvectors are a basis for each nullspace (A-λₖI).

The characteristic polynomial det(A–λI)
is a good way to *think* about eigenvalue problems: e.g. it tells you immediately
to expect ≤ m eigenvalues, possibly complex, from an m×m matrix.  Almost always, we will have m distinct roots λₖ; the weird case of repeated roots is mostly something we'll avoid until later.
But it is not
really a good way to *compute* them in practice except for tiny (e.g. 2×2) matrices.   In fact, since there is [no quintic formula](https://en.wikipedia.org/wiki/Abel%E2%80%93Ruffini_theorem) for the roots of a degree-5 (or higher) polynomial, eigenvalue algorithms look fundamentally different from eigenvalues like Gaussian elimination or Gram—Schmidt: they are procedures that *approach* the eigenvalues λ (to any desired accuracy) but never exactly reach them, and efficient algorithms were only [discovered starting around 1960](https://www.atm.org.uk/write/MediaUploads/Resources/Mid_Plenary_FrancisGolub.pdf).  So, the emphasis in 18.06 is less about *calculating* eigenvalues/eigenvectors and more about *using* and *interpreting* them, and relating their properties to the structure of the matrix.

 **Further reading (eigenvalues):** Strang, section 6.1; video [lecture 21](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-21-eigenvalues-and-eigenvectors/).   The Julia notebook [Eigenvalues and polynomials](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Eigenvalue-Polynomials.ipynb) also summarizes the same points as above, with more computed examples.

## Lecture 22 (Nov 2)

* handwritten notes and lecture video (see links above).

Eigenproblem properties and examples.

Went through a 2×2 example, showed how to compute matrix powers Aⁿ on an arbitrary vector by expanding in the basis of eigenvectors — for large powers n, Aⁿx will asymptotically be parallel to an *eigenvector for the largest |λ|* (unless that basis coefficient happens to be *exactly* zero).

More generally, given eigenvalues λ₁,λ₂,…,λₘ and eigenvectors x₁,x₂,…,xₘ of an m×m matrix A, we *immediately* know eigensolutions for:

* powers Aⁿ: same eigenvectors x₁,x₂,…,xₘ, new eigenvalues λ₁ⁿ,λ₂ⁿ,…,λₘⁿ
* shifts A+μI (any scalar μ): same eigenvectors x₁,x₂,…,xₘ, shifted eigenvalues λ₁+μ,λ₂+μ,…,λₘ+μ
* scaling μA (any scalar μ): same eigenvectors x₁,x₂,…,xₘ, scaled eigenvalues μλ₁,μλ₂,…,μλₘ
* transposes Aᵀ: *same* eigenvalues λ₁,λ₂,…,λₘ, but in general *different* eigenvectors y₁,y₂,…,yₘ called the "left" eigenvectors of A (since yₖᵀA = λₖyₖᵀ).    This is closely analogous to N(A) and N(Aᵀ): for square A, these have the same dimension, but different vectors; in fact, nonzero vectors in a nullspace are just eigenvectors with λ=0!

Even for real matrices, we may in general have **complex** eigenvalues (and eigenvectors), because real-coefficient polynomials can have complex roots.  Went through a 2×2 example with complex eigenvalues.   *If* the matrix is real, however, the complex eigenvalues/eigenvectors (if any) must come in **complex-conjugate pairs**.

## Lecture 23 (Nov 4)

* handwritten notes and lecture video (see links above).
* [Recurrences and Fibonacci numbers](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Fibonacci.ipynb)
* [Markov matrices](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Markov.ipynb)
* [pset 8 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset8sol.ipynb)
* [pset 9](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset9.ipynb): a short pset due **Wed** Nov 9.

As an application of matrix powers, considered the famous [Fibonacci numbers](https://en.wikipedia.org/wiki/Fibonacci_number) 1,1,2,3,5,8,13,21,….  The n-th Fibonacci number fₙ satisfies the [linear recurrence relation](http://mathworld.wolfram.com/LinearRecurrenceEquation.html) fₙ=fₙ₋₁+fₙ₋₂, which we can express in terms of multiplication by a 2×2 matrix F that gives (fₙ,fₙ₋₁) from (fₙ₋₁,fₙ₋₂).  We found that the eigenvalues of F are (1±√5)/2.  The larger of these eigenvalues, (1+√5)/2≈1.618, is the so-called [golden ratio](https://en.wikipedia.org/wiki/Golden_ratio), and it means that the Fibonacci numbers blow up exponentially fast for large n.  Furthermore, we showed that the *ratio* fₙ/fₙ₋₁ of successive Fibonacci numbers goes to the golden ratio for large n.   Checked these facts numerically with a Julia notebook.

As another example of matrix powers, considered [Markov matrices](https://en.wikipedia.org/wiki/Stochastic_matrix) (particularly positive Markov matrices), their eigenvalues, and the *steady state* solution.  These have lots of useful applications in statistics and other fields.

## Lecture 24 (Nov 7)

* handwritten notes and lecture video (see links above).
* [Markov matrices](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Markov.ipynb)

Went over Markov matrices A (nonnegative entries ≥ 0 and columns that sum to 1).  Showed:

* A Markov matrix always has an eigenvalue λ₀=1 and a corresponding "steady state" eigenvector Ax₀=x₀.   This follows immediately by writing the column-sum property of A as oᵀA=oᵀ where o ∈ ℝᵐ is the vector of m 1's: this means that Aᵀo=o, i.e. Aᵀ has an eigenvalue λ=1, and A and Aᵀ have the same eigenvalues.
* *All* eigenvalues of a Markov matrix have magnitude |λ|≤1.    Showed this by the fact that Markov processes "conserve sums": sum(x)=oᵀx=(oᵀA)x=oᵀ(Ax)=sum(Ax); combined with the nonnegative property, this means that Aⁿx can't blow up, so we can't have a |λ|>1.

The above two properties are *not* enough to guarantee that a "Markov process" Aⁿx converges to a steady state — there might be more than one steady state direction (multiple independent eigenvectors for λ=1) or there might be anοther eigenvalue with |λ|=1 but λ≠1, which will give oscillatory behavior.    In order to have convergence to a steady state, we must have all *other* eigenvalues |λ|<1 (not just ≤1), which it turns out is guaranteed if A is a "positive" Markov matrix (all entries > 0, not just ≥ 0).  (For Markov matrices with zero entries, we might need to check numerically whether they have multiple |λ|=1 eigenvalues.)

The Google [PageRank](https://en.wikipedia.org/wiki/PageRank) algorithm is a nice application of Markov matrices and leads us into a discussion of iterative linear-algebra methods for huge matrices, starting with the power method. In particular, the pagerank is essentially an enormous Markov eigenproblem (# web pages by # web pages, whose entries indicate links), too big to even store, but it is *mostly zero* (each web page only links to a few other pages).  Hence, you can multiply by it much more quickly, and because of that the power method (and related methods) can be used to approximately find the steady state.

**Further reading:** Strang, section 10.3 and video [lecture 24](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-24-markov-matrices-fourier-series/).   Another fun application of Markov matrices is to analyze simple games, as reviewed in my notebook on [Analyzing Chutes & Ladders](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Chutes-and-Ladders.ipynb).


## Lecture 25 (Nov 7)

* handwritten notes and lecture video (see links above).
* [pset 9 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset9sol.ipynb)
* [pset 10](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset10.ipynb): short pset due Friday Nov 18

Covered **diagonalization** of a matrix: the process of expanding a vector in the basis of eigenvectors, then multiplying each one by λ, then adding up the eigenvectors with the new coefficients, can be thought of as the matrix factorization A=XΛX⁻¹, where X is the matrix whose columns are the eigenvectors.   This only works if X is invertible: i.e. when for an m×m matrix A we have m eigenvalues (possibly repeated) and m independent eigenvectors (a *basis* of eigenvectors).  Such a matrix is called **diagonalizable**.

It turns out that **almost all matrices in practice are diagonalizable**, so for the most part we will only deal with diagonalizable matrices in 18.06.  The exceedingly rare exceptions are called **defective** matrices (and can only occur when there are *repeated roots* in the characteristic polynomial); we will talk about such defective (non-diagonalizable) cases much later.

Defined [similar matrices](https://en.wikipedia.org/wiki/Matrix_similarity) B=M⁻¹AM, and showed that similar matrices have the same *eigenvalues* (with eigenvectors related by a factor of M), the same *determinant*, the same *characteristic polynomial*, and the same *trace*.  Defined the [trace](https://en.wikipedia.org/wiki/Trace_(linear_algebra)) of a matrix tr(A),
and showed tr(AB)=tr(BA) for any m×n matrix A and n×m matrix B.  (We saw in lecture 12 that similar matrices essentially
represent the *same linear operation in a different coordinate system.*)  In hindsight, we
now see that a diagonalizable matrix A is *similar to a diagonal matrix Λ*.  Hence, we
see that det(A) is the *product* of the eigenvalues and tr(A) is the *sum* of the eigenvalues.

For a 2×2 matrix, it follows that det(A-λI)=λ²-λtr(A)+det(A), which is a useful formula when solving 2×2 eigenproblems.

**Further reading:** Strang, section 6.2; video [lecture 22](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-22-diagonalization-and-powers-of-a/) and video [lecture 28](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-28-similar-matrices-and-jordan-form/).  See also this [Diagonalization](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Diagonalization.ipynb) notebook for Julia.

## Exam 2 (Nov 14): 11am in 26-100

Exam 2 will cover the material through **lecture 21** and **pset 8**: it will include exam-1 material, but will focus mainly on **everything to do with orthogonality**.  Transposes and dot products, orthogonal subspaces/complements, projections, least-square solutions, orthogonal/orthonormal bases, Gram–Schmidt and QR factorization, orthogonal functions, and the SVD.   Matrix-calculus topics may also be included, as may determinants.  (Note that we only covered properties of determinants, but not "cofactor formulas", so ignore cofactor-related materials on previous exams!)

(*Not* covered: eigenvalue problems and subsequent material.)

The exam is **closed book/notes**. (No calculators or computers either.)

* [Exam 2](exams/exam2.pdf) and [solutions](exams/exam2sol.pdf).

* (Optional) **review session**: Thursday 11/10 4–5pm [via Zoom](https://mit.zoom.us/j/98031703967?pwd=THIxRnRLODNGU0pJYTlMdEE0T2VZQT09): see [video recording](https://mit.zoom.us/rec/share/HgwZS9Z0hn0wS_EU4D9TN80jtfh3QORNOnA0a2ZIpz5vD4FbMC8o5ymfHFXJaQF1.6Wv4HP-vMQtyrOHX?startTime=1668113824000), [handwritten notes](https://www.dropbox.com/s/xnowl6zoe1js1t8/18.06%20Fall%2022%20Exam%20Reviews.pdf?dl=0), and practice problems: [spring 2017 exam 2](https://github.com/mitmath/1806/blob/spring22/exams/exam2.pdf) ([solutions](https://github.com/mitmath/1806/blob/spring22/exams/exam2sol.pdf)) problems 1–3, spring 2017 exam 2 (below) problem 1, spring 2019 exam 2 practice (below) problems 12–13 (replacing the "compact" SVD, which we didn't cover, with "thin" SVD as covered this term … though they are the same thing if A isn't rank-deficient).

**Practice problems:** [spring 2009 practice exam 2](http://web.mit.edu/18.06/www/Spring09/practice-quiz2-S09.pdf) problems 1–17; [spring 2009 exam 2](http://web.mit.edu/18.06/www/Spring09/quiz2-s09.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring09/quiz2-s09-soln.pdf)) problem 1–3; [spring 2017 exam 2](http://web.mit.edu/18.06/www/Spring17/exam2.pdf)  ([solutions](http://web.mit.edu/18.06/www/Spring17/exam2-sol.pdf)) problems 1(b,c), 2, 3; [fall 2014 exam 2](http://web.mit.edu/18.06/www/Fall14/midterm2_F14.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall14/Midterm2solF14.pdf)) problem 1, 2a, 2e, 3a; [spring 2014 exam 2](http://web.mit.edu/18.06/www/Spring14/quiz_2_draft.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring14/StrangExamAprilSolutions.pdf)) problems 1,2,4; [spring 2013 exam 2](http://web.mit.edu/18.06/www/Spring13/Exam2blank.pdf) ([solutions](http://web.mit.edu/18.06/www/Spring13/Exam2.pdf)) problems 1, 2, 3; [fall 2012 exam 2](http://web.mit.edu/18.06/www/Fall12/Exam%202/quiz2-1806-f12.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall12/Exam%202/quiz2-1806-f12-sol.pdf)) problems 1,3; [spring 2019 exam 2](https://github.com/mitmath/1806/blob/spring20/psets/quiz2-1806-S19.pdf) ([solutions](https://github.com/mitmath/1806/blob/spring20/psets/quiz2-1806-S19_solns.pdf)) problems 1 (SVD, slightly different notation), 2, 5 (calculus); [spring 2019 exam 2 practice](https://github.com/mitmath/1806/blob/spring20/psets/Exam%202%20Practice%20.ipynb) ([solutions](https://github.com/mitmath/1806/blob/spring20/psets/midterm_2_practice_problems_solns.ipynb)) problems 4 & 5 (calc), 6 (det), 9 & 10 & 12 & 13 (SVD, slightly different notation); [SVD review problems](notes/svd-practice.pdf) expressed in terms of the "thin SVD" as covered this semester.

## Lecture 26 (Nov 16)

Discussed complex eigenvalues of **real** matrices A, and showed:

* The complex eigenvalues and corresponding eigenvectors come in *complex-conjugate pairs*.
* Expanding an arbitrary **real** vector x in the eigenvector basis (c=X⁻¹x) leads to *complex-conjugate* coefficients of the corresponding complex eigenvectors, and hence terms 2Re[cₖxₖ] in the expansion.
* Matrix powers Aⁿ lead to exponential growth/decay determined by the *magnitude* |λₖ| of the eigenvalues.  For complex eigenvalues, the *phase* e<sup>iϕₖ</sup> leads to *oscillating* terms.

Key concepts for **complex numbers**: the [complex conjugate](https://en.wikipedia.org/wiki/Complex_conjugate) z̄, the magnitude |z|=√zz̄, and the [polar form](https://en.wikipedia.org/wiki/Polar_coordinate_system#Complex_numbers) re<sup>iϕ</sup> using [Euler's formula](https://en.wikipedia.org/wiki/Euler%27s_formula) e<sup>iϕ</sup>=cos(ϕ)+isin(ϕ).

**Further reading** This [brief review of complex numbers](https://web.stanford.edu/~boyd/ee102/complex-primer.pdf) (from Stephen Boyd at Stanford) is at about the level of my lecture.  There are many more basic reviews, e.g. from [Khan academy](https://www.khanacademy.org/math/algebra2/x2ec2f6f830c9fb89:complex), that you can find online.  Chapter 9 of Strang's textbook discusses complex vectors and matrices.

## Lecture 27 (Nov 18)

* [Ordinary differential equations (ODEs)](https://nbviewer.org/github/mitmath/1806/blob/master/notes/ODEs.ipynb).
* [pset 10 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset10sol.ipynb)
* [pset 11](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset11.ipynb): due **Wednesday** November 23.

We can now solve systems of ODEs dx/dt = Ax in terms of eigenvectors and eigenvalues.
Each eigenvector is multiplied by exp(λt) (where exp(x)=eˣ), so that solutions decay
if the eigenvalues have *negative real parts* (and approach a nonzero steady state
if one eigenvalue is *zero*).

(Soon, we will also express this in terms of a new
Matrix operation eᴬᵗ, the [matrix exponential](https://en.wikipedia.org/wiki/Matrix_exponential).)

**Further reading:** Strang, section 6.3 and video [lecture 23](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-23-differential-equations-and-exp-at/).

## Lecture 28 (Nov 21)

Continued discussion of ODEs from last lecture, discussing the over/underdamped case and the example of multiple coupled masses and springs.

Next, reformulated the solution of dx/dt=Ax in terms of the [matrix exponential](https://en.wikipedia.org/wiki/Matrix_exponential) eᴬᵗ, and discussed the definition and properties of this fascinating and important matrix operation.

**Further reading:** Strang, section 6.3 and video [lecture 23](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-23-differential-equations-and-exp-at/).  [Notebook on Matrix exponentials eᴬ](https://nbviewer.org/github/mitmath/1806/blob/master/notes/Matrix-Exponentials.ipynb).

## Lecture 29 (Nov 23)

* [pset 11 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset11sol.ipynb)
* [pset 12](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset12.ipynb) due Friday Dec. 2

Continued discussion of matrix exponentials.  Unlike scalars, exp(A+B)≠exp(A)exp(B) **unless** A and B **commute** (AB=BA).  An important example of commuting matrices is when B is a *scalar multiple* of A, from which we see that **exp(A(t₁+t₂))=exp(At₁)exp(At₂)**: evolving a solution of dx/dt=Ax for time t₁+t₂ is the same as evolving it for t₂ then t₁ (or vice versa).   We also see that **exp(A)⁻¹=exp(-A)**, since of course A and -A commute.

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
* A square matrix Q with orthonormal columns (Q⁻¹=Qᴴ) is called **unitary**.  (The term "orthogonal" is only used in the real-A case.)
* If A=Aᴴ, the matrix is called **Hermitian** (not "symmetric", except in the real-A case).

Again, for real matrices/vectors, the adjoint = the transpose, so everything
we've done before is just a special case of the complex case with zero imaginary parts.

**Further reading:** Strang, section 9.2;  [lecture 26](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-26-complex-matrices-fast-fourier-transform/).

## Lecture 30 (Nov 28)

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

### Positive-definite/semidefinite matrices

A lot of Hermitian matrices in practice come in the form BᴴB (or BᵀB for real B)
for some matrix B.  e.g. we have seen several of these already, e.g. in least-squares problems.   Such matrices are not only Hermitian, but they
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

### Connection to SVD

We are now (*finally*) in a position to start to see a connection between eigenproblems and the SVD, and to see one possible route to deriving *why* the SVD exists.

A "tall" m×n matrix A=UΣVᴴ doesn't *have* eigenvalues if m>n, but the n×n matrix AᴴA=QΛQᴴ is Hermitian semidefinite with eigenvalues λ≥0 and orthonormal eigenvectors Q.   Plugging in the SVD, however, we see that AᴴA simplifies to VΣ²Vᴴ, which means that the **singular values σ** are the **square roots of the positive λ's of AᴴA**, and the **right singular vectors V** are corresponding orthonormal **eigenvectors** of AᴴA.

In fact, it is possible to go backwards and *derive* the SVD in this fashion, obtaining the v's as eigenvectors of AᴴA, the u's as eigenvectors of AAᴴ, and the σ's as the square roots of the positive λ's.

**Further reading:** Strang, section 6.4;  [lecture 25](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-25-symmetric-matrices-and-positive-definiteness/).     **SVD**: Strang, sections 7.1–7.2, and video [lecture 29](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-29-singular-value-decomposition/).  Notes on the [SVD as an eigenproblem](https://github.com/mitmath/1806/blob/master/notes/SVD-eigenproblem.ipynb).

## Lecture 31 (Nov 30)

As an application of real-symmetric and positive-definite matrices, I returned
to the system of masses and springs from our first ODE lectures, but this time I considered
n masses m and n+1 springs kᵢ.   I showed that Newton's laws take the form:

* mẍ = -DᵀKDx ⟹ ẍ = -Ax, where D is "difference" and K is a diagonal matrix of spring constants, so that A=Dᵀ(K/m)D.

A is obviously real-symmetric, so its eigenvalues λ are real.  With a little more work, we saw that it must be positive-definite.  For example, A=-BᵀB for B = √(K/m)D, with √(K/m) being the diagonal matrix with √(kᵢ/m) on the diagonal, so A must be negative semidefinite.

A little more consideration of this matrix shows that A must be negative *definite*: it cannot have λ=0 eigenvalues, i.e. N(A)=N(B)=N(D)={0}.  Since Dᵀ is upper triangular, by inspection it has rank n (n pivots), and hence D has full column rank and N(D)={0}=N(A).

The fact that A is negative definite allowed us to derive that *any* such system of masses and springs has *orthogonal oscillating solutions* called the [normal modes](https://en.wikipedia.org/wiki/Normal_mode). In particular, given the eigenvectors vⱼ (orthogonal since A is real-symmetric!), satisfying Aqⱼ=λⱼqⱼ with λⱼ<0, we expanded the solution x(t)=∑ⱼcⱼ(t)qⱼ in the basis of these eigenvectors qⱼ.  For each eigenvector component, the matrix A acts just like a negative number λⱼ=-ωⱼ², allowing us to easily solve the equation c̈ⱼ=-ωⱼ²cⱼ to get sines and cosines, and hence to get the general solution:

* x(t) = ∑ⱼ [αⱼ cos(ωⱼt) + βⱼ sin(ωⱼt)] qⱼ

where ωⱼ=√-λⱼ, and αⱼ and βⱼ are determined from the initial conditions x(0) and ẋ(0).

The key point is that the **structure** of the problem told us that λⱼ<0 and
hence that the **frequencies** ωⱼ are **real** numbers.  (If they were complex, we would have exponentially growing or decaying solutions, which would make no physical sense for a system of lossless springs and masses.)  The moral of this story is that real-symmetric and definite matrices don't just fall down out of the sky, they arise from how the matrix was constructed, and that these matrix properties are often the key to understanding the physical properties of real problems.

**Further reading:** Strang, section 10.2.  See also [these notes on the springs-and-masses problem](https://github.com/mitmath/18303/blob/fall15/lecture-5.5.pdf) from [18.303](https://github.com/mitmath/18303/tree/fall15) (you can ignore the last two pages, which go beyond 18.06, and ignore the Δx factor which is used in 18.303 to connect the discrete problem to a continuous problem).

## Lecture 32 (Dec 2)

* [Notes on "Jordan" vectors](notes/jordan-vectors.pdf)
* [pset 12 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset12sol.ipynb)
* [pset 13](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset13.ipynb): short pset due **Wed Dec 7**

Most matrices are diagonalizable.  (*Any* n×n matrix with n distinct eigenvalues is diagonalizable, as is *any* Hermitian A=Aᴴ, unitary A⁻¹=Aᴴ, or anti-Hermitian A=-Aᴴ matrix.)  Non-diagonalizable matrices in practical situations typically arise only by design: you start with a "non-normal" matrix and play with the entries until you *force* two eigenvalues and eigenvectors to coincide.  This does not mean that such "exceptional" or "defective" cases are not interesting, however!   Even more commonly, on encounters a matrix that is *nearly* defective (i.e. the matrix X of eigenvectors is *nearly singular*).

To understand what happens with defective matrices, I introduce "Jordan" vectors (also called [generalized eigenvectors](https://en.wikipedia.org/wiki/Generalized_eigenvector)) and Jordan chains.  I don't focus on formal proofs of the *existence* of these chains and the theoretical construct of the "Jordan form" of a matrix.  Instead, I want to explore their *consequences* for the Aⁿx and dx/dt=Ax types of problems that we have spent a lot of time on.  We show that, for a defective A, Aⁿx gives an extra term that grows as n×λⁿ, not just λⁿ!  And dx/dt=Ax gives an extra term that grows as t×exp(λt), not just exp(λt).

**Further reading**: Strang book, section 8.3.  Going far beyond 18.06, there is a wonderful book, *Spectra and Pseudospectra* by Trefethen and Embree, entirely devoted to cases where diagonalization fails (or nearly fails).

## Lecture 33 (Dec 5)

Started by deriving how the generalized "Jordan" vectors from the previous vector, when used as a basis, put a matrix into the [Jordan form](https://en.wikipedia.org/wiki/Jordan_normal_form): a diagonal matrix of eigenvalues λ's with 1's above the diagonal in "Jordan blocks" corresponding to defective repeated roots.

The Jordan form is mostly useful as a *conceptual* tool, to understand what the matrix is *approaching* as it becomes more and more *nearly* defective.  (As a practical tool, it is famously tricky to work with, because any tiny perturbation (e.g. roundoff errors) can cause a repeated root to split into distinct eigenvalues.)

### Eigenproblems and the SVD

We are finally in a position to derive that *why* the SVD exists, using eigenproblems for AᴴA and AAᴴ.  (Conceptually, however, you want to continue to think of the SVD as a factorization of A, not as a mere byproduct of AᴴA and AAᴴ eigenproblems.)

For any m×n matrix A, there are two "nice" matrices AᴴA and AAᴴ, both of which are Hermitian positive semidefinite (orthonormal bases of eigenvectors, real eigenvalues ≥ 0).   How can we use these "nice" matrices to go back and help us **understand A**?   It turns out that this leads us directly back to the **singular value decomposition (SVD)**.

In particular we find:

* There are r positive eigenvalues λⱼ=σⱼ² of AᴴA, where r = rank A.  Let vⱼ be the corresponding orthormal eigenvectors — these are a basis for C(Aᴴ).
* The vectors uⱼ=Avⱼ/σⱼ are actually **eigenvectors** of AAᴴ, are **orthonormal**, and form a basis for C(A).
* These uⱼ, vⱼ and σⱼ are exactly the left and right singular vectors and the corresponding singular values of A!

**Further reading:**  **SVD**: Strang, sections 7.1–7.2, and video [lecture 29](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/video-lectures/lecture-29-singular-value-decomposition/).  Notes on the [SVD as an eigenproblem](https://nbviewer.org/github/mitmath/1806/blob/master/notes/SVD-eigenproblem.ipynb).

## Lecture 34 (Dec 7)

* pset 13 solutions: to be posted

Examined the analogues of Hermitian positive-definite matrices, matrix exponentials, etcetera, for *infinite-dimensional* linear algebra.  (This material will *not* be on the final.)   It turns out that this is tremendously important for understanding [partial differential equations (PDEs)](https://en.wikipedia.org/wiki/Partial_differential_equation) arising in science and engineering.

Earlier in the class, we already saw how we can define infinite-dimensional vector spaces of functions, "dot products" of functions via integrals, and hence orthogonal bases of functions, projection, etcetera.  Now, we look at linear operators on functions, and in particular I looked at A=d²/dx² acting on functions u(x)
over a [domain Ω](https://en.wikipedia.org/wiki/Domain_of_a_function) = [0,L], i.e. functions for 0 ≤ x ≤ L, with the [boundary condition](https://en.wikipedia.org/wiki/Dirichlet_boundary_condition) u(0)=u(L)=0.

First, we looked at the eigenfunctions, satisfying Au=λu.  These are easy to find: uₙ(x)=sin(nπx/L) for n=1,2,3,…, with eigenvalues λₙ=-(nπ/L)².   Notice that the eigenvalues are real and negative.  And the
eigenfunctions are none other than our "Fourier sine series" basis functions, way back from lecture 16, which are orthogonal under the dot product u⋅v=∫ūv.   So, it looks much like a real-symmetric negative-definite eigenproblem!  But in what sense can we say "Aᴴ=A" when A is a derivative?

The key property of a transpose/adjoint is not that it swaps rows and columns, but rather that (Aᴴx)⋅y=x⋅(Ay) for any real vectors x and y, and a Hermitian matrix has (Ax)⋅y=x⋅(Ay).   In fact, we can use this as the *definition* of the "adjoint" for any vector space with a dot product: Aᴴ is defined as the operator that makes (Aᴴu)⋅v=u⋅(Av) for any u,v.    If we apply that to A=d²/dx², we have u⋅(Av)=∫ūv″, and "transposing" A means [integrating by parts](https://en.wikipedia.org/wiki/Integration_by_parts) to make the derivatives act on u instead of v.   Integrating by parts twice, and applying the boundary conditions u(0)=u(L)=0=v(0)=v(L) from our function space, we find that (Au)⋅v=u⋅(Av): **A=d²/dx² is a real-symmetric operator**.

I then showed how the fact that λ is real and the eigenfunctions are orthogonal follows — in fact, the proof is essentially identical to the proof for matrices.   Furthermore, if we integrate by parts only once, we saw that u⋅Au=-∫|u′|²≤0, and =0 only if u=0, so A is negative definite, and the proof that λ<0 is the same as before.

Furthermore, just as we solved dx/dt = Ax by eᴬᵗx(0) and interpreted this as multiplying each eigenvector by exp(λt), we can similarly solve the partial differential equation ∂u/∂t=∂²u/∂x² (the [diffusion equation](https://en.wikipedia.org/wiki/Diffusion_equation)) as multiplying u(x,0) by the operator exponential exp(t ∂²/∂x²).  This seems horrible until we realize that it again just multiplies each eigenfunction by exp(λt).  So, if we expand the initial condition in the uₙ basis (a Fourier sine series), then each term is just multiplied by exp(λₙt) to get the solution u(x,t).  This is **exponentially decaying** because the eigenvalues are negative.  (Similarly, if we solve ü=∂²u/∂t²=∂²u/∂x² (the [wave equation](https://en.wikipedia.org/wiki/Wave_equation)), it is essentially the same as ẍ=Ax from the previous mass-and-spring lecture: the solutions are **oscillating** with real frequencies ω=√-λ because the eigenvalues λ of ∂²/∂x² are < 0.)

The wonderful thing about this approach is that it allows us to derive real λ<0 and orthogonal eigenfunctions even in cases that we can't solve in closed form.   Even whe only numerical solutions (via computational PDE methods) are available — which is the case for *most* PDEs — we can still see from the **algebraic structure** that diffusion equations have decaying solutions and wave equations have oscillating solutions.  This is especially important in higher dimensions and in "containers" of arbitrary shapes and materials.

**Further reading**:  Linear algebra applied to functions and PDEs can be found in [18.303](http://math.mit.edu/~stevenj/18.303/), 18.101 (functional analysis), and many other courses (e.g. quantum mechanics 8.04+ is taught this way).   See also my [notes on Hermitian operators for 18.06 from Fall 2007](http://web.mit.edu/18.06/www/Fall07/operators.pdf) which gives an informal introduction similar to my presentation in class.  Strang's book [Computational Science and Engineering](http://math.mit.edu/~gs/cse/) gives a more computational viewpoint on this subject.  The linear-algebra approach to the 1d case of functions u(x) and second-derivative operators is often called [Sturm–Liouville theory](https://en.wikipedia.org/wiki/Sturm%E2%80%93Liouville_theory), but nowadays people apply similar concepts to more complicated operators in higher dimensions.  Scientists and engineers usually adopt an informal approach to this subject, whereas a rigorous approach is much more tricky and requires the spaces of allowed functions and operators to be carefully circumscribed, leading to the topic of [functional analysis](https://en.wikipedia.org/wiki/Functional_analysis).

## Exam 3 (Friday, Dec 9): 11am in 26-100

Exam 3 will cover the material through **lecture 32** and **pset 13**: it will include exam-1 and exam-2 material, but will focus mainly on **everything to do with eigenproblems**.  Possible topics include: Determinant, trace, eigenvalues/eigenvectors, diagonalization, similar matrices, matrix powers and linear recurrences xₙ=Aⁿx₀, linear ODEs dx/dt=Ax (and d²x/dt²=Ax), matrix exponentials (and other matrix functions), complex matrices and the adjoint Aᴴ, real-symmetric/Hermitian matrices, positive-definite matrices (and semi-definite, negative-definite, etc), connections to SVD, defective matrices and generalized eigenvectors.

The exam is **closed book/notes**. (No calculators or computers either.)

* (Optional) **review session**: Wednesday 12/7 4–5pm [via Zoom](https://mit.zoom.us/j/96564626053?pwd=VU1IY28wQ1BLRitDYmdtUG9LTWU4QT09): video recording, notes, and practice problems to be posted.

* Some practice problems:  [Spring 2009 exam 3](http://web.mit.edu/18.06/www/Spring09/examsS09.html) ([solutions](http://web.mit.edu/18.06/www/Spring09/quiz3-s09-soln.pdf)); [Spring 2014 exam 3, problems 1–2](http://web.mit.edu/18.06/www/Spring14/oldS14.html) ([solutions](http://web.mit.edu/18.06/www/Spring14/quiz_3_solution.pdf)); [Fall 2013 exam 2, problem 3](http://web.mit.edu/18.06/www/Fall13/exam2_f13.pdf) ([solutions](http://web.mit.edu/18.06/www/Fall13/exam2_f13_sol.pdf)); [Fall 2013 exam 3, problems 2–3](http://web.mit.edu/18.06/www/Fall13/oldF13.html) ([solutions](http://web.mit.edu/18.06/www/Fall13/exam3_f13_sol.pdf)); [Fall 2012 exam 3, problem 1](http://web.mit.edu/18.06/www/Fall12/oldF12.html) ([solutions](http://web.mit.edu/18.06/www/Fall12/Exam%203/quiz3-1806-f12-solution.pdf)); [Spring 2012 exam 3, problems 1, 2, 3a, 3b](http://web.mit.edu/18.06/www/Spring12/oldS12.html) ([solutions](http://web.mit.edu/18.06/www/Spring12/q3_sp12_sol.pdf)); [Fall 2011 exam 3, problems 1.1, 1.2, 3](http://web.mit.edu/18.06/www/Fall11/oldF11.html) ([solutions](http://web.mit.edu/18.06/www/Fall11/q3_f11_sol.pdf)); [Fall 2007 exam 3](http://web.mit.edu/18.06/www/Fall07/examsF07.html) ([solutions](http://web.mit.edu/18.06/www/Fall07/quiz3-1806-F07-sol.pdf)); [Fall 2018 exam 3](https://github.com/mitmath/1806/blob/fall18/exams/exam3.pdf) and [solutions](https://github.com/mitmath/1806/blob/fall18/exams/exam3sol.pdf); [Fall 2017 exam 3](https://github.com/mitmath/1806/blob/fall17/exams/exam3.pdf) and [solutions](https://github.com/mitmath/1806/blob/fall17/exams/exam3-sol.pdf)
