import 'package:nucleic_acid/nucleic_acid.dart';

class UtilCompareNucleotide {
  /// (en) Compares two NucleotideSequence by base only and returns true if they are the same.
  ///
  /// (ja) ２つのNucleotideSequenceを塩基のみを基準に比較し、同じであればtrueを返します。
  /// * [a] : Sequence 1.
  /// * [b] : Sequence 2.
  /// * [fuzzyComp] : If true, Can contain m, r, w, s, y, k, v, h, d, b, n.
  /// If true, t and u are searched as the same.
  static bool compareBase(
      NucleotideSequence a, NucleotideSequence b, bool fuzzyComp) {
    if (a.length() != a.length()) return false;
    for (int i = 0; i < a.length(); i++) {
      if (fuzzyComp) {
        if (!a.sequence[i].base.fuzzyComparison(b.sequence[i].base))
          return false;
      } else {
        if (a.sequence[i].base != b.sequence[i].base) return false;
      }
    }
    return true;
  }

  /// (en) Compares two NucleotideSequence and returns true if they are the same.
  ///
  /// (ja) ２つのNucleotideSequenceを比較し、同じであればtrueを返します。
  ///
  /// * [a] : Sequence 1.
  /// * [b] : Sequence 2.
  /// * [fuzzyComp] : If true, Can contain m, r, w, s, y, k, v, h, d, b, n.
  /// If true, t and u are searched as the same.
  static bool compare(
      NucleotideSequence a, NucleotideSequence b, bool fuzzyComp) {
    if (a.length() != a.length()) return false;
    for (int i = 0; i < a.length(); i++) {
      if (fuzzyComp) {
        if (!a.sequence[i].base.fuzzyComparison(b.sequence[i].base))
          return false;
      } else {
        if (a.sequence[i].base != b.sequence[i].base) return false;
      }
      if (a.sequence[i].infoKey != b.sequence[i].infoKey) return false;
    }
    return true;
  }

  /// (en) Compares two Nucleotide and returns true if they are the same.
  ///
  /// (ja) ２つのNucleotideを比較し、同じであればtrueを返します。
  ///
  /// * [a] : Nucleotide 1.
  /// * [b] : Nucleotide 2.
  /// * [fuzzyComp] : If true, Can contain m, r, w, s, y, k, v, h, d, b, n.
  /// If true, t and u are searched as the same.
  static bool compareSingle(Nucleotide a, Nucleotide b, bool fuzzyComp) {
    if (fuzzyComp) {
      if (!a.base.fuzzyComparison(b.base)) return false;
    } else {
      if (a.base != b.base) return false;
    }
    if (a.infoKey != b.infoKey) return false;
    return true;
  }
}
