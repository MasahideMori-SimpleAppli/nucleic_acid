class NucleotideInfo {
  static const String className = 'NucleotideInfo';
  static const String version = '1';

  Map<String, String>? decoration;
  Map<String, String>? replacement;
  String? anotherName;

  /// * [decoration] : Surface decoration. Key is target, Value is decorate object.
  /// There is no fixed format. Format is free.
  /// * [replacement] : Structure replacement information.
  /// Key is target, Value is replacement object.
  /// * [anotherName] : The alias.
  NucleotideInfo({this.decoration, this.replacement, this.anotherName});

  /// deep copy.
  NucleotideInfo deepCopy() {
    return NucleotideInfo(
        decoration: decoration != null ? {...decoration!} : null,
        replacement: replacement != null ? {...replacement!} : null,
        anotherName: anotherName);
  }

  /// to map.
  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['className'] = className;
    d['version'] = version;
    d['decoration'] = decoration;
    d['replacement'] = replacement;
    d['anotherName'] = anotherName;
    return d;
  }

  /// resume map.
  static NucleotideInfo fromDict(Map<String, dynamic> src) {
    return NucleotideInfo(
        decoration: src['decoration'],
        replacement: src['replacement'],
        anotherName: src['anotherName']);
  }
}
