all: speech.count

%.count: %.words
		cat $< | sort | uniq -c | awk '{print $$1 " " $$2}' | sort -nr > $@

%.words: %.strip
	cat $< | tr ' ' '\n' | tr -d ',.();[]+{}:|?=' | awk '{print tolower($$0)}' > $@

%.strip: %.txt
	cat $< | sed -e 's/<[^>]*>//g' | sed 's/&quot;//g' | sed -r '/^$$/d' | sed -r '/^\s+/d' | tail -n+4 | head -n-1 > $@

speech.txt:
	curl www.let.rug.nl/usa/documents/1951-/martin-luther-kings-i-have-a-dream-speech-august-28-1963.php 2> /dev/null > speech.txt
