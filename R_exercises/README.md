Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-11-19

----------
# R exercises

## Table of Contents
- [R-exercises](#R-exercises)
  - [2017-01-22](#2017-01-22)

----------
# R-exercises

## 2017-01-22
https://www.r-exercises.com/2017/01/22/bioinformatics-lessons-in-r-1-biostrings-exercises/
R-exercises – Bioinformatics Tutorial with Exercises in R (part 1)

	library(Biostrings)

	# Exercise 1
	myDNA <- c("ATGTTGCATTCATTAATTAAGAACGACCCAATACA") 
	myDNA

	# Exercise 2
	myDNA <- "CTGATTT-GATGGTC-NAT"
	myDNA
	length(myDNA)

	# Exercise 3
	myDNASeq <- DNAString("CTGATTT-GATGGTC-NAT")
	myDNASeq
	length(myDNASeq)

	# Exercise 4
	class(myDNA)
	class(myDNASeq)

	# Exercise 5
	?paste
	pastedDNA <- paste(myDNA, myDNASeq)
	pastedDNA
	class(pastedDNA)

	# Exercise 6
	# DNAString(), RNAString(), AAString()
	myDNASeq <- DNAString("CTGATTT-GATGGTC-NAT")
	complement(myDNASeq)

	# Exercise 7
	reverse(myDNASeq)

	# Exercise 8
	reverseComplement(myDNASeq)

	# Exercise 9
	alphabetFrequency(myDNASeq)

	# Exercise 10
	translate(myDNASeq)

> translate(myDNASeq)
Error in .Call2("DNAStringSet_translate", x, skip_code, dna_codes[codon_alphabet],  : 
  not a base at pos 8

----------

## Acknowledgements

----------

## References

----------
