# MIT Course 18.06, Spring 2022

This is a repository for the course [18.06: Linear Algebra](http://web.mit.edu/18.06) at MIT in Spring 2022.   See [other branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-branches-in-your-repository/viewing-branches-in-your-repository) of this repository for previous semesters.

**Instructor**: [Prof. Steven G. Johnson](http://math.mit.edu/~stevenj).

**Lectures**: MWF11 in 10-250.  See [recordings](https://mit.hosted.panopto.com/Panopto/Pages/Sessions/List.aspx?folderID=68796547-c661-4d78-a50e-ae2e00efcbba) and [handwritten notes](https://www.dropbox.com/s/q6ff0kfu7jyjiuz/18.06%20Spring%202022.pdf?dl=0) posted online, along with other materials (slides, further reading) posted below.

**Recitations**:
 * [Gary Choi](https://math.mit.edu/~ptchoi/): T2 in 2-136, T3 in 2-136 (office hours W10 [virtual](https://mit.zoom.us/j/99599310644), R11 in-person 2-246C)
 * [Haushuo Fu](https://math.mit.edu/directory/profile.php?pid=2229): T11 in 2-136, T12 in 2-136 (office hours R1 [virtual](https://mit.zoom.us/j/99599310644), W1 in-person 2-238)
 * [Sergei Korotkikh](https://math.mit.edu/directory/profile.php?pid=2113): T11 in 2-131, T1 in 2-136 (office hours W6 [virtual](https://mit.zoom.us/j/99599310644), R6 in-person 2-231D)
 * [Yair Shenfeld](https://www.yairshenfeld.com/): T9 in 2-132, T10 in 2-132 (office hours W5 [virtual](https://mit.zoom.us/j/99599310644), R5 in-person 2-231)

**Undergraduate Assistants**: [Subha Pushpita](https://snpushpi.mit.edu/), Isaac M Lopez, Gaurav Arya.   Email them at **1806sp22_ua ατ mit.edu** for 1-on-1 technical help with Julia or other questions that don't work well over Piazza etc.

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
* pset 0 solutions: coming soon
* pset 1 (due Feb 11): coming soon
