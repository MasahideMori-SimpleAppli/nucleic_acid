## 0.0.7
* This update supports some operations on amino acid sequences.
* Added length() method to AminoAcidSequence.
* Added UtilAminoAcidSearch class.
* Added UtilCompareAminoAcid class.
* Added compareSingle method to UtilCompareNucleotide.
* Split Fasta class search method to UtilFastaSearch class.
* The Util_XXX_SearchRepeat class and Util_XXX_SearchPattern class have been merged.
* The types of corresponding amino acids have increased.
* Fuzzy search enabled except for UtilFastaSearch.
  For example, LXLXLXXN is valid in the search sequence, where X is any amino acid.

## 0.0.6
* Revised data structure. Reduced memory usage and storage size.
* Fixed missing references.
* Added FASTA format converter. 
* Added sequence search utils.
* Added subSeq and subSeqNonInfo to NucleotideSequence and AminoAcidSequence.
* Fixed description.

## 0.0.5
* Revised data structure. Reduced memory usage and storage size.

## 0.0.4

* Added add method and + operator to NucleotideSequence and AminoAcidSequence.

## 0.0.3

* Updated description.

## 0.0.2

* I've made significant changes to make the specs more computationally friendly than before.

## 0.0.1

* Initial release.
