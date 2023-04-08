import 'package:nucleic_acid/nucleic_acid.dart';

class UtilNucleotideSearch {
  /// (en) Returns a list of the indices of the beginning of the pattern where the specified pattern occurs.
  ///
  /// (ja) 指定したパターンが出現する、パターンの先頭のインデックスをリストで返します。
  ///
  /// * [seq] : The sequence data.
  /// * [target] : The target pattern.
  /// * [compareOnlyBase] : If true, compare only Nucleotide.base.
  /// If false, compare also Nucleotide.infoKey.
  /// * [fuzzyComp] : If true, Can contain m, r, w, s, y, k, v, h, d, b, n.
  /// If true, t and u are searched as the same.
  static List<int> getPositions(
      NucleotideSequence seq, NucleotideSequence target, bool compareOnlyBase,
      {bool fuzzyComp = false}) {
    List<int> r = [];
    for (int i = 0; i <= seq.length() - target.length(); i++) {
      if (compareOnlyBase) {
        if (UtilCompareNucleotide.compareBase(
            seq.subSeqNonInfo(i, i + target.length()), target, fuzzyComp)) {
          r.add(i);
        }
      } else {
        if (UtilCompareNucleotide.compare(
            seq.subSeq(i, i + target.length()), target, fuzzyComp)) {
          r.add(i);
        }
      }
    }
    return r;
  }

  /// (en) Search for tandem repeats (short sequence repeats).
  ///
  /// (ja) タンデムリピート（短い配列の反復）を検索します。
  /// * [seq] : Sequence data.
  /// * [unitLen] : The length of the arrays that make up the repeats.
  /// * [minRepeat] : Specifies the minimum number of iterations to find.
  /// * [compareOnlyBase] : If true, compare only Nucleotide Base.
  /// If false, compare also replacement decoration and anotherName.
  /// * [fuzzyComp] : If true, Can contain m, r, w, s, y, k, v, h, d, b, n.
  /// If true, t and u are searched as the same.
  ///
  /// Returns : [[repeatStartPosition, repeatEndPosition],...]
  static List<List<int>> tandemRepeat(
      NucleotideSequence seq, int unitLen, int minRepeat, bool compareOnlyBase,
      {bool fuzzyComp = false}) {
    List<List<int>> r = [];
    late NucleotideSequence pattern;
    for (int i = 0; i <= seq.length() - unitLen * minRepeat; i++) {
      int repeatCount = 0;
      for (int j = 1; j * unitLen + i <= seq.length() - unitLen; j++) {
        if (compareOnlyBase) {
          pattern = seq.subSeqNonInfo(i, i + unitLen);
          if (UtilCompareNucleotide.compareBase(
              seq.subSeqNonInfo(i + j * unitLen, i + (j + 1) * unitLen),
              pattern,
              fuzzyComp)) {
            repeatCount++;
          } else {
            break;
          }
        } else {
          pattern = seq.subSeq(i, i + unitLen);
          if (UtilCompareNucleotide.compare(
              seq.subSeq(i + j * unitLen, i + (j + 1) * unitLen),
              pattern,
              fuzzyComp)) {
            repeatCount++;
          } else {
            break;
          }
        }
      }
      if (repeatCount >= minRepeat - 1) {
        r.add([i, i + unitLen * (repeatCount + 1)]);
      }
    }
    return r;
  }
}
