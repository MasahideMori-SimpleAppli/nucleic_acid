import 'nucleotide_sequence.dart';

class UtilCompareNucleotide {
  /// (en) Compares two NucleotideSequence by base only and returns true if they are the same.
  ///
  /// (ja) ２つのNucleotideSequenceを塩基のみを基準に比較し、同じであればtrueを返します。
  /// * [a] : Sequence 1.
  /// * [b] : Sequence 2.
  static bool compareBase(NucleotideSequence a, NucleotideSequence b) {
    if (a.length != a.length) return false;
    for (int i = 0; i < a.length(); i++) {
      if (a.sequence[i].base != b.sequence[i].base) return false;
    }
    return true;
  }

  /// (en) Compares two NucleotideSequence and returns true if they are the same.
  ///
  /// (ja) ２つのNucleotideSequenceを比較し、同じであればtrueを返します。
  ///
  /// * [a] : Sequence 1.
  /// * [b] : Sequence 2.
  static bool compare(NucleotideSequence a, NucleotideSequence b) {
    if (a.length != a.length) return false;
    for (int i = 0; i < a.length(); i++) {
      if (a.sequence[i].base != b.sequence[i].base) return false;
      if (a.sequence[i].infoKey != b.sequence[i].infoKey) return false;
    }
    return true;
  }
}
