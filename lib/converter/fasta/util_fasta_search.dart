import 'fasta_record.dart';

class UtilFastaSearch {
  /// (en) Returns a list of the indices of the beginning of the pattern where the specified pattern occurs.
  ///
  /// (ja) 指定したパターンが出現する、パターンの先頭のインデックスをリストで返します。
  /// * [record] : FASTA data.
  /// * [target] : The target pattern.
  static List<int> getPositions(FastaRecord record, String target) {
    List<int> r = [];
    for (int i = 0; i <= record.length() - target.length; i++) {
      if (record.seq.substring(i, i + target.length) == target) {
        r.add(i);
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
  /// Value must be 2 or greater.
  ///
  /// Returns : [[repeatStartPosition, repeatEndPosition],...]
  static List<List<int>> tandemRepeat(
      FastaRecord record, int unitLen, int minRepeat) {
    List<List<int>> r = [];
    late String pattern;
    for (int i = 0; i <= record.length() - unitLen * minRepeat; i++) {
      pattern = record.seq.substring(i, i + unitLen);
      int repeatCount = 0;
      for (int j = 1; j * unitLen + i <= record.length() - unitLen; j++) {
        if (record.seq.substring(i + j * unitLen, i + (j + 1) * unitLen) ==
            pattern) {
          repeatCount++;
        } else {
          break;
        }
      }
      if (repeatCount >= minRepeat - 1) {
        r.add([i, i + unitLen * (repeatCount + 1)]);
      }
    }
    return r;
  }
}
