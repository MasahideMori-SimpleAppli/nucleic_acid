import 'package:flutter_test/flutter_test.dart';
import 'package:nucleic_acid/nucleic_acid.dart';
import 'dart:convert';

void main() {
  test('Test AminoAcid', () {
    AminoAcid acid = AminoAcid(EnumAminoAcid.Met);
    acid = AminoAcid.fromDict(jsonDecode(jsonEncode(acid.toDict())));
    acid.infoKey = "non chemical modification";
    acid = AminoAcid.fromDict(acid.toDict());
    expect(acid.infoKey == "non chemical modification", true);
    expect(EXTEnumAminoAcid.fromJAStr("メチオニン") == acid.type, true);
    expect(EXTEnumAminoAcid.fromFullStr("Methionine") == acid.type, true);
    expect(UtilAminoAcid.convertFullToOne("Methionine") == "M", true);
    expect(UtilAminoAcid.convertFullToThree("Methionine") == "Met", true);
    expect(UtilAminoAcid.convertOneToFull("M") == "Methionine", true);
    expect(UtilAminoAcid.convertOneToThree("M") == "Met", true);
    expect(UtilAminoAcid.convertThreeToOne("Met") == "M", true);
    expect(UtilAminoAcid.convertThreeToFull("Met") == "Methionine", true);
  });

  test('Test UtilAminoAcidSearch', () {
    // simple search
    AminoAcidSequence seq = AminoAcidSequence.fromStr("MVWWLALALAANYY");
    AminoAcidSequence target = AminoAcidSequence.fromStr("LXLXLXXN");
    List<int> tPositions1 = UtilAminoAcidSearch.getPositions(seq, target, true);
    expect(tPositions1.isEmpty, true);
    List<int> tPositions2 =
        UtilAminoAcidSearch.getPositions(seq, target, true, fuzzyComp: true);
    expect(tPositions2.isNotEmpty, true);
    expect(tPositions2[0] == 4, true);
    // search repeat
    List<List<int>> tRepeat = UtilAminoAcidSearch.tandemRepeat(seq, 2, 3, true);
    expect(tRepeat[0][0] == 4 && tRepeat[0][1] == 10, true);
    expect(seq.subSeq(tRepeat[0][0], tRepeat[0][1]).toStr() == "LALALA", true);
  });
}
