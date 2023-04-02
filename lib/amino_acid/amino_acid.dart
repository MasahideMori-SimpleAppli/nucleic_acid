import 'package:nucleic_acid/amino_acid/enum_amino_acid.dart';

class AminoAcid {
  static const String className = 'AminoAcid';
  static const String version = '1';
  EnumAminoAcid type;
  String? infoKey;

  /// * [type] : The amino acid type.
  /// * [infoKey] : This amino acid information key.
  /// The data are stored in amino acid sequence classes and referenced by this key.
  AminoAcid(this.type, {this.infoKey});

  /// deep copy.
  AminoAcid deepCopy() {
    return AminoAcid(type, infoKey: infoKey);
  }

  /// to map.
  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['className'] = className;
    d['version'] = version;
    d['type'] = type.name;
    d['infoKey'] = infoKey;
    return d;
  }

  /// resume map.
  static AminoAcid fromDict(Map<String, dynamic> src) {
    return AminoAcid(EnumAminoAcid.values.byName(src['type']),
        infoKey: src['infoKey']);
  }
}
