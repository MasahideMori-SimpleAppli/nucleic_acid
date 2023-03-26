import 'package:nucleic_acid/nucleic_acid.dart';

void main() async {
  NucleotideSequence gene = NucleotideSequence("attgac");
  //NucleotideSequence templateDNA =
  gene.complemented(EnumNucleotideSequenceType.dna);

  // 転写
  NucleotideSequence mRNA = gene.converted(EnumNucleotideSequenceType.rna);
  //NucleotideSequence tRNA = mRNA.complemented(EnumNucleotideSequenceType.rna);

  // 翻訳
  AminoAcidSequence peptide = AminoAcidSequence(mRNA);

  // 翻訳(DNAから直接アミノ酸配列に変換)
  //AminoAcidSequence peptideFromDNA = AminoAcidSequence(gene);
  print(peptide.toStr());
}
