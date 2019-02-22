
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

This semester we are modernizing the class after several decades.  We will keep the best, but the needs of machine learning, data science, statistics,  engineering, and computation make linear algebra a critical subject.  So as not to convey the wrong impression, this modernization is as valuable for science and the non computer-science subjects as well.  

Hand computation helps us understand, when possible, but computers do the work,
and not everything, not even small problems,  are  readily done by hand. Neural networks, matrix and vector differentiation are hot.  The Singular Value Decomposition takes a life of its own.  Eigenvalues are losing their place in line, but still key.  By spending less time on hand computation, we can spend more time on big concepts and abstractions like vector spaces and linear transformations.  This may be your first math class that does this.  We hope you enjoy the intellectual activity to follow. 

Some high schools teach a few matrix operations.  You might  understandably think  that linear algebra is  the topic that manipulates tables of numbers.  In the real world, most matrices are not even represented as tables of numbers.  You will grow to learn that so much of the fabric of mathematics, science, and engineering, and computation is best understood with linear algebra.
If you come back in 5 years and said, "wow Linear Algebra prepared me more than I could have imagined while I was taking  the class," we would be most pleased.

|Problem Set | Solutions | Due Date |
|-|-|-|
[HW0 Practice Workflow](https://nbviewer.jupyter.org/github/mitmath/1806/blob/master/psets/pset0.ipynb) || February 10, 4:55pm |
[HW1](https://nbviewer.jupyter.org/github/mitmath/1806/blob/master/psets/pset1.ipynb) | [HW1 Solutions](https://nbviewer.jupyter.org/github/mitmath/1806/blob/master/psets/pset1sol.ipynb)     | February 13, 10:55am |
[HW2](https://nbviewer.jupyter.org/github/mitmath/1806/blob/master/psets/pset2.ipynb?flush_cache=truea)| | February 20, 10:55am|
[HW3](https://nbviewer.jupyter.org/github/mitmath/1806/blob/master/psets/pset2.ipynb?flush_cache=truea)  | | February 27, 10:55am |




|#|Day| Date |  Topic | Reading| HW |
|-|-|------|------|-----|--|
|0||| Prereqs: 18.02 |  We assume familiarity with the very basics, or that you can pick it up as you go (many students have): Strang Chapter 1, [VMLS](http://vmls-book.stanford.edu/vmls.pdf)  1.1-1.4, 2.1, 3.1, 6.1, 10.1 | [HW0](https://nbviewer.jupyter.org/github/mitmath/1806/blob/master/psets/pset0.ipynb) is a practice class workflow.  It is to be handed in by Sunday 2/10  at 4:55pm, but will not be graded.  <a href="https://youtu.be/NGmdBOcnBCE">Video of HW0 workflow by Jonathan Edelman who didn't quite make it to the last step</a> <a href="https://youtu.be/NGmdBOcnBCE"><img src="https://i.ytimg.com/vi/NGmdBOcnBCE/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLA7ZvHBB2I15pyz78RXIz5dKyH_hg"></a>  WARNING: How you download matters.  "Save LINK as" seems to always work when you download.
|0||| Not a Pre-req | We assume no familiarity with computing or Julia.  Some homework problems will use Julia (kind of) as a calculator. This is not a programming class. On occasion, Julia programming may be demonstrated if it helps understand linear algebra, but Julia syntax will never be tested.  Tests will be traditional paper and pencil. | 
 |1| W|2/6| A modern (personal) view of Linear Algebra: Head in the Clouds; Feet on the Ground   | [Slides](https://docs.google.com/presentation/d/1znZ9IuK7Th3bjMRttfuCbWT1gSQmwKLtLx-XLlbjp8k/edit?usp=sharing)| [HW1](https://nbviewer.jupyter.org/github/mitmath/1806/blob/master/psets/pset1.ipynb) released 2/7.  A sample solution to a 2x2 factorization problem has been added to the end. |
|	2	|	F	|	2/8	|Linear Combinations, Vector Spaces, Elementwise Operations e.g. nonlinear neural net |  [Slides](https://docs.google.com/presentation/d/1znZ9IuK7Th3bjMRttfuCbWT1gSQmwKLtLx-XLlbjp8k/edit#slide=id.g4f6d86d03d_1_0)  Linear Combinations are mentioned already on page 1 of Strang. Vector Spaces are on page 123.   |Optional Julia Tutorial 5pm-7pm Prof. Steven Johnson 32-141|
|	3	|	M	|	2/11	|Transpose, Inverse, Block Matrices  | [Slides](https://docs.google.com/presentation/d/1znZ9IuK7Th3bjMRttfuCbWT1gSQmwKLtLx-XLlbjp8k/edit#slide=id.g4f6d86d03d_210_0) <ul> <li> A.  Transpose: 109-113 of Strang, Section 6.3.1 of VMLS.  </li> <li> B. Inverses: 83-85,89-90 of Strang, Chapters 11.1,11.2 of VMLS. </li> <li> C. Orthogonal Matrices: 233-235 of Strang, and 189 of VMLS. </li> <li> D. Block Matrices: 74 of Strang, bottom of page 179 of VMLS. </li>  </ul>|
|	4	|	W	|	2/13	|LU,QR|[Slides](https://docs.google.com/presentation/d/1znZ9IuK7Th3bjMRttfuCbWT1gSQmwKLtLx-XLlbjp8k/edit#slide=id.g4f8407bb15_279_0)<ul><li>A. LU factorization: page 563 of Strang has a table of factorizations, Section 2.6 of Strang has more computation than we will do right now (we are not doing pivots and elimination), VMLS almost mentions LU on page 208, but kind of doesn't </li> <li> B. QR factorization: Strang mentions QR a bit too quickly on page 239, VMLS in Section 10.4 </li>   </ul>| [HW1](https://nbviewer.jupyter.org/github/mitmath/1806/blob/master/psets/pset1.ipynb)  due |
|	5	|	F	|	2/15	| QR Applications| [Slides](https://docs.google.com/presentation/d/1znZ9IuK7Th3bjMRttfuCbWT1gSQmwKLtLx-XLlbjp8k/edit#slide=id.g4f8407bb15_357_0) QR is mentioned in Strang 239| [HW2](https://nbviewer.jupyter.org/github/mitmath/1806/blob/master/psets/pset2.ipynb?flush_cache=true) released 2/14.|
|	6	|	T	|	2/19 (Pres Day+1) |SVD	| [Slides](https://docs.google.com/presentation/d/1znZ9IuK7Th3bjMRttfuCbWT1gSQmwKLtLx-XLlbjp8k/edit#slide=id.g4fba4ef7dd_77_0)  <li>  The SVD: Strang mentions the SVD in Chapter 7.  I find the definition in terms of AᵀA a mixed bag.  It's straightforward if you know eigenvalues, but the SVD's true identity is lost in the  eigenworld.  I will not follow the eigenworld approach. </li>|
|	7	|	W	|	2/20	|  [Image Compression](https://nbviewer.jupyter.org/github/mitmath/1806/blob/master/Compressing%20an%20Image%20with%20the%20svd.ipynb), Nullspace, Column Space ||HW2 due |
|	8	|	F	|	2/22	|Linear Independence, Span, Basis|Section 3.4 of Strang, 5.1-5.3 of VMLS |
|	9	|	M	|	2/25	|review|
|	10	|	W	|	2/27	|guest lecturer [Sam Turton](https://math.mit.edu/directory/profile.php?pid=1732) projections| Section 4.2 of Strang|shorter HW 3 due|
|	11	|	F	|	3/1	| **Exam 1** Walker, during lecture hour,  closed book, includes material up to Friday 2/22,  grades visible probably in 24 hours,  no exam makeup (paper alternative - once per semester for emergencies) |
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


I have replaced summaries with lecture slides.
It is unlikely that old videos or other notes will be enough to learn this semester's 18.06. We recommend attending lectures but will post summaries as a guide.

(You can also look at summaries from [Fall 2017](https://github.com/stevengj/1806/blob/fall17/summaries.md) and [Spring 2018](https://github.com/stevengj/1806/blob/spring18/summaries.md) but this is not the same class.)


Further Topics we will cover are:  
<ul>
<li> Matrix Calculus, gradients  </li>
<li> Bases </li>
<li> Least Squares </li>
<li> Applications </li>
<li> Determinants </li>
<li> Eigenvalues </li>
<li> Markov Matrices </li>
<li> Positive Definite Matrices </li>
<li> Linear Transformations </li>
</ul>


