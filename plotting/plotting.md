# Plotting with matplotlib and seaborn

Before we approach plotting routines in python, we introduce a couple of different python related tools and packages.

### Jupyter notebooks

Spin off from the [IPython](https://ipython.readthedocs.io/en/stable/) project. Jupyter enables interactive programming for Julia, Python and R (JuPytR).
Enables a mixture of documentation, code, and results to appear in the same page.

Pros:
* Great documentation
* Easy to dessiminate
* Quick results

Cons:
* Unlike a script a notebook is not executed in one run from a terminal (hard to automate)
* Hard to version control

I.e. great for use-once code, or documentation, but not for production code.

Install: `$ pip install jupyterlab`

Run by issuing `$ jupyter-lab`

### Numpy

Numpy enambles vector and matrix calculkations for python. 

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

Or load a predefined DataFrame:

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

