import 'f_rna.dart';

class UtilRNA {
  /// (en) Checks the given string for non-RNA characters.
  ///
  /// (ja) 与えられた文字列にRNAではない文字が無いかをチェックします。
  ///
  /// Return: char list.
  ///
  /// Throw: Invalid DNA string.
  static void checkBase(String rna) {
    for (int i = 0; i < rna.length; i++) {
      if (!FRNA.complementMap.containsKey(rna[i])) {
        throw Exception('Invalid RNA base: ${rna[i]}');
      }
    }
  }

  /// (en)Converts an input RNA sequence into a complementary strand sequence(RNA).
  ///
  /// (ja)入力 RNA 配列を相補鎖配列(RNA)に変換します。
  ///
  /// Throw: Invalid RNA string.
  static String complement(String rna) {
    String r = '';
    for (int i = 0; i < rna.length; i++) {
      r += FRNA.complementMap[rna[i]]!;
    }
    return r;
  }

  /// (en)Converts an input RNA sequence into a complementary strand sequence(DNA).
  ///
  /// (ja)入力 RNA 配列を相補鎖配列(DNA)に変換します。
  ///
  /// Throw: Invalid RNA string.
  static String complementDNA(String rna) {
    String r = '';
    for (int i = 0; i < rna.length; i++) {
      r += FRNA.dnaComplementMap[rna[i]]!;
    }
    return r;
  }
}
