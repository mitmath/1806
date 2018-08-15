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
slides](https://github.com/stevengj/1806/blob/master/lectures/overview.pdf) and [Gaussian
elimination notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Gaussian-elimination.ipynb)
* [pset 1](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/pset1.ipynb) (due Wed 9/12, submitted electronically)

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
