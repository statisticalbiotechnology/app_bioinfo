x = Channel.from( 'Alice', 'Bob', 'Charlie')

process helloPerson {
    input:
    val x

    exec:
    println "Hello $x"
}
