import 'package:nucleic_acid/amino_acid/f_amino_acid.dart';

class UtilAminoAcid {
  /// (en) Convert full name to three-letter notation.
  ///
  /// (ja) フルネームのアミノ酸名から３文字表記に変換します。
  static String? convertThree(String aminoAcidFullName) {
    return FAminoAcid.fullToThree[aminoAcidFullName];
  }

  /// (en) Convert full name to one-letter notation.
  ///
  /// (ja) フルネームのアミノ酸名から１文字表記に変換します。
  static String? convertOne(String aminoAcidFullName) {
    return FAminoAcid.fullToOne[aminoAcidFullName];
  }

  /// (en) Convert three-letter notation to full name.
  ///
  /// (ja) ３文字表記のアミノ酸名からフルネームに変換します。
  static String? convertThreeToFull(String threeLetterNotation) {
    return FAminoAcid.threeToFull[threeLetterNotation];
  }

  /// (en) Convert three-letter notation to one-letter notation.
  ///
  /// (ja) ３文字表記のアミノ酸名から１文字表記に変換します。
  static String? convertThreeToOne(String threeLetterNotation) {
    return FAminoAcid.threeToOne[threeLetterNotation];
  }

  /// (en) Convert one-letter notation to full name.
  ///
  /// (ja) １文字表記のアミノ酸名からフルネームに変換します。
  static String? convertOneToFull(String oneLetterNotation) {
    return FAminoAcid.oneToFull[oneLetterNotation];
  }

  /// (en) Convert one-letter notation to three-letter notation.
  ///
  /// (ja) １文字表記のアミノ酸名からフルネームに変換します。
  static String? convertOneToThree(String oneLetterNotation) {
    return FAminoAcid.oneToThree[oneLetterNotation];
  }

  /// (en) Convert english full name to japanese full name.
  ///
  /// (ja)フルネームの英語のアミノ酸名から日本語表記に変換します。
  static String? convertJA2EN(String aminoAcidFullNameEN) {
    return FAminoAcid.enToJA[aminoAcidFullNameEN];
  }

  /// (en) Convert japanese full name to english full name.
  ///
  /// (ja)日本語のアミノ酸名から英語のフルネーム表記に変換します。
  static String? convertEN2JA(String aminoAcidFullNameJA) {
    return FAminoAcid.jaToEnFull[aminoAcidFullNameJA];
  }
}
