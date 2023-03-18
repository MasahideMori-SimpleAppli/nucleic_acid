import 'package:flutter_test/flutter_test.dart';
import 'package:nucleic_acid/nucleic_acid.dart';

void main() {
  test('Test UtilDNA', () {
    bool errFlag = false;
    try {
      UtilDNA.checkBase("ATGC");
    } catch (e) {
      errFlag = true;
    }
    expect(errFlag, false);
    try {
      UtilDNA.checkBase("AUGC");
    } catch (e) {
      errFlag = true;
    }
    expect(errFlag, true);
    expect(UtilDNA.complement("ATGC"), "TACG");
    expect(UtilDNA.complementRNA("ATGC"), "UACG");
    expect(UtilDNA.transcriptionFromSenseStrand("ATGC"), "AUGC");
    expect(UtilDNA.transcriptionFromAntiSenseStrand("ATGC"), "UACG");
  });

  test('Test UtilRNA', () {
    bool errFlag = false;
    try {
      UtilRNA.checkBase("AUGC");
    } catch (e) {
      errFlag = true;
    }
    expect(errFlag, false);
    try {
      UtilRNA.checkBase("ATGC");
    } catch (e) {
      errFlag = true;
    }
    expect(errFlag, true);
    expect(UtilRNA.complement("AUGC"), "UACG");
    expect(UtilRNA.complementDNA("AUGC"), "TACG");
  });
}
