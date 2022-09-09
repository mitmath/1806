# MIT Course 18.06, Fall 2022

This is a repository for the course [18.06: Linear Algebra](http://web.mit.edu/18.06) at MIT in Fall 2022.   See [other branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-branches-in-your-repository/viewing-branches-in-your-repository) of this repository for previous semesters.

**Instructor**: [Prof. Steven G. Johnson](http://math.mit.edu/~stevenj).  Course administrator: [Sergei Korotkikh](https://math.mit.edu/directory/profile.php?pid=2113).

**Lectures**: MWF11 in 26-100.  [Handwritten notes](https://www.dropbox.com/s/a1xy4oh6wb2i5ub/18.06%20Fall%202022.pdf?dl=0) are posted online, along with video recordings (linked below) and other materials (slides, further reading) in the lecture summaries below.

**Exams**: 11am in 26-100, on 10/7, 11/14, & 12/9.  Final exam: date TBA.

**Recitations**:

 * R01,R02 — [Chirag Falor](https://web.mit.edu/directory/?id=cfalor&d=mit.edu): T9 in 2-143, T10 in 2-146 (office hours Mon 3pm [via Zoom](https://mit.zoom.us/j/96071172098), Wed 3pm in TBD).
 * R03,R05 — [Melissa Sherman-Bennett](https://sites.google.com/view/mshermanbennett): T11 in 2-147, T12 in 2-147 (office hours Wed 10am [via Zoom](https://mit.zoom.us/j/96071172098), Thurs 10am in TBD).
 * R04 — [Sergei Korotkikh](https://math.mit.edu/directory/profile.php?pid=2113): T11 in 2-146 (office hours Tues 6pm [via Zoom](https://mit.zoom.us/j/96071172098), Thurs 6pm in 2-231D).
 * R06,R09 — [Victor Rong](https://web.mit.edu/directory/?id=vrong&d=mit.edu): T12 in 2-146, T1 in 2-146 (office hours Mon 8pm [via Zoom](https://mit.zoom.us/j/96071172098), Tues 2pm in TBD).
 * R07,R08 — [Mitchell Harris](https://math.mit.edu/directory/profile.php?pid=2180): T12 in 2-361, T1 in 2-142 (office hours Mon 2pm [via Zoom](https://mit.zoom.us/j/96071172098), Fri 2pm in 32-D 6th-floor lounge).
 * R10,R11 — [Ishan Levy](https://math.mit.edu/directory/profile.php?pid=2185): T1 in 2-136, T2 in 2-142 (office hours Thurs 10:30am [via Zoom](https://mit.zoom.us/j/96071172098), Wed 2pm in 2-390).
 * R12,R13 — [Gefei Dang](https://math.mit.edu/directory/profile.php?pid=2178): T2 in 2-146, T3 in 2-142 (office hours Thurs 4pm [via Zoom](https://mit.zoom.us/j/96071172098), Wed 11am in 2-239).

**Undergraduate Assistants**: TBA.

**Resources**: [Piazza discussion forum](https://piazza.com/class/l7g5ixuivav3rm), [math learning center](https://math.mit.edu/learningcenter/), [TSR^2 study/resource room](https://ome.mit.edu/programs/talented-scholars-resource-room-tsr2), [pset partners](https://psetpartners.mit.edu/).

This document is a *brief* summary of what was covered in each 18.06
lecture, along with links and suggestions for further reading.  It is
*not* a good substitute for attending lecture, but may provide a
useful study guide.  (You can also look at the analogous summaries from [Spring 2022](https://github.com/stevengj/1806/blob/spring22/README.md).)

## Lecture 1 (Sep 7)

* [course overview/syllabus](https://docs.google.com/presentation/d/1ivbV1nr67XfasBdXezZF9UWILzDoQtQev8vSqRKBfu0/edit?usp=sharing)
* [pset 1](psets/pset1.ipynb): due **Friday Sep 16 at 11am** (submit your solutions on Gradescope).
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

## *Optional* Julia Tutorial (Monday Sep 12 @ 5pm): [Zoom](https://mit.zoom.us/j/97099588467?pwd=bGVNOXFqdzhZRjVnRjRLeE1qNFNpdz09)

* video recording: to be posted

A basic overview of the Julia programming environment for numerical computations that we will use in 18.06 for simple computational exploration.   This (Zoom-based) tutorial will cover what Julia is and the basics of interaction, scalar/vector/matrix arithmetic, and plotting — we'll be using it as just a "fancy calculator" and no "real programming" will be required.

* [Tutorial materials](https://github.com/mitmath/julia-mit) (and links to other resources)

If possible, try to install Julia on your laptop beforehand using the instructions at the above link.  Failing that, you can run Julia in the cloud (see instructions above).
