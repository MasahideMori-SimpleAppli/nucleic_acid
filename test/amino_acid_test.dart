import 'package:flutter_test/flutter_test.dart';
import 'package:nucleic_acid/nucleic_acid.dart';

void main() {
  test('Test AminoAcid', () {
    print("amino acid");
    AminoAcid acid = AminoAcid(EnumAminoAcid.Met);
    acid = AminoAcid.fromDict(acid.toDict());
    acid.decoration = {"test": "a"};
    acid = AminoAcid.fromDict(acid.toDict());
    expect(EXTEnumAminoAcid.fromJAStr("メチオニン") == acid.type, true);
    expect(EXTEnumAminoAcid.fromFullStr("Methionine") == acid.type, true);
    expect(UtilAminoAcid.convertFullToOne("Methionine") == "M", true);
    expect(UtilAminoAcid.convertFullToThree("Methionine") == "Met", true);
    expect(UtilAminoAcid.convertOneToFull("M") == "Methionine", true);
    expect(UtilAminoAcid.convertOneToThree("M") == "Met", true);
    expect(UtilAminoAcid.convertThreeToOne("Met") == "M", true);
    expect(UtilAminoAcid.convertThreeToFull("Met") == "Methionine", true);
  });
}
