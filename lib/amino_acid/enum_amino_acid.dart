// ignore_for_file: constant_identifier_names

import 'package:nucleic_acid/amino_acid/f_amino_acid.dart';
import 'package:nucleic_acid/amino_acid/util_amino_acid.dart';

enum EnumAminoAcid {
  Ala,
  Arg,
  Asn,
  Asp,
  Cys,
  Glu,
  Gln,
  Gly,
  His,
  Ile,
  Leu,
  Lys,
  Met,
  Phe,
  Pro,
  Ser,
  Thr,
  Trp,
  Tyr,
  Val,
}

extension EXTEnumAminoAcid on EnumAminoAcid {
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
