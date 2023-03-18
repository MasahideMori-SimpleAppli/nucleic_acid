import 'package:nucleic_acid/amino_acid/f_amino_acid.dart';

enum EnumAminoAcid {
  A,
  R,
  N,
  D,
  C,
  E,
  Q,
  G,
  H,
  I,
  L,
  K,
  M,
  F,
  P,
  S,
  T,
  W,
  Y,
  V
}

extension EXTEnumAminoAcid on EnumAminoAcid {
  /// Return: One-letter notation.
  String toStr() {
    return name;
  }

  /// Return: Three-letter notation.
  String toTripleStr() {
    return FAminoAcid.oneToThree[name]!;
  }

  /// Return: Full name.
  String toFullStr() {
    return FAminoAcid.oneToFull[name]!;
  }

  /// * [name] : one-letter notation.
  static EnumAminoAcid fromStr(String name) {
    return EnumAminoAcid.values.byName(name);
  }

  /// * [name] : Three-letter notation.
  static EnumAminoAcid fromTripleStr(String name) {
    return EnumAminoAcid.values.byName(FAminoAcid.threeToOne[name]!);
  }

  /// * [name] : Full name.
  static EnumAminoAcid fromFullStr(String name) {
    return EnumAminoAcid.values.byName(FAminoAcid.fullToOne[name]!);
  }
}
