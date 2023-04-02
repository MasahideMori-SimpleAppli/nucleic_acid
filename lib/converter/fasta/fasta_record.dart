import '../../nucleotide/enum_nucleotide_sequence_type.dart';
import '../../nucleotide/nucleotide_sequence.dart';

class FastaRecord {
  String description;
  String seq;

  /// (en) This class handles FASTA files based on strings.
  /// For more detailed operations,
  /// convert to NucleotideSequence with convertToNSeq method.
  ///
  /// (ja) 文字列ベースでFASTAファイルを扱うクラスです。
  /// より詳細な操作を行う場合、convertToNSeqでNucleotideSequenceに変換してください。
  /// * [description] : FASTA header description.
  /// * [seq] : Sequence data.
  FastaRecord(this.description, this.seq);

  /// (en) Convert seq string to NucleotideSequence class.
  ///
  /// (ja) seq文字列をNucleotideSequenceクラスに変換します。
  NucleotideSequence convertToNSeq(EnumNucleotideSequenceType type) {
    return NucleotideSequence(seq.toLowerCase(),
        type: type, info: {"description": description});
  }

  /// (en) Convert this class to FASTA string.
  ///
  /// (ja) このクラスのデータをFASTA形式の文字列に変換します。
  String convertToFASTA() {
    StringBuffer r = StringBuffer();
    r.write('>$description\n');
    r.write('$seq\n');
    return r.toString();
  }

  /// (en) Returns the length of the sequence.
  ///
  /// (ja) シーケンスの長さを返します。
  int length() {
    return seq.length;
  }
}
