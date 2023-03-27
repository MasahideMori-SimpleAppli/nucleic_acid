import 'package:nucleic_acid/nucleic_acid.dart';

void main() async {
  NucleotideSequence gene = NucleotideSequence("attgac");
  NucleotideSequence templateDNA =
      gene.complemented(EnumNucleotideSequenceType.dna);

  // Transcription(転写)
  NucleotideSequence mRNA = gene.converted(EnumNucleotideSequenceType.rna);
  NucleotideSequence tRNA = mRNA.complemented(EnumNucleotideSequenceType.rna);

  // Translation(翻訳)
  AminoAcidSequence peptide = AminoAcidSequence(mRNA);

  // Translation(direct)(DNAから直接アミノ酸配列に変換)
  AminoAcidSequence peptideFromDNA = AminoAcidSequence(gene);

  // Extension(延長)
  // attgacattgac
  NucleotideSequence gene2 = gene + gene;
  // attgaccagtta
  NucleotideSequence gene3 = gene + gene.reversed();
  // attgacattgac
  gene.add(gene.reversed(), useDirection: true);

  // Copy(複製)
  NucleotideSequence geneCopy = gene.deepCopy();
}
