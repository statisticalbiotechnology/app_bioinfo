# Build automation

Frequently your desirable reult is a product of several processing steps that needs to be executed sequential. Often the same set of steps needs to be executed in similar projects as well. Also sometimes you want to tweek some of the "in-the-middle" processing steps. Would it not be sweet if you did not have to reprocess all your steps up to that point? Here build automation can help you.

## GNU Make

GNU Make is a build automation system that has been an integral part of unix since 1976. It was written with building executables from source code in mind, but can be used for other purposes as well.

GNU Make execution interprets a programable script: A make file, typically named "Makefile"
The make file contains rules, following a scheme,
```
product: dependency1 [dependecy2 ...]
    action
```
Note that the action has to be breceeded by a tab character.
An example rule:
```
my.mzdata: my.raw
    msconvert -o my.mzdata -i my.raw
```
These can be generalized using wildcard charecters,
```
all: my.mzdata

%.mzdata: %.raw
    msconvert -o $@ -i $<
```

An example [Makefile](martin/Makefile).

## Modern automation

While GNU Make is sufficient for handling data from most projects, there are resons to look on more modern build automation tools, such as snakemake and nextflow if your project:

* Includes advanced dependency structures
* Should be parallelized over a cluster
* You want to containerize your code with Docker or Singularity

### Nextflow

Built around the concepts of Processeses and channels. A process takes one or more channels as input and operates on the data from the chanels, and forwards data on another channel.

An example:
```
x = Channel.from( 'Alice', 'Bob', 'Charly')

process simpleSum {
    input:
    val x

    exec:
    println "Hello $x"
}
```


