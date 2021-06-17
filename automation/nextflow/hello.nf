x = Channel.from( 'Alice', 'Bob', 'Charly')

process simpleSum {
    input:
    val x

    exec:
    println "Hello $x"
}
