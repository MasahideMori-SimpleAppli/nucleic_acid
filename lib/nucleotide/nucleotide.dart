import 'package:nucleic_acid/nucleotide/enum_nucleotide_sequence_type.dart';

import 'enum_base.dart';

class Nucleotide {
  static const String className = 'Nucleotide';
  static const String version = '1';
  EnumBase base;
  Map<String, String>? decoration;
  Map<String, String>? replacement;
  String? anotherName;

  /// * [base] : The base type.
  /// * [decoration] : Surface decoration. Key is target, Value is decorate object.
  /// There is no fixed format. Format is free.
  /// * [replacement] : Structure replacement information.
  /// Key is target, Value is replacement object.
  /// * [anotherName] : The alias.
  Nucleotide(this.base, {this.decoration, this.replacement, this.anotherName});

  /// deep copy.
  Nucleotide deepCopy() {
    return Nucleotide(base,
        decoration: decoration != null ? {...decoration!} : null,
        replacement: replacement != null ? {...replacement!} : null,
        anotherName: anotherName);
  }

  /// to map.
  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['class_name'] = className;
    d['version'] = version;
    d['base'] = base.name;
    d['decoration'] = decoration;
    d['replacement'] = replacement;
    d['another_name'] = anotherName;
    return d;
  }

  /// resume map.
  static Nucleotide fromDict(Map<String, dynamic> src) {
    return Nucleotide(EnumBase.values.byName(src['base']),
        decoration: src['decoration'],
        replacement: src['replacement'],
        anotherName: src['another_name']);
  }

  /// If the base contained purine, return true.
  bool isPurine() {
    return base == EnumBase.a || base == EnumBase.g || base == EnumBase.r;
  }

  /// If the base contained pyrimidine, return true.
  bool isPyrimidine() {
    return base == EnumBase.c ||
        base == EnumBase.t ||
        base == EnumBase.u ||
        base == EnumBase.y;
  }

  /// If the base contained amino, return true.
  bool isAmino() {
    return base == EnumBase.a || base == EnumBase.c || base == EnumBase.m;
  }

  /// If the base contained keto, return true.
  bool isKeto() {
    return base == EnumBase.g || base == EnumBase.t || base == EnumBase.k;
  }

  /// Convert International Nucleotide Sequence Database code.
  /// Change EnumBase.u => EnumBase.t.
  /// If decoration, replacement, anotherName is not null, throw exception.
  Nucleotide convertINSD() {
    if (decoration != null || replacement != null || anotherName != null) {
      throw Exception("Converting structures is likely to cause problems.");
    } else {
      if (base == EnumBase.u) {
        return Nucleotide(EnumBase.t);
      } else {
        return deepCopy();
      }
    }
  }

  /// Convert to a new complementary base.
  /// * [type] : return base type. DNA or RNA.
  Nucleotide complemented(EnumNucleotideSequenceType type){
    if(type == EnumNucleotideSequenceType.dna) {
      return Nucleotide(base.complementDNA());
    }
    else{
      return Nucleotide(base.complementRNA());
    }
  }

}
