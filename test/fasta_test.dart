import 'package:flutter_test/flutter_test.dart';
import 'package:nucleic_acid/nucleic_acid.dart';

void main() {
  test('Test FASTA', () {
    String fastaContent = '>sequence1\n';
    String seq1 = 'ATGCAGTAGCTAGCTACGT';
    fastaContent += "$seq1\n";
    fastaContent += '>sequence2\n';
    String seq2 = 'CGTAGCTAGCTAGCATCGT';
    fastaContent += "$seq2\n";
    List<FastaRecord> fastaRecords = UtilFasta.readByFastaRecord(fastaContent);
    expect(fastaRecords[0].seq == seq1, true);
    expect(fastaRecords[1].seq == seq2, true);

    List<NucleotideSequence> nSeq = UtilFasta.read(fastaContent);
    expect(fastaRecords[0].seq.toLowerCase() == nSeq[0].toStr(), true);
    expect(fastaRecords[1].seq.toLowerCase() == nSeq[1].toStr(), true);
    fastaRecords[0].description = "test";
    expect(
        UtilFasta.write(nSeq[0], "test") ==
            UtilFasta.writeFromFastaRecord(fastaRecords[0]),
        true);
    expect(
        UtilFasta.write(nSeq[0], "test2") ==
            UtilFasta.writeFromFastaRecord(fastaRecords[0]),
        false);
  });
}
