import 'package:nucleic_acid/nucleotide/enum_nucleotide_sequence_type.dart';

import 'enum_base.dart';

class Nucleotide {
  static const String className = 'Nucleotide';
  static const String version = '1';
  EnumBase base;
  String? infoKey;

  /// * [base] : The base type.
  /// * [infoKey] : This nucleotide information key.
  /// The data are stored in nucleotide sequence classes and referenced by this key.
  Nucleotide(this.base, {this.infoKey});

  /// deep copy.
  Nucleotide deepCopy() {
    return Nucleotide(base, infoKey: infoKey);
  }

  /// to map.
  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['className'] = className;
    d['version'] = version;
    d['base'] = base.name;
    d['infoKey'] = infoKey;
    return d;
  }

  /// resume map.
  static Nucleotide fromDict(Map<String, dynamic> src) {
    return Nucleotide(EnumBase.values.byName(src['base']),
        infoKey: src['infoKey']);
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
  /// If infoKey is not null, throw exception.
  Nucleotide convertINSD() {
    if (infoKey != null) {
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
  Nucleotide complemented(EnumNucleotideSequenceType type) {
    if (type == EnumNucleotideSequenceType.dna) {
      return Nucleotide(base.complementDNA());
    } else {
      return Nucleotide(base.complementRNA());
    }
  }

  /// Get a new Nucleotide that converted type of DNA and RNA.
  /// * [type] : return base type. DNA or RNA.
  Nucleotide converted(EnumNucleotideSequenceType type) {
    return Nucleotide(base.converted(type));
  }
}
