class AminoAcidInfo {
  static const String className = 'AminoAcidInfo';
  static const String version = '1';

  Map<String, String>? decoration;
  Map<String, String>? replacement;
  String? anotherName;

  /// * [decoration] : Surface decoration. Key is target, Value is decorate object.
  /// There is no fixed format. Format is free.
  /// * [replacement] : Structure replacement information.
  /// Key is target, Value is replacement object.
  /// * [anotherName] : The alias.
  AminoAcidInfo({this.decoration, this.replacement, this.anotherName});

  /// deep copy.
  AminoAcidInfo deepCopy() {
    return AminoAcidInfo(
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
  static AminoAcidInfo fromDict(Map<String, dynamic> src) {
    return AminoAcidInfo(
        decoration: src['decoration'],
        replacement: src['replacement'],
        anotherName: src['anotherName']);
  }
}
