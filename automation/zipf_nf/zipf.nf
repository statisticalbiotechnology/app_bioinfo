#!/usr/bin/env nextflow

params.dir = "/home/lukask/git/app_bioinfo/automation/make-lesson/books"
script_dir= "/home/lukask/git/app_bioinfo/automation/make-lesson"

book_ch = Channel.fromPath(params.dir + "/*.txt")

process countWords {
	input:
	file book from book_ch

	output:
	file "book_dat" into dat_ch

	"""
	python $script_dir/countwords.py $book book_dat
	"""
}

collect_ch = dat_ch.collect()

process zipf {
	input:
	file 'books' from collect_ch

	output:
	file 'results.txt' into receiver
	"""
	python $script_dir/testzipf.py $books > results.txt
	"""
}
receiver.println {"Received: $it"}
