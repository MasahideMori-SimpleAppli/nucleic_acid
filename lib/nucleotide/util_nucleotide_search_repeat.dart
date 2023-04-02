import '../converter/fasta/fasta_record.dart';
import 'nucleotide_sequence.dart';
import 'util_compare_nucleotide.dart';

class UtilNucleotideSearchRepeat {
  /// (en) Search for tandem repeats (short sequence repeats).
  ///
  /// (ja) タンデムリピート（短い配列の反復）を検索します。
  /// * [seq] : Sequence data.
  /// * [unitLen] : The length of the arrays that make up the repeats.
  /// * [minRepeat] : Specifies the minimum number of iterations to find.
  /// * [compareOnlyBase] : If true, compare only Nucleotide Base.
  /// If false, compare also replacement decoration and anotherName.
  ///
  /// Returns : [[repeatStartPosition, repeatEndPosition],...]
  static List<List<int>> tandemRepeat(NucleotideSequence seq, int unitLen,
      int minRepeat, bool compareOnlyBase) {
    List<List<int>> r = [];
    late NucleotideSequence pattern;
    for (int i = 0; i <= seq.length() - unitLen * minRepeat; i++) {
      int repeatCount = 0;
      for (int j = 1; j * unitLen + i <= seq.length() - unitLen; j++) {
        if (compareOnlyBase) {
          pattern = seq.subSeqNonInfo(i, i + unitLen);
          if (UtilCompareNucleotide.compareBase(
              seq.subSeqNonInfo(i + j * unitLen, i + (j + 1) * unitLen),
              pattern)) {
            repeatCount++;
          } else {
            break;
          }
        } else {
          pattern = seq.subSeq(i, i + unitLen);
          if (UtilCompareNucleotide.compare(
              seq.subSeq(i + j * unitLen, i + (j + 1) * unitLen), pattern)) {
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

  /// (en) Search for tandem repeats (short sequence repeats).
  ///
  /// (ja) タンデムリピート（短い配列の反復）を検索します。
  /// * [seq] : Sequence data.
  /// * [unitLen] : The length of the arrays that make up the repeats.
  /// * [minRepeat] : Specifies the minimum number of iterations to find.
  /// Value must be 2 or greater.
  ///
  /// Returns : [[repeatStartPosition, repeatEndPosition],...]
  static List<List<int>> tandemRepeatInFastaRecord(
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
