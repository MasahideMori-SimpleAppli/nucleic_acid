import 'package:flutter_test/flutter_test.dart';
import 'package:nucleic_acid/nucleic_acid.dart';

void main() {
  test('Test NucleotideSequence', () {
    NucleotideSequence gene = NucleotideSequence("attgac");
    expect(gene.toStr() == "attgac", true);
    expect(gene.direction == EnumNucleotideSequenceDirection.fiveToThree, true);
    expect(gene.type == EnumNucleotideSequenceType.dna, true);

    NucleotideSequence templateDNA =
        gene.complemented(EnumNucleotideSequenceType.dna);
    expect(templateDNA.toStr() == "taactg", true);
    expect(templateDNA.direction == EnumNucleotideSequenceDirection.threeToFive,
        true);
    expect(templateDNA.type == EnumNucleotideSequenceType.dna, true);

    // transcription
    NucleotideSequence mRNA = gene.converted(EnumNucleotideSequenceType.rna);
    expect(mRNA.toStr() == "auugac", true);
    expect(mRNA.direction == EnumNucleotideSequenceDirection.fiveToThree, true);
    expect(mRNA.type == EnumNucleotideSequenceType.rna, true);

    NucleotideSequence tRNA = mRNA.complemented(EnumNucleotideSequenceType.rna);
    expect(tRNA.toStr() == "uaacug", true);
    expect(tRNA.direction == EnumNucleotideSequenceDirection.threeToFive, true);
    expect(tRNA.type == EnumNucleotideSequenceType.rna, true);

    final NucleotideSequence resumed =
        NucleotideSequence.fromDict(tRNA.toDict());
    expect(resumed.toStr() == "uaacug", true);
    expect(
        resumed.direction == EnumNucleotideSequenceDirection.threeToFive, true);
    expect(resumed.type == EnumNucleotideSequenceType.rna, true);

    // translation
    AminoAcidSequence peptide = AminoAcidSequence(mRNA);
    expect(peptide.toStr() == "ID", true);
    peptide = AminoAcidSequence.fromDict(peptide.toDict());
    expect(peptide.toStr() == "ID", true);

    AminoAcidSequence peptideFromDNA = AminoAcidSequence(gene);
    expect(peptideFromDNA.toStr() == "ID", true);
    peptideFromDNA = AminoAcidSequence.fromDict(peptideFromDNA.toDict());
    expect(peptideFromDNA.toStr() == "ID", true);
  });
}
