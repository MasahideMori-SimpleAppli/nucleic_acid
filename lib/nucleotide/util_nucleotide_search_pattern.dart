import 'package:nucleic_acid/nucleic_acid.dart';

class UtilNucleotideSearchPattern {
  /// (en) Returns a list of the indices of the beginning of the pattern where the specified pattern occurs.
  ///
  /// (ja) 指定したパターンが出現する、パターンの先頭のインデックスをリストで返します。
  /// * [seq] : The sequence data.
  /// * [pattern] : The target pattern.
  /// If compareOnlyBase is false, nucleotideInfo must be a Map with the same key.
  /// * [compareOnlyBase] : If true, compare only Nucleotide Base.
  /// If false, compare also replacement decoration and anotherName.
  static List<int> getPositions(NucleotideSequence seq,
      NucleotideSequence pattern, bool compareOnlyBase) {
    List<int> r = [];
    for (int i = 0; i <= seq.length() - pattern.length(); i++) {
      if (compareOnlyBase) {
        if (UtilCompareNucleotide.compareBase(
            seq.subSeqNonInfo(i, i + pattern.length()), pattern)) {
          r.add(i);
        }
      } else {
        if (UtilCompareNucleotide.compare(
            seq.subSeq(i, i + pattern.length()), pattern)) {
          r.add(i);
        }
      }
    }
    return r;
  }

  /// (en) Returns a list of the indices of the beginning of the pattern where the specified pattern occurs.
  ///
  /// (ja) 指定したパターンが出現する、パターンの先頭のインデックスをリストで返します。
  /// * [record] : FASTA data.
  /// * [pattern] : The target pattern.
  static List<int> getPositionsInFastaRecord(
      FastaRecord record, String pattern) {
    List<int> r = [];
    for (int i = 0; i <= record.length() - pattern.length; i++) {
      if (record.seq.substring(i, i + pattern.length) == pattern) {
        r.add(i);
      }
    }
    return r;
  }
}
