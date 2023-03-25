import 'package:nucleic_acid/nucleic_acid.dart';

class NucleotideSequence {
  static const String className = 'NucleotideSequence';
  static const String version = '1';

  late List<Nucleotide> sequence = [];
  String? description;
  Map<String, dynamic>? info;

  /// * [seqStr] : The base sequence. Only lowercase letters are allowed.
  /// Give the result of running toLowerCase() if it contains uppercase letters.
  /// * [description] : The description of this sequence.
  /// * [info] : Other information of this sequence.
  NucleotideSequence(String seqStr, {this.description, this.info}) {
    for (String baseName in seqStr.split('')) {
      sequence.add(Nucleotide(EnumBase.values.byName(baseName)));
    }
  }

  /// This is copy constructor called in deepCopy.
  NucleotideSequence.copy(this.sequence, {this.description, this.info});

  /// deep copy.
  NucleotideSequence deepCopy() {
    List<Nucleotide> copySeq = [];
    for (Nucleotide i in sequence) {
      copySeq.add(i.deepCopy());
    }
    return NucleotideSequence.copy(copySeq,
        description: description, info: info != null ? {...info!} : null);
  }

  /// to map.
  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['class_name'] = className;
    d['version'] = version;
    List<Map<String, dynamic>> seqList = [];
    for (Nucleotide i in sequence) {
      seqList.add(i.toDict());
    }
    d['sequence'] = seqList;
    d['description'] = description;
    d['info'] = info;
    return d;
  }

  /// resume map.
  static NucleotideSequence fromDict(Map<String, dynamic> src) {
    NucleotideSequence r = NucleotideSequence("", description: src['description'], info: src['info']);
    List<Nucleotide> seq = [];
    for(final i in src['sequence']){
      seq.add(Nucleotide.fromDict(i));
    }
    r.sequence = seq;
    return r;
  }

  int length() {
    return sequence.length;
  }

  String toStr() {
    String r = "";
    for (Nucleotide i in sequence) {
      r += i.base.name;
    }
    return r;
  }
}
