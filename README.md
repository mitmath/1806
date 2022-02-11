# MIT Course 18.06, Spring 2022

This is a repository for the course [18.06: Linear Algebra](http://web.mit.edu/18.06) at MIT in Spring 2022.   See [other branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-branches-in-your-repository/viewing-branches-in-your-repository) of this repository for previous semesters.

**Instructor**: [Prof. Steven G. Johnson](http://math.mit.edu/~stevenj).

**Lectures**: MWF11 in 10-250.  See [recordings](https://mit.hosted.panopto.com/Panopto/Pages/Sessions/List.aspx?folderID=68796547-c661-4d78-a50e-ae2e00efcbba) and [handwritten notes](https://www.dropbox.com/s/q6ff0kfu7jyjiuz/18.06%20Spring%202022.pdf?dl=0) posted online, along with other materials (slides, further reading) posted below.

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
* [Singular matrices and rank](http://nbviewer.jupyter.org/github/stevengj/1806/blob/fall18/lectures/Singular.ipynb)
* [pset 1 solutions](https://nbviewer.org/github/mitmath/1806/blob/master/psets/pset1sol.ipynb)
* pset 2: coming soon

Complexity of matrix operations: why matrix × vector or backsubstitution scale like n² for n×n matrices, while matrix × matrix or Gaussian elimination (LU factorization) scale like n³.   Matrices much bigger than a few thousand square quickly become impractical, and really large problems are only tractable because they have special structure like [sparsity](https://en.wikipedia.org/wiki/Sparse_matrix).

Began talking about singular matrices.  With a relatively simple example, showed that singular matrices (matrices with not enough pivots) A can still have solutions to Ax=b, but only for certain right hand sides.  And when they do have solutions, they have *infinitely many* solutions.
As a measure of *how* singular a matrix is, we talk about its **rank r**, equal to the number of pivots that we have after elimination.   It will turn out that this number **r** is closely related to the *geometry* of solutions to singular (and non-square) matrix problems.   The solvable right-hand sides live in "**r** dimensions", a *subspace* of all possible right-hand sides — in our example, we had r=2 for a 3×3 matrix, so the allowed right-hand sides lived in a 2d *plane*.   And if the solutions exist to an n×n system with rank r, then we will see that the solutions "live" in n–r dimensions, e.g. a 1d line in our example.

To make this precise, we first have to go back and generalize our notion of a "vector" to a more abstract notion called a "vector space", and from this we can define "subspaces", and see how certain key subspaces related to a matrix A tell us the geometry of its solutions.

**Further reading:** Textbook sections 2.6 ("The cost of elimination") and 11.1.   For next time, textbook sections 3.1 and 3.2.