# Fall 2018 [18.06](https://web.mit.edu/18.06/www/) Lecture Summaries <br>
 [Prof. Alan Edelman](http://math.mit.edu/~edelman)  

This document is a *brief* summary of what was covered in each 18.06
lecture, along with links and suggestions for further reading.  It is
*not* a good substitute for attending lecture, but may provide a
useful study guide.

(You can also look at the analogous summaries from [Fall 2017](https://github.com/stevengj/1806/blob/fall17/summaries.md).)

I'll try to update it within a day of each lecture.

## Lecture 1 (Feb 7)


[Overview](https://github.com/stevengj/1806/blob/master/lectures/1806overview.pdf)

[Gaussian Elimination](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Gaussian-elimination.ipynb)


[Machine Learning with Gaussian Elimination](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Machine-Learning-with-Gaussian-elimination.ipynb)

[PSET 1](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/psets/Pset1%20Spring2018%20Prof.Edelman.ipynb) is now online.

**Further reading:** Textbook sections 2.1 and 2.2.  Strang [lecture 2 video](https://www.youtube.com/watch?v=QVKj3LADCnA).

In the first lecture, we perform Gaussian elimination the "high school" way, by putting A next to b and
performing row operations.  In the next lecture we will move into a more matrix computation view by bringing
in Elimination matrices.  At the end of the notebook above I did a little machine learning experiment where
Gaussian elimination accurately finds the unknown parameters in a 3-vector w right away with one backslash, while traditional
machine learning can take a long time.  I'm not sure if traditional machine learning can be improved, but 
if any of you try running another software library and see better results, I'd be very interested. 




As I'm sure you know, the world needs creative people who understand concepts and how to use them.  This course  does not emphasize hand computation like the old days. 


## Lecture 2 (Feb 9)
* [Matrix-multiplication and LU notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Matrix-mult-perspectives.ipynb)

The big message: the matmul you learned in high school is not the only, perhaps not even the best perspective on how to multiply matrices.  There are many other ways.  There are really two key facts that are important

1. All the elementwise viewpoints can be reordered.  Matmul has that kind of "symmetry." 
2. It may be better to view a matrix as a collection of columns or rows or blocks or just as a whole.

You should understand all the views.  The column view.  The row view.  The outer product view.  The block matrix view.  You should unerstand why all 6 "ijk" choices are equally correct ways to multiply matrices.

**Further reading:** Textbook sections 2.3, 2.4, 2.6.  Strang [lecture 1 video](https://www.youtube.com/watch?v=ZK3O402wf1c), [lecture 4 video](https://www.youtube.com/watch?v=5hO3MrzPa0A).




## Optional Julia Tutorial (Friday Feb 9, 5pm, 32-141)

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

## Lecture 3 (Feb 12)

* [Elimination Matrices](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Elimination-matrices.ipynb)

* [LU and matrix-inverse notebook](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Inverses-LU-intro.ipynb)

* [Lower-Triangular-and-Elimination](http://nbviewer.jupyter.org/github/stevengj/1806/blob/master/lectures/Lower-Triangular-and-Elimination.ipynb)


Key Points to consider

* How the L matrix entries are just the multipliers from Gaussian elimination
* How in practice, one rarely "augments" the matrix with the right-hand side like in the old paper and pencil textbooks.  Instead, you compute A=LU, substitute this into Ax=b=LUx, let c=Ux, solve Lc=b, then solve Ux=c.  In particular, solving Lc=b is *exactly* the same as performing the Gaussian-elimination steps on c.
* Given A=LU, you can efficiently solve multiple right-hand sides, or equivalently the matrix equation AX=B.
* How row swaps lead to the factorization PA=LU: in practice, the computer *always* does row swaps, and always gives you a permutation matrix P (or its equivalent).
* Singular matrices = zero pivots (that can't be eliminated by row swaps) = no solutions or infinitely many solutions.


**Further reading:** Textbook sections 2.6, 2.7, 2.5.  Strang [lecture 4 video](https://www.youtube.com/watch?v=5hO3MrzPa0A) and [lecture 5 video](https://www.youtube.com/watch?v=JibVXBElKL0&list=PL49CF3715CB9EF31D).


## Lecture 4 (Feb 14)

To be posted tonight:
* PSET 2
* Solutions to PSET 1
