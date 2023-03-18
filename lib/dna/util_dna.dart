import 'f_dna.dart';

class UtilDNA {
  /// (en) Checks the given string for non-DNA characters.
  ///
  /// (ja) 与えられた文字列にDNAではない文字が無いかをチェックします。
  ///
  /// Return: char list.
  ///
  /// Throw: Invalid DNA string.
  static void checkBase(String dna) {
    for (int i = 0; i < dna.length; i++) {
      if (!FDNA.complementMap.containsKey(dna[i])) {
        throw Exception('Invalid DNA base: ${dna[i]}');
      }
    }
  }

  /// (en)Converts an input DNA sequence into a complementary strand sequence(DNA).
  ///
  /// (ja)入力 DNA 配列を相補鎖配列(DNA)に変換します。
  static String complement(String dna) {
    String r = '';
    for (int i = 0; i < dna.length; i++) {
      r += FDNA.complementMap[dna[i]]!;
    }
    return r;
  }

  /// (en)Converts an input DNA sequence into a complementary strand sequence(RNA).
  ///
  /// (ja)入力 DNA 配列を相補鎖配列(RNA)に変換します。
  ///
  /// Throw: Invalid DNA string.
  static String complementRNA(String dna) {
    String r = '';
    for (int i = 0; i < dna.length; i++) {
      r += FDNA.rnaComplementMap[dna[i]]!;
    }
    return r;
  }

  /// (en)Gets the RNA sequence that results from the transcription of the input DNA sequence.
  ///
  /// (ja)入力 DNA 配列が転写された結果生成される RNA 配列を取得します。
  ///
  /// * [dna] : sense strand.
  ///
  /// Throw: Invalid DNA string.
  static String transcriptionFromSenseStrand(String dna) {
    String r = '';
    for (int i = 0; i < dna.length; i++) {
      r += FDNA.transcriptionMap[dna[i]]!;
    }
    return r;
  }

  /// (en)Gets the RNA sequence that results from the transcription of the input DNA sequence.
  ///
  /// (ja)入力 DNA 配列が転写された結果生成される RNA 配列を取得します。
  ///
  /// * [dna] : antisense strand.
  ///
  /// Throw: Invalid DNA string.
  static String transcriptionFromAntiSenseStrand(String dna) {
    String senseStrand = complement(dna);
    return transcriptionFromSenseStrand(senseStrand);
  }
}
