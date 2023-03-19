import 'enum_base.dart';

class Base {
  static const String className = 'Base';
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
  /// * [anotherName] : If there is a defined name for an amino acid with
  /// some mutation added to a normal amino acid, it is convenient to describe it.
  Base(this.base, {this.decoration, this.replacement, this.anotherName});

  /// deep copy.
  Base deepCopy() {
    return Base(base,
        decoration: decoration != null ? {...decoration!} : null,
        replacement: replacement != null ? {...replacement!} : null,
        anotherName: anotherName);
  }

  /// to map.
  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['class_name'] = className;
    d['version'] = version;
    d['base'] = base;
    d['decoration'] = decoration;
    d['replacement'] = replacement;
    d['another_name'] = anotherName;
    return d;
  }

  /// resume map.
  static Base fromDict(Map<String, dynamic> src) {
    return Base(src['type'],
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
  Base convertINSD() {
    if (decoration != null || replacement != null || anotherName != null) {
      throw Exception("Converting structures is likely to cause problems.");
    } else {
      if (base == EnumBase.u) {
        return Base(EnumBase.t);
      } else {
        return deepCopy();
      }
    }
  }
}
