#!/usr/bin/env nextflow

params.input = "$baseDir/books/*.txt"
params.output = "$baseDir/results"
params.help = false

start_var = Channel.from("""
*********Start running dat and png stuff*********

This was made in a quick and dirty way the best would have been to use DSL2 and modules as well as making a proper archive with the python script in order.
I would have also made a proper config file.
--help if you want to have some help
Done by Renaud Van Damme (check my main pipeline to see a "better" nextflow code https://github.com/RVanDamme/MUFFIN )
**************************************
""")
start_var.view()

if (params.help) { exit 0, helpMSG() }
def helpMSG() {
    log.info """
    *********Help about dat and png stuff*********
    --help if you want to have some help
    --input to change the input path
    --output to change the output path
    **************************************
    """
    }


input_cha = Channel
                .fromPath( params.input )
                .map { file -> tuple(file.baseName, file) }

// input_cha.view()

process dats {
 
    input:
    tuple val(id), path(file) from input_cha
 
    output:
    tuple val(id), path('*.dat') into dats_cha

    shell:
    """
    echo "working on file:" ${file} with ${id}
    python $baseDir/countwords.py ${file} ${id}.dat
    """
}

png_cha=Channel.create()
collect_cha=Channel.create()

dats_cha.separate(png_cha , collect_cha) { a -> [[a[0],a[1]], a[1] ] }
// png_cha.view()

result_cha = collect_cha.collect()
// result_cha.view()

process result {
    publishDir {params.output}
    input:
    path(datfile) from result_cha
 
    output:
    path('results.txt') into done_result_cha

    script:
 
    """
    python $baseDir/testzipf.py ${datfile} > results.txt
    """
}

// done_cha.view()

process png {
    publishDir {params.output}
    input:
    tuple val(id), path(datfile) from png_cha
 
    output:
    path('*.png') into done_png_cha

    script:
 
    """
    echo "working on file:" ${datfile} with ${id}
    python $baseDir/plotcounts.py ${datfile} ${id}.png
    """
}