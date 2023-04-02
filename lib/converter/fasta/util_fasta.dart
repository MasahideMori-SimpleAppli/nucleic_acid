import 'dart:convert';

import '../../nucleotide/enum_nucleotide_sequence_type.dart';
import '../../nucleotide/nucleotide_sequence.dart';
import 'fasta_record.dart';

class UtilFasta {
  /// (en) The FASTA file data is converted into NucleotideSequence for each record and returned.
  ///
  /// (ja) FASTAファイルのデータを各レコード単位でNucleotideSequenceに変換して返却します。
  ///
  /// * [fastaData] : Passes the contents of the FASTA file as a String.
  /// * [type] : DNA or RNA.
  static List<NucleotideSequence> read(String fastaData,
      {EnumNucleotideSequenceType type = EnumNucleotideSequenceType.dna}) {
    List<String> lines = LineSplitter.split(fastaData).toList();

    List<NucleotideSequence> r = [];
    String? nowDesc;
    StringBuffer nowSeq = StringBuffer();

    for (String line in lines) {
      if (line.startsWith('>')) {
        if (nowDesc != null && nowSeq.isNotEmpty) {
          r.add(NucleotideSequence(nowSeq.toString().toLowerCase(),
              type: type, info: {"description": nowDesc}));
          nowSeq.clear();
        }
        nowDesc = line.substring(1);
      } else {
        nowSeq.write(line);
      }
    }

    if (nowDesc != null && nowSeq.isNotEmpty) {
      r.add(NucleotideSequence(nowSeq.toString().toLowerCase(),
          type: type, info: {"description": nowDesc}));
    }

    return r;
  }

  /// (en) The FASTA file data is converted into a class for each record and returned.
  /// It is convenient to use this when you want to operate the array data as String type.
  ///
  /// (ja) FASTAファイルのデータを各レコード単位でクラスに変換して返却します。
  /// 配列データをString型のままで操作したい場合はこれを利用すると便利です。
  ///
  /// * [fastaData] : Passes the contents of the FASTA file as a String.
  static List<FastaRecord> readByFastaRecord(String fastaData) {
    List<String> lines = LineSplitter.split(fastaData).toList();

    List<FastaRecord> r = [];
    String? nowDesc;
    StringBuffer nowSeq = StringBuffer();

    for (String line in lines) {
      if (line.startsWith('>')) {
        if (nowDesc != null && nowSeq.isNotEmpty) {
          r.add(FastaRecord(nowDesc, nowSeq.toString()));
          nowSeq.clear();
        }
        nowDesc = line.substring(1);
      } else {
        nowSeq.write(line);
      }
    }

    if (nowDesc != null && nowSeq.isNotEmpty) {
      r.add(FastaRecord(nowDesc, nowSeq.toString()));
    }

    return r;
  }

  /// (en) Convert from NucleotideSequence to FASTA file.
  ///
  /// (ja) NucleotideSequenceからFASTAファイルに変換します。
  ///
  /// * [seq] : NucleotideSequence class.
  /// * [description] : FASTA header description.
  static String write(NucleotideSequence seq, String description) {
    StringBuffer r = StringBuffer();
    r.write('>$description\n');
    r.write("${seq.toStr().toUpperCase()}\n");
    return r.toString();
  }

  /// (en) Convert from FastaRecord to FASTA file.
  ///
  /// (ja) FastaRecordからFASTAファイルに変換します。
  ///
  /// * [record] : FastaRecord class.
  static String writeFromFastaRecord(FastaRecord record) {
    return record.convertToFASTA();
  }
}
