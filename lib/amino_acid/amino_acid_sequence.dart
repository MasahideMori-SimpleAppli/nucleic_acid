import 'package:nucleic_acid/nucleic_acid.dart';

class AminoAcidSequence {
  static const String className = 'AminoAcidSequence';
  static const String version = '1';

  late List<AminoAcid> sequence = [];

  // N末端->C末端か、C末端->N末端。
  late EnumAminoAcidSequenceDirection direction;
  String? description;
  Map<String, dynamic>? info;

  /// * [seq] : The mRNA sequence.
  /// * [direction] : sequence direction. 5'to3' or 3'to5' for mRNA sequence.
  /// This value is reversed for complemented objects.
  /// * [description] : The description of this sequence.
  /// * [info] : Other information of this sequence.
  AminoAcidSequence(NucleotideSequence seq, {this.description, this.info}) {
    sequence = UtilAminoAcid.convertAminoAcidList(seq);
    if (seq.direction == EnumNucleotideSequenceDirection.fiveToThree) {
      direction = EnumAminoAcidSequenceDirection.nToC;
    } else {
      direction = EnumAminoAcidSequenceDirection.cToN;
    }
  }

  /// Generate from sequence data.
  AminoAcidSequence.fromSeq(this.sequence,
      {this.direction = EnumAminoAcidSequenceDirection.nToC,
      this.description,
      this.info});

  /// deep copy.
  AminoAcidSequence deepCopy() {
    List<AminoAcid> copySeq = [];
    for (AminoAcid i in sequence) {
      copySeq.add(i.deepCopy());
    }
    return AminoAcidSequence.fromSeq(copySeq,
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
    for (AminoAcid i in sequence) {
      seqList.add(i.toDict());
    }
    d['sequence'] = seqList;
    d['direction'] = direction.name;
    d['description'] = description;
    d['info'] = info;
    return d;
  }

  /// resume map.
  static AminoAcidSequence fromDict(Map<String, dynamic> src) {
    AminoAcidSequence r = AminoAcidSequence.fromSeq([],
        direction:
            EnumAminoAcidSequenceDirection.values.byName(src['direction']),
        description: src['description'],
        info: src['info']);
    List<AminoAcid> seq = [];
    for (final i in src['sequence']) {
      seq.add(AminoAcid.fromDict(i));
    }
    r.sequence = seq;
    return r;
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
  AminoAcidSequence reversed() {
    AminoAcidSequence r = deepCopy();
    r.sequence = r.sequence.reversed.toList();
    r.direction = r.direction.reversed();
    return r;
  }

  /// (en) Returns text written in single letter(uppercase letter) notation.
  ///
  /// (ja) 一文字表記（英大文字）で記述したテキストを返します。
  String toStr() {
    String r = "";
    for (final i in sequence) {
      r += i.type.toOneStr();
    }
    return r;
  }
}
