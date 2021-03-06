# Plotting with matplotlib and seaborn

Before we approach plotting routines in python, we introduce a couple of different python related tools and packages.

### Jupyter notebooks

Spin off from the [IPython](https://ipython.readthedocs.io/en/stable/) project. Jupyter enables interactive programming for Julia, Python and R (JuPytR).
Enables a mixture of documentation, code, and results to appear in the same page.

Pros:
* Great for documentation
* Easy way to dessiminate ideas
* Quick results

Cons:
* Unlike a script a notebook is not executed in one run from a terminal (hard to automate)
* Hard to version control

I.e. great for use-once code, or documentation, but not for production code.

Install: `$ pip install jupyterlab`

Run by issuing `$ jupyter-lab`

### Numpy

Numpy enambles vector and matrix calculations for python. 

Many matrix operations are as fast in numpy as in C or C++.

Example, to solve the equation system Ax=b
```python
import numpy as np

A=np.array([[3,1],[1,2]])
b=np.array([9,8])
x=np.linalg.solve(A,b)
```
### Pandas

Package that handles tabular data in python. The package emulates the data frame class of R.

An example, where we define a DataFrame from scratch:

```
import pandas as pd
data = [['Alex',10],['Bob',12],['Clarke',13]]
df = pd.DataFrame(data,columns=['Name','Age'])
df.to_markdown()
```
|    | Name   |   Age |
|---:|:-------|------:|
|  0 | Alex   |    10 |
|  1 | Bob    |    12 |
|  2 | Clarke |    13 | 

Or load a predefined DataFrame, in this case I download from seaborn, which has several datasets available for illustration, which can be listed through `seaborn.get_dataset_names()`

```
import pandas as pd
import seaborn as sns
tips = sns.load_dataset("tips")
tips
```

One can get an overview of the table by a command `describe`:

```
tips.describe()
```

You can access a specific column by its name, e.g.  
`tips["total_bill"]`

You can create new columns,
```
tips["tip_rate"] = tips["tip"]/tips["total_bill"]
```

Similarly you can access specific rows in a table with `loc[index]`, e.g.

```
tips.loc[tips["sex"]=="Female"].describe()
```

## Plotting in python

There are several plotting packages available in python

* matplotlib - most detailed package, the original
* seaborn - an higher level package making prettier plots
* many others, e.g. bokeh, plottly, pygal

### Matplotlib

Made to mimic matlabs plotting functionality
Lets make some examples.

### Seaborn

Higher level functionality. Works in tandem with pandas.


### General advise on plotting

* Avoid using too many (>4) series in the same plot
* Avoid colors that are hard for colorblinds to discern. Check out [Wong](https://www.nature.com/articles/nmeth.1618)
* Use histograms, kde, hexbins, colomaps etc, when there aree too many datapoints to discern the individual data points. Do not use scatter plots for such data.
* Label your axes
* Use large fonts
* Try to make your plot in Black and White. It is often a requirement for journals, but it is also a good way to see if it is clear enough.
* Make your plotting code a part of project code. This is particularly urgent for figures of a manuscript.
