# nucleic_acid

(en)Japanese ver is [here](https://github.com/MasahideMori-SimpleAppli/nucleic_acid/blob/main/README_JA.md).  
(ja)この解説の日本語版は[ここ](https://github.com/MasahideMori-SimpleAppli/nucleic_acid/blob/main/README_JA.md)にあります。

## Overview
This is a package for nucleic acid analysis support.
This package is made for scientists.

## Usage
```dart

NucleotideSequence gene = NucleotideSequence("attgac");
NucleotideSequence templateDNA = gene.complemented(EnumNucleotideSequenceType.dna);

// Transcription
NucleotideSequence mRNA = gene.converted(EnumNucleotideSequenceType.rna);
NucleotideSequence tRNA = mRNA.complemented(EnumNucleotideSequenceType.rna);

// Translation
AminoAcidSequence peptide = AminoAcidSequence(mRNA);

// Translation(direct)
AminoAcidSequence peptideFromDNA = AminoAcidSequence(gene);

// Extension
// attgacattgac
NucleotideSequence gene2 = gene + gene;
// attgaccagtta
NucleotideSequence gene3 = gene + gene.reversed();
// attgacattgac
gene.add(gene.reversed(), useDirection: true);

// Copy
NucleotideSequence geneCopy = gene.deepCopy();

// Get sub sequence
NucleotideSequence gac = NucleotideSequence("attgac").subSeq(3);
```

### File format conversion
```dart
    // FASTA
    String fastaContent = '>sequence1\n';
    String seq1 = 'ATGCAGTAGCTAGCTACGT';
    fastaContent += "$seq1\n";
    fastaContent += '>sequence2\n';
    String seq2 = 'CGTAGCTAGCTAGCATCGT';
    fastaContent += "$seq2\n";
    List<NucleotideSequence> nSeq = UtilFasta.read(fastaContent);
    String reConvertFasta = UtilFasta.write(nSeq[0], "sequence1");
```

### Array search
```dart
    // Search ecoRI position
    final NucleotideSequence seq =
        NucleotideSequence('ATGAATTCAGAATTCTATATATATATACC'.toLowerCase());
    final NucleotideSequence ecoRI = NucleotideSequence('GAATTC'.toLowerCase());
    // get 2 and 9.
    List<int> ecoRIPositions = UtilNucleotideSearch.getPositions(seq, ecoRI, true);

    // A fuzzy search is also possible.
    final NucleotideSequence fuzzyEcoRI = NucleotideSequence('GNMTTC'.toLowerCase());
    // get 2 and 9.
    List<int> ecoRIPositions2 = UtilNucleotideSearch.getPositions(seq, fuzzyEcoRI, true, fuzzyComp: true);
    
    // Searching for tandem repeats
    // get tRepeat[0][0] = 15 (start position), tRepeat[0][1] = 27 (end position).
    List<List<int>> tRepeats = UtilNucleotideSearch.tandemRepeat(seq, 2, 2, true);
    
    // A similar API is available for AminoAcidSequence.
    AminoAcidSequence aaSeq = AminoAcidSequence.fromStr("MVWWLALALAANYY");
    AminoAcidSequence target = AminoAcidSequence.fromStr("LXLXLXXN");
    // get tPositions[0] == 4.
    List<int> tPositions = UtilAminoAcidSearch.getPositions(aaSeq, target, true, fuzzyComp: true);
```

## About the data structure (decoded state)
The basic data structure in this package is as follows.
- NucleotideSequence
  - sequence: List
    - nucleotide: Nucleotide
      - base: EnumBase, The type of base.
      - infoKey: String?, nucleotideInfo key that can be used when considering chemical modification.
  - type: EnumNucleotideSequenceType, DNA or RNA.
  - direction: EnumNucleotideSequenceDirection, The direction of sequence。
  - id: String?, The serial ID of this sequence。
  - description: String?, The description of this sequence。
  - info: Map<String, dynamic>?, The other data of this sequence。
  - nucleotideInfo: Map<String, NucleotideInfo>?, Reference for detailed information about the nucleotides in this sequence.
    - key: String, A reference key that a Nucleotide has. For example, aliases when chemically decorated.
    - value: NucleotideInfo, Information such as chemical modification of Nucleotide.

- AminoAcidSequence
  - sequence: List
    - nucleotide: AminoAcid
      - type: EnumAminoAcid, The type of amino acid。
      - infoKey: String?, aminoAcidInfo key that can be used when considering chemical modification.
  - direction: EnumAminoAcidSequenceDirection, The direction of sequence。
  - id: String?, The serial ID of this sequence。
  - description: String?, The description of this sequence。
  - info: Map<String, dynamic>?, The other data of this sequence。
  - aminoAcidInfo: Map<String, NucleotideInfo>?, Reference for detailed information about the AminoAcids in this sequence.
    - key: String, A reference key that a AminoAcid has. For example, aliases when chemically decorated.
    - value: AminoAcidInfo, Information such as chemical modification of AminoAcid.

## Support
If you need paid support for any reason, please contact my company.  
This package is developed by me personally, but may be supported via the company.  
[SimpleAppli Inc.](https://simpleappli.com/en/index_en.html)

## About version control
The C part will be changed at the time of version upgrade.  
However, versions less than 1.0.0 may change the file structure regardless of the following rules.  
- Changes such as adding variables, structure change that cause problems when reading previous files.
    - C.X.X
- Adding methods, etc.
    - X.C.X
- Minor changes and bug fixes.
    - X.X.C

## License
This software is released under the MIT License, see LICENSE file.

## Copyright notice
The “Dart” name and “Flutter” name are trademarks of Google LLC.  
*The developer of this package is not Google LLC.