// ignore_for_file: constant_identifier_names

/// Some information was created with reference to:
/// https://www.ddbj.nig.ac.jp/ddbj/code.html
/// https://creativecommons.org/licenses/by/4.0/deed.ja

import 'package:nucleic_acid/amino_acid/f_amino_acid.dart';
import 'package:nucleic_acid/amino_acid/util_amino_acid.dart';

enum EnumAminoAcid {
  Ala,
  Arg,
  Asn,
  Asp,
  Cys,
  Gln,
  Glu,
  Gly,
  His,
  Ile,
  Leu,
  Lys,
  Met,
  Phe,
  Pro,
  Pyl,
  Ser,
  Sec,
  Thr,
  Trp,
  Tyr,
  Val,
  Asx,
  Glx,
  Xaa,
  Xle,
  Stop,
}

extension EXTEnumAminoAcid on EnumAminoAcid {
  /// Fuzzy Compare. return this == other.
  /// * [other] : The target for comparison.
  bool fuzzyComparison(EnumAminoAcid other) {
    if (this == EnumAminoAcid.Asp) {
      return other == EnumAminoAcid.Asp || other == EnumAminoAcid.Asx;
    } else if (this == EnumAminoAcid.Asn) {
      return other == EnumAminoAcid.Asn || other == EnumAminoAcid.Asx;
    } else if (this == EnumAminoAcid.Asx) {
      return other == EnumAminoAcid.Asp ||
          other == EnumAminoAcid.Asn ||
          other == EnumAminoAcid.Asx;
    } else if (this == EnumAminoAcid.Gln) {
      return other == EnumAminoAcid.Gln || other == EnumAminoAcid.Glx;
    } else if (this == EnumAminoAcid.Glu) {
      return other == EnumAminoAcid.Glu || other == EnumAminoAcid.Glx;
    } else if (this == EnumAminoAcid.Glx) {
      return other == EnumAminoAcid.Gln ||
          other == EnumAminoAcid.Glu ||
          other == EnumAminoAcid.Glx;
    } else if (this == EnumAminoAcid.Leu) {
      return other == EnumAminoAcid.Leu || other == EnumAminoAcid.Xle;
    } else if (this == EnumAminoAcid.Ile) {
      return other == EnumAminoAcid.Ile || other == EnumAminoAcid.Xle;
    } else if (this == EnumAminoAcid.Xle) {
      return other == EnumAminoAcid.Leu ||
          other == EnumAminoAcid.Ile ||
          other == EnumAminoAcid.Xle;
    } else if (this == EnumAminoAcid.Xaa || other == EnumAminoAcid.Xaa) {
      return true;
    } else {
      return this == other;
    }
  }

  /// Return: One-letter notation.
  String toOneStr() {
    return FAminoAcid.threeToOne[name]!;
  }

  /// Return: Three-letter notation.
  String toTripleStr() {
    return name;
  }

  /// Return: Full name.
  String toFullStr() {
    return FAminoAcid.threeToFull[name]!;
  }

  /// * [name] : one-letter notation.
  static EnumAminoAcid fromOneStr(String name) {
    return EnumAminoAcid.values.byName(FAminoAcid.oneToThree[name]!);
  }

  /// * [name] : Three-letter notation.
  static EnumAminoAcid fromTripleStr(String name) {
    return EnumAminoAcid.values.byName(name);
  }

  /// * [name] : Full name.
  static EnumAminoAcid fromFullStr(String name) {
    return EnumAminoAcid.values.byName(FAminoAcid.fullToThree[name]!);
  }

  /// * [name] : Japanese full name.
  static EnumAminoAcid fromJAStr(String name) {
    return EnumAminoAcid.values
        .byName(FAminoAcid.fullToThree[UtilAminoAcid.convertJA2EN(name)!]!);
  }
}
