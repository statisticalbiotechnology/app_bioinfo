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
