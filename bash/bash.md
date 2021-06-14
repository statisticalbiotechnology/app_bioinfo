# More on bash

* Bash is the most commonly used unix shell
* Can operate almost as a programming language of its own:
    - Supports variables, loops and branching statements

## Variables

One can easily assign variables with statments like:

```
a=10
a="Hello"
a=`ls`
```

Variable can be referenced by statments like:

```
echo $a
```


## Branching
```
if [ "$a" == "hello" ]; then
    echo "a was hello"
else
    echo "a was not hello"
fi
```

## Loops

```
for x in 1 2 3 4
do
    echo $x
end
```

## Streams and Pipes

In unix all processes/programs are executed with streams
There are three standard ones:
* stdin (0)
* stdout (1)
* stderr (2) 


stdin => Program => stdout
         |
         -> sterr


### Redirection

Stdout:
>file  >>file

Stderr:
2>file 2>>file 

Stdin:
<file 

Pipes:

pgm1 | pgm2

Redirecting sterr to stdout

2>&1 


# One liners

Powerful option to stack sets of commands ontop of each other

I.e. count the numbers of mentions of NCBI at their homepage 

```
curl https://www.ncbi.nlm.nih.gov 2> /dev/null | grep -ic NCBI
```

List the 3 largest log files at my computer

du -sk /var/log/* 2> /dev/null | sort -rn | head -n3


How many ECOLI sequences there are in the training set of Phobius?

curl https://phobius.sbc.su.se/download/set.tar.gz 2> /dev/null | gunzip -cd | grep -a ECOLI

## awk and sed

You can easily maipulate streams with sed and awk.

### Sed

Character based stream manipulation.
Replace letters i.e.

ls | sed 's/m/q/g'

will replace all 'm' letters with 'q'

### awk

Line and Field based mainipulation. 
The awk script is executed once per line on stdin

#### Command structure

Condition { command }

Condition is frequently evaluated against the current line. E.g.

/^>/ {print $1}

#### Variables

Variables are assigned for each field
```
$1 is first field
$2 is second field
...
$NF is last field

$0 is the entire line
```

Fields are the strings apearing between field separators. You can set the field separator using
awk -F ','
is used for comma separated files.



There are branching structures like 
if($1==3) print $2; else print $4

Jump to next line of the input file:
next

To find the length of the current line:
length($0)