import 'package:nucleic_acid/nucleic_acid.dart';
import 'package:nucleic_acid/nucleotide/enum_nucleotide_sequence_direction.dart';
import 'package:nucleic_acid/nucleotide/enum_nucleotide_sequence_type.dart';

class NucleotideSequence {
  static const String className = 'NucleotideSequence';
  static const String version = '1';

  late List<Nucleotide> sequence = [];
  EnumNucleotideSequenceType type;
  EnumNucleotideSequenceDirection direction;
  String? description;
  Map<String, dynamic>? info;

  /// * [seqStr] : The base sequence. Only lowercase letters are allowed.
  /// Give the result of running toLowerCase() if it contains uppercase letters.
  /// * [type] : DNA or RNA.
  /// * [direction] : sequence direction. 5'to3' or 3'to5'.
  /// This value is reversed for complemented objects.
  /// * [description] : The description of this sequence.
  /// * [info] : Other information of this sequence.
  NucleotideSequence(String seqStr,
      {this.type = EnumNucleotideSequenceType.dna,
      this.direction = EnumNucleotideSequenceDirection.fiveToThree,
      this.description,
      this.info}) {
    for (String baseName in seqStr.split('')) {
      sequence.add(Nucleotide(EnumBase.values.byName(baseName)));
    }
  }

  /// Generate from sequence data.
  NucleotideSequence.fromSeq(this.sequence,
      {this.type = EnumNucleotideSequenceType.dna,
      this.direction = EnumNucleotideSequenceDirection.fiveToThree,
      this.description,
      this.info});

  /// deep copy.
  NucleotideSequence deepCopy() {
    List<Nucleotide> copySeq = [];
    for (Nucleotide i in sequence) {
      copySeq.add(i.deepCopy());
    }
    return NucleotideSequence.fromSeq(copySeq,
        type: type,
        direction: direction,
        description: description,
        info: info != null ? {...info!} : null);
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
    d['type'] = type.name;
    d['direction'] = direction.name;
    d['description'] = description;
    d['info'] = info;
    return d;
  }

  /// resume map.
  static NucleotideSequence fromDict(Map<String, dynamic> src) {
    NucleotideSequence r = NucleotideSequence("",
        type: EnumNucleotideSequenceType.values.byName(src['type']),
        direction:
            EnumNucleotideSequenceDirection.values.byName(src['direction']),
        description: src['description'],
        info: src['info']);
    List<Nucleotide> seq = [];
    for (final i in src['sequence']) {
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

  /// (en) Get the complementary sequence.
  ///
  /// (ja) Get the complementary sequence.
  /// * [type] : return sequence type. DNA or RNA.
  NucleotideSequence complemented(EnumNucleotideSequenceType type) {
    List<Nucleotide> rSeq = [];
    for (Nucleotide i in sequence) {
      rSeq.add(i.complemented(type));
    }
    return NucleotideSequence.fromSeq(rSeq,
        type: type, direction: direction.reversed());
  }

  /// (en) Reverses the order of bases in this NucleotideSequence.
  ///
  /// (ja) このNucleotideSequenceの塩基の順序を反転します。
  void reverse() {
    sequence = sequence.reversed.toList();
    direction = direction.reversed();
  }

  ///　(en) Gets a new reversed NucleotideSequence.
  ///
  /// (ja) 反転した新しいNucleotideSequenceを取得します。
  NucleotideSequence reversed() {
    NucleotideSequence r = deepCopy();
    r.sequence = r.sequence.reversed.toList();
    r.direction = r.direction.reversed();
    return r;
  }
}
