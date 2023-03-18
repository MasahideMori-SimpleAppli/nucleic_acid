import 'package:nucleic_acid/amino_acid/enum_amino_acid.dart';

class AminoAcid {
  static const String className = 'AminoAcid';
  static const String version = '1';
  EnumAminoAcid type;
  Map<String, String>? decoration;

  /// * [type] : THe amino acid type.
  /// * [decoration] : Surface decoration. Key is target, Value is decorate object.
  /// There is no fixed format. Format is free.
  AminoAcid(this.type, {this.decoration});

  AminoAcid deepCopy() {
    return AminoAcid(type,
        decoration: decoration != null ? {...decoration!} : null);
  }

  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['class_name'] = className;
    d['version'] = version;
    d['type'] = type;
    d['decoration'] = decoration;
    return d;
  }

  static AminoAcid fromDict(Map<String, dynamic> src) {
    return AminoAcid(src['type'], decoration: src['decoration']);
  }
}
