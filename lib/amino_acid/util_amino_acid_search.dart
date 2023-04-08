import 'package:nucleic_acid/amino_acid/amino_acid_all.dart';

class UtilAminoAcidSearch {
  /// (en) Returns a list of the indices of the beginning of the pattern where the specified pattern occurs.
  ///
  /// (ja) 指定したパターンが出現する、パターンの先頭のインデックスをリストで返します。
  /// * [seq] : The sequence data.
  /// * [target] : The target pattern.
  /// * [compareOnlyType] : If true, compare only AminoAcid Type.
  /// If false, compare also AminoAcid.infoKey.
  /// * [fuzzyComp] : If true, Can contain B,Z,X,J.
  static List<int> getPositions(
      AminoAcidSequence seq, AminoAcidSequence target, bool compareOnlyType,
      {bool fuzzyComp = false}) {
    List<int> r = [];
    for (int i = 0; i <= seq.length() - target.length(); i++) {
      if (compareOnlyType) {
        if (UtilCompareAminoAcid.compareType(
            seq.subSeqNonInfo(i, i + target.length()), target, fuzzyComp)) {
          r.add(i);
        }
      } else {
        if (UtilCompareAminoAcid.compare(
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
  /// * [compareOnlyBase] : If true, compare only AminoAcid.type.
  /// If false, compare also AminoAcid.infoKey.
  /// * [fuzzyComp] : If true, Can contain B,Z,X,J.
  ///
  /// Returns : [[repeatStartPosition, repeatEndPosition],...]
  static List<List<int>> tandemRepeat(
      AminoAcidSequence seq, int unitLen, int minRepeat, bool compareOnlyBase,
      {bool fuzzyComp = false}) {
    List<List<int>> r = [];
    late AminoAcidSequence pattern;
    for (int i = 0; i <= seq.length() - unitLen * minRepeat; i++) {
      int repeatCount = 0;
      for (int j = 1; j * unitLen + i <= seq.length() - unitLen; j++) {
        if (compareOnlyBase) {
          pattern = seq.subSeqNonInfo(i, i + unitLen);
          if (UtilCompareAminoAcid.compareType(
              seq.subSeqNonInfo(i + j * unitLen, i + (j + 1) * unitLen),
              pattern,
              fuzzyComp)) {
            repeatCount++;
          } else {
            break;
          }
        } else {
          pattern = seq.subSeq(i, i + unitLen);
          if (UtilCompareAminoAcid.compare(
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
