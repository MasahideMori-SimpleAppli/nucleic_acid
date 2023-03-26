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

// transcription
NucleotideSequence mRNA = gene.converted(EnumNucleotideSequenceType.rna);
NucleotideSequence tRNA = mRNA.complemented(EnumNucleotideSequenceType.rna);

// translation
AminoAcidSequence peptide = AminoAcidSequence(mRNA);

// trainslation(direct)
AminoAcidSequence peptideFromDNA = AminoAcidSequence(gene);

```

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