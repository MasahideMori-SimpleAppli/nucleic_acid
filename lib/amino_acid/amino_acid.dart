import 'package:nucleic_acid/amino_acid/enum_amino_acid.dart';

class AminoAcid {
  static const String className = 'AminoAcid';
  static const String version = '1';
  EnumAminoAcid type;
  Map<String, String>? decoration;
  Map<String, String>? replacement;
  String? anotherName;

  /// * [type] : The amino acid type.
  /// * [decoration] : Surface decoration. Key is target, Value is decorate object.
  /// There is no fixed format. Format is free.
  /// * [replacement] : Structure replacement information.
  /// Key is target, Value is replacement object.
  /// * [anotherName] : If there is a defined name for an amino acid with
  /// some mutation added to a normal amino acid, it is convenient to describe it.
  AminoAcid(this.type, {this.decoration, this.replacement, this.anotherName});

  /// deep copy.
  AminoAcid deepCopy() {
    return AminoAcid(type,
        decoration: decoration != null ? {...decoration!} : null,
        replacement: replacement != null ? {...replacement!} : null,
        anotherName: anotherName);
  }

  /// to map.
  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['class_name'] = className;
    d['version'] = version;
    d['type'] = type.name;
    d['decoration'] = decoration;
    d['replacement'] = replacement;
    d['another_name'] = anotherName;
    return d;
  }

  /// resume map.
  static AminoAcid fromDict(Map<String, dynamic> src) {
    return AminoAcid(EnumAminoAcid.values.byName(src['type']),
        decoration: src['decoration'],
        replacement: src['replacement'],
        anotherName: src['another_name']);
  }
}
