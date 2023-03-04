import 'package:flutter_test/flutter_test.dart';
import 'package:nucleic_acid/nucleic_acid.dart';

void main() {
  test('Test DNA', () {
    bool errFlag = false;
    try {
      DNA.checkBase("ATGC");
    } catch (e) {
      errFlag = true;
    }
    expect(errFlag, false);
    try {
      DNA.checkBase("AUGC");
    } catch (e) {
      errFlag = true;
    }
    expect(errFlag, true);
    expect(DNA.complement("ATGC"), "TACG");
    expect(DNA.complementRNA("ATGC"), "UACG");
    expect(DNA.transcriptionFromSenseStrand("ATGC"), "AUGC");
    expect(DNA.transcriptionFromAntiSenseStrand("ATGC"), "UACG");
  });

  test('Test RNA', () {
    bool errFlag = false;
    try {
      RNA.checkBase("AUGC");
    } catch (e) {
      errFlag = true;
    }
    expect(errFlag, false);
    try {
      RNA.checkBase("ATGC");
    } catch (e) {
      errFlag = true;
    }
    expect(errFlag, true);
    expect(RNA.complement("AUGC"), "UACG");
    expect(RNA.complementDNA("AUGC"), "TACG");
  });
}
