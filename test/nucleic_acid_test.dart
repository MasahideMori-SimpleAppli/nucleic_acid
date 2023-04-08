import 'package:flutter_test/flutter_test.dart';
import 'package:nucleic_acid/nucleic_acid.dart';
import 'dart:convert';

void main() {
  test('Test NucleotideSequence', () {
    NucleotideSequence gene = NucleotideSequence('attgac');
    expect(gene.toStr() == 'attgac', true);
    expect(gene.direction == EnumNucleotideSequenceDirection.fiveToThree, true);
    expect(gene.type == EnumNucleotideSequenceType.dna, true);

    NucleotideSequence templateDNA =
        gene.complemented(EnumNucleotideSequenceType.dna);
    expect(templateDNA.toStr() == 'taactg', true);
    expect(templateDNA.direction == EnumNucleotideSequenceDirection.threeToFive,
        true);
    expect(templateDNA.type == EnumNucleotideSequenceType.dna, true);

    // transcription
    NucleotideSequence mRNA = gene.converted(EnumNucleotideSequenceType.rna);
    expect(mRNA.toStr() == 'auugac', true);
    expect(mRNA.direction == EnumNucleotideSequenceDirection.fiveToThree, true);
    expect(mRNA.type == EnumNucleotideSequenceType.rna, true);

    NucleotideSequence tRNA = mRNA.complemented(EnumNucleotideSequenceType.rna);
    expect(tRNA.toStr() == 'uaacug', true);
    expect(tRNA.direction == EnumNucleotideSequenceDirection.threeToFive, true);
    expect(tRNA.type == EnumNucleotideSequenceType.rna, true);

    final NucleotideSequence resumed =
        NucleotideSequence.fromDict(jsonDecode(jsonEncode(tRNA.toDict())));
    expect(resumed.toStr() == 'uaacug', true);
    expect(
        resumed.direction == EnumNucleotideSequenceDirection.threeToFive, true);
    expect(resumed.type == EnumNucleotideSequenceType.rna, true);

    // translation
    AminoAcidSequence peptide = AminoAcidSequence(mRNA);
    expect(peptide.toStr() == 'ID', true);
    peptide = AminoAcidSequence.fromDict(peptide.toDict());
    expect(peptide.toStr() == 'ID', true);
    expect(peptide.direction == EnumAminoAcidSequenceDirection.nToC, true);

    AminoAcidSequence peptideFromDNA = AminoAcidSequence(gene);
    expect(peptideFromDNA.toStr() == 'ID', true);
    peptideFromDNA = AminoAcidSequence.fromDict(peptideFromDNA.toDict());
    expect(peptideFromDNA.toStr() == 'ID', true);
    expect(
        peptideFromDNA.direction == EnumAminoAcidSequenceDirection.nToC, true);

    // sub sequence
    NucleotideSequence gac = NucleotideSequence('attgac').subSeq(3);
    expect(gac.toStr() == 'gac', true);
  });

  test('Test NucleotideSequence addition', () {
    NucleotideSequence gene1 = NucleotideSequence('att');
    NucleotideSequence gene2 = NucleotideSequence('gac');
    NucleotideSequence gene3 = gene1 + gene2;
    expect(
        gene1.direction == EnumNucleotideSequenceDirection.fiveToThree &&
            gene1.direction == gene2.direction,
        true);
    expect(gene3.toStr() == 'attgac', true);
    NucleotideSequence gene4 = gene1 + gene2.reversed();
    expect(gene4.toStr() == 'attcag', true);
    gene1.add(gene2.reversed(), useDirection: true);
    expect(gene1.toStr() == 'attgac', true);
    gene1 = NucleotideSequence('att',
        direction: EnumNucleotideSequenceDirection.threeToFive);
    gene2 = NucleotideSequence('gac',
        direction: EnumNucleotideSequenceDirection.threeToFive);
    gene3 = gene1 + gene2;
    expect(gene3.toStr() == 'attgac', true);
    gene4 = gene1 + gene2.reversed();
    expect(gene4.toStr() == 'attcag', true);
    gene1.add(gene2.reversed(), useDirection: true);
    expect(gene1.toStr() == 'attgac', true);
  });

  test('Test AminoAcidSequence addition', () {
    AminoAcidSequence pep1 = AminoAcidSequence(NucleotideSequence('attgac'));
    AminoAcidSequence pep2 = AminoAcidSequence(NucleotideSequence('attgac'));
    AminoAcidSequence pep3 = pep1 + pep2;
    expect(
        pep1.direction == EnumAminoAcidSequenceDirection.nToC &&
            pep1.direction == pep2.direction,
        true);
    expect(pep3.toStr() == 'IDID', true);
    AminoAcidSequence pep4 = pep1 + pep2.reversed();
    expect(pep4.toStr() == 'IDDI', true);
    pep1.add(pep2.reversed(), useDirection: true);
    expect(pep1.toStr() == 'IDID', true);
    pep1 = AminoAcidSequence(NucleotideSequence('attgac',
        direction: EnumNucleotideSequenceDirection.threeToFive));
    pep2 = AminoAcidSequence(NucleotideSequence('attgac',
        direction: EnumNucleotideSequenceDirection.threeToFive));
    pep3 = pep1 + pep2;
    expect(pep3.toStr() == 'IDID', true);
    pep4 = pep1 + pep2.reversed();
    expect(pep4.toStr() == 'IDDI', true);
    pep1.add(pep2.reversed(), useDirection: true);
    expect(pep1.toStr() == 'IDID', true);
  });

  test('Test UtilNucleotideSearch', () {
    // get sequence positions.
    final NucleotideSequence seq =
        NucleotideSequence('ATGAATTCAGAATTCTATATATATATACC'.toLowerCase());
    final NucleotideSequence ecoRI = NucleotideSequence('GAATTC'.toLowerCase());
    List<int> ecoRIPositions =
        UtilNucleotideSearch.getPositions(seq, ecoRI, true);
    expect(ecoRIPositions[0] == 2, true);
    expect(ecoRIPositions[1] == 9, true);
    // get tandem repeat.
    List<List<int>> tRepeat =
        UtilNucleotideSearch.tandemRepeat(seq, 2, 2, true);
    expect(tRepeat[0][0] == 15, true); // start repeat.
    expect(tRepeat[0][1] == 27, true); // end repeat.
    expect(
        seq.subSeq(tRepeat[0][0], tRepeat[0][1]).toStr().toUpperCase() ==
            "TATATATATATA",
        true);
    // fuzzy search test.
    final NucleotideSequence fuzzyEcoRI =
        NucleotideSequence('GNMTTC'.toLowerCase());
    final NucleotideSequence fuzzySeq =
        NucleotideSequence('ATGAATTCAGAATTCTMTMTNTNTATACC'.toLowerCase());
    List<int> ecoRIPositions2 = UtilNucleotideSearch.getPositions(
        seq, fuzzyEcoRI, true,
        fuzzyComp: true);
    expect(ecoRIPositions2[0] == 2, true);
    expect(ecoRIPositions2[1] == 9, true);
    // get tandem repeat.
    List<List<int>> tRepeat2 = UtilNucleotideSearch.tandemRepeat(
        fuzzySeq, 2, 2, true,
        fuzzyComp: true);
    expect(tRepeat2[0][0] == 13, true); // start repeat.
    expect(tRepeat2[0][1] == 23, true); // end repeat.
    expect(
        fuzzySeq.subSeq(tRepeat2[0][0], tRepeat2[0][1]).toStr().toUpperCase() ==
            "TCTMTMTNTN",
        true);
  });
}
