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

Using this understanding, we rewrote Gaussian elimination in matrix form: we multiply a matrix A on the *left* by a sequence of **lower**-triangular elimination matrices to arrive at an **upper**-triangular matrix U.    This turns out to be *extremely* useful
as both a computational and a theoretical tool, because triangular matrices are much easier to work with than general matrices — we've already seen that it is easy to solve triangular systems of equations, and we will find that they are nice in other ways as well.

In the next lecture, we will reverse the elimination steps to obtain the [LU factorization](https://en.wikipedia.org/wiki/LU_decomposition) A=LU.

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