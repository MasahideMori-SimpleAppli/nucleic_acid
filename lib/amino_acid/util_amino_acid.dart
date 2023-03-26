import 'package:nucleic_acid/nucleic_acid.dart';
import 'package:nucleic_acid/nucleotide/enum_nucleotide_sequence_type.dart';

import '../nucleotide/f_dna.dart';
import '../nucleotide/f_rna.dart';
import 'package:collection/collection.dart';

class UtilAminoAcid {
  /// (en) Convert full name to three-letter notation.
  ///
  /// (ja) フルネームのアミノ酸名から３文字表記に変換します。
  static String? convertFullToThree(String aminoAcidFullName) {
    return FAminoAcid.fullToThree[aminoAcidFullName];
  }

  /// (en) Convert full name to one-letter notation.
  ///
  /// (ja) フルネームのアミノ酸名から１文字表記に変換します。
  static String? convertFullToOne(String aminoAcidFullName) {
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
  static String? convertEN2JA(String aminoAcidFullNameEN) {
    return FAminoAcid.enFullToJaFull[aminoAcidFullNameEN];
  }

  /// (en) Convert japanese full name to english full name.
  ///
  /// (ja)日本語のアミノ酸名から英語のフルネーム表記に変換します。
  static String? convertJA2EN(String aminoAcidFullNameJA) {
    return FAminoAcid.jaFullToEnFull[aminoAcidFullNameJA];
  }

  /// (en) Convert base sequence to amino acid sequence.
  /// Note that start codons, stop codons,
  /// and invalid sequences must be filtered out before passing.
  /// Also, a, t(u), g, and c bases can be used.
  ///
  /// (ja) 塩基配列からアミノ酸配列に変換します。
  /// 注意点として、開始コドン、終止コドン、無効な配列は除外してから渡す必要があります。
  /// また、塩基はa,t(u),g,cのいずれかしか利用できません。
  ///
  /// * [seq] : The sequence.
  ///
  /// Throw:　When ambiguous bases are included.
  static List<AminoAcid> convertAminoAcidList(NucleotideSequence seq) {
    final triplet = seq.sequence.slices(3);
    List<AminoAcid> r = [];
    for (List<Nucleotide> i in triplet) {
      String codon = "";
      for (Nucleotide j in i) {
        codon += j.base.name;
      }
      if (seq.type == EnumNucleotideSequenceType.rna) {
        r.add(AminoAcid(FRNA.toAminoAcids[codon]!));
      } else {
        r.add(AminoAcid(FDNA.toAminoAcids[codon]!));
      }
    }
    return r;
  }
}
