import 'package:nucleic_acid/amino_acid/enum_amino_acid.dart';

class AminoAcid {
  static const String className = 'AminoAcid';
  static const String version = '1';
  EnumAminoAcid type;
  Map<String, String>? decoration;
  Map<String, String>? replacement;

  /// * [type] : THe amino acid type.
  /// * [decoration] : Surface decoration. Key is target, Value is decorate object.
  /// There is no fixed format. Format is free.
  /// * [replacement] : Structure replacement information.
  /// Key is target, Value is replacement object.
  AminoAcid(this.type, {this.decoration, this.replacement});

  AminoAcid deepCopy() {
    return AminoAcid(type,
        decoration: decoration != null ? {...decoration!} : null,
        replacement: replacement != null ? {...replacement!} : null);
  }

  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['class_name'] = className;
    d['version'] = version;
    d['type'] = type;
    d['decoration'] = decoration;
    d['replacement'] = replacement;
    return d;
  }

  static AminoAcid fromDict(Map<String, dynamic> src) {
    return AminoAcid(src['type'],
        decoration: src['decoration'], replacement: src['replacement']);
  }
}
