import 'package:nucleic_acid/amino_acid/amino_acid_all.dart';

class UtilCompareAminoAcid {
  /// (en) Compares two AminoAcidSequence by type only and returns true if they are the same.
  ///
  /// (ja) ２つのAminoAcidSequenceをtypeのみを基準に比較し、同じであればtrueを返します。
  /// * [a] : Sequence 1.
  /// * [b] : Sequence 2.
  /// * [fuzzyComp] : If true, Can contain B,Z,X,J.
  static bool compareType(
      AminoAcidSequence a, AminoAcidSequence b, bool fuzzyComp) {
    if (a.length() != a.length()) return false;
    for (int i = 0; i < a.length(); i++) {
      if (fuzzyComp) {
        if (!a.sequence[i].type.fuzzyComparison(b.sequence[i].type)) {
          return false;
        }
      } else {
        if (a.sequence[i].type != b.sequence[i].type) return false;
      }
    }
    return true;
  }

  /// (en) Compares two AminoAcidSequence and returns true if they are the same.
  ///
  /// (ja) ２つのAminoAcidSequenceを比較し、同じであればtrueを返します。
  ///
  /// * [a] : Sequence 1.
  /// * [b] : Sequence 2.
  /// * [fuzzyComp] : If true, Can contain B,Z,X,J.
  static bool compare(
      AminoAcidSequence a, AminoAcidSequence b, bool fuzzyComp) {
    if (a.length() != a.length()) return false;
    for (int i = 0; i < a.length(); i++) {
      if (fuzzyComp) {
        if (!a.sequence[i].type.fuzzyComparison(b.sequence[i].type)) {
          return false;
        }
      } else {
        if (a.sequence[i].type != b.sequence[i].type) return false;
      }
      if (a.sequence[i].infoKey != b.sequence[i].infoKey) return false;
    }
    return true;
  }

  /// (en) Compares two AminoAcid and returns true if they are the same.
  ///
  /// (ja) ２つのAminoAcidを比較し、同じであればtrueを返します。
  ///
  /// * [a] : AminoAcid 1.
  /// * [b] : AminoAcid 2.
  /// * [fuzzyComp] : If true, Can contain B,Z,X,J.
  static bool compareSingle(AminoAcid a, AminoAcid b, bool fuzzyComp) {
    if (fuzzyComp) {
      if (!a.type.fuzzyComparison(b.type)) {
        return false;
      }
    } else {
      if (a.type != b.type) return false;
    }
    if (a.infoKey != b.infoKey) return false;
    return true;
  }
}
