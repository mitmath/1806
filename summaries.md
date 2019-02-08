
| [18.06 front page](http://web.mit.edu/18.06)  |
[juliabox](http://www.juliabox.com) |
[piazza](https://piazza.com/class/jrpkrwivp6x6v8) |
[gradescope](https://www.gradescope.com/courses/40389) |
[Julia](https://julialang.org/) |
[VMLS text](http://vmls-book.stanford.edu/vmls.pdf) |
[VMLS Julia Companion](http://vmls-book.stanford.edu/vmls-julia-companion.pdf) |

You can change sections on [Stellar](https://learning-modules.mit.edu/class/index.html?uuid=/course/18/sp19/18.06#dashboard)  until full.
Further questions please direct to Theresa Cummings (tcumming at mit dot .edu)
We will not use Stellar for much this semester.

# Spring 2019 18.06 Syllabus <br>

This semester we are modernizing the class after several decades.  We will keep the best, but the needs of machine learning, data science, statistics,  engineering, and computation make linear algebra a critical subject.  Hand computation helps us understand, when possible, but computers do the work,
and not everything, not even small problems,  are  readily done by hand. Neural networks, matrix and vector differentiation are hot.  The Singular Value Decomposition takes a life of its own.  Eigenvalues are losing their place in line, but still key.  By spending less time on hand computation, we can spend more time on big concepts and abstractions like vector spaces and linear transformations.  This may be your first math class that does this.  We hope you enjoy the intellectual activity to follow. 

Some high schools teach a few matrix operations.  You might  understandably think  that linear algebra is  the topic that manipulates tables of numbers.  In the real world, most matrices are not even represented as tables of numbers.  You will grow to learn that so much of the fabric of mathematics, science, and engineering, and computation is best understood with linear algebra.
If you come back in 5 years and said, "wow Linear Algebra prepared me more than I could have imagined while I was taking  the class," we would be most pleased.



|#|Day| Date |  Topic | Reading| HW |
|-|-|------|------|-----|--|
|0||| Prereqs: 18.02 |  We assume familiarity with the very basics, or that you can pick it up as you go (many students have): Strang Chapter 1, [VMLS](http://vmls-book.stanford.edu/vmls.pdf)  1.1-1.4, 2.1, 3.1, 6.1, 10.1 | [HW0](https://nbviewer.jupyter.org/github/mitmath/1806/blob/master/psets/pset00.ipynb) is a practice class workflow.  It is to be handed in by Sunday 2/10  at 4:55pm, but will not be graded.  <a href="https://youtu.be/NGmdBOcnBCE">Video of HW0 workflow by Jonathan Edelman who didn't quite make it to the last step</a> <a href="https://youtu.be/NGmdBOcnBCE"><img src="https://i.ytimg.com/vi/NGmdBOcnBCE/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLA7ZvHBB2I15pyz78RXIz5dKyH_hg"></a>  WARNING: How you download matters.  "Save LINK as" seems to always work when you download.
|0||| Not a Pre-req | We assume no familiarity with computing or Julia.  Some homework problems will use Julia (kind of) as a calculator. This is not a programming class. On occasion, Julia programming may be demonstrated if it helps understand linear algebra, but Julia syntax will never be tested.  Tests will be traditional paper and pencil. | 
 |1| W|2/6| A modern (personal) view of Linear Algebra: Head in the Clouds; Feet on the Ground   | [Slides](https://docs.google.com/presentation/d/1znZ9IuK7Th3bjMRttfuCbWT1gSQmwKLtLx-XLlbjp8k/edit?usp=sharing)|
|	2	|	F	|	2/8	|Matrix Factorizations, Multiplication and Block Matrices| We will see (mostly) 2x2 versions of LU, LDU, Cholesky, SVD and Eig. See class slides. Also Strang 2.4 |Optional Julia Tutorial 5pm-7pm Prof. Steven Johnson 32-141|
|	3	|	M	|	2/11	|Norm, Distance and Complexity| Chapters 3 and  6 of [VMLS](http://vmls-book.stanford.edu/vmls.pdf) |
|	4	|	W	|	2/13	||| [HW1](https://nbviewer.jupyter.org/github/mitmath/1806/blob/master/psets/pset1.ipynb)  due |
|	5	|	F	|	2/15	|
|	6	|	T	|	2/19 (Pres Day+1)	|
|	7	|	W	|	2/20	|||HW2 due |
|	8	|	F	|	2/22	|
|	9	|	M	|	2/25	||
|	10	|	W	|	2/27	|review||shorter HW 3 due|
|	11	|	F	|	3/1	| **Exam 1** |
|	12	|	M	|	3/4	|
|	13	|	W	|	3/6	|||HW 4 due|
|	14	|	F	|	3/8 (add date)	|
|	15	|	M	|	3/11	|
|	16	|	W	|	3/13	|||HW 5 due|
|	17	|	F	|	3/15	|
|	18	|	M	|	3/18	|
|	19	|	W	|	3/20	|||HW 6 due|
|	20	|	F	|	3/22 (Spring Break next week)	|
|	21	|	M	|	4/1	|
|	22	|	W	|	4/3	|review|||
|	23	|	F	|	4/5	| **Exam 2**|
|	24	|	M	|	4/8	|
|	25	|	W	|	4/10	|||HW 7 due|
|	26	|	F	|	4/12 (CPW. Pats Day next week)	|
|	27	|	W	|	4/17	|||HW 8 due|
|	28	|	F	|	4/19	|
|	29	|	M	|	4/22	|
|	30	|	W	|	4/24 (Drop date tomorrow)	|||HW 9  due|
|	31	|	F	|	4/26	|
|	32	|	M	|	4/29	|
|	33	|	W	|	5/1	|review|
|	34	|	F	|	5/3	|**Exam 3** |
|	35	|	M	|	5/6	|
|	36	|	W	|	5/8	| || HW 10 due|
|	37	|	F	|	5/10	|
|	38	|	M	|	5/13	|
|	39	|	W	|	5/15	| Tropical Numbers |




# Spring 2019 [18.06](https://web.mit.edu/18.06/www/) Lecture Summaries <br>
 [Prof. Alan Edelman](http://math.mit.edu/~edelman)

This document will contain   a *brief* summary of what was covered in each 18.06
lecture.  It is unlikely that old videos or other notes will be enough to learn this semester's 18.06. We recommend attending lectures but will most summaries as a guide.

(You can also look at summaries from [Fall 2017](https://github.com/stevengj/1806/blob/fall17/summaries.md) and [Spring 2018](https://github.com/stevengj/1806/blob/spring18/summaries.md) but this is not the same class.)

