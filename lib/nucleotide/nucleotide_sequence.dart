import 'package:nucleic_acid/nucleic_acid.dart';

class NucleotideSequence {
  static const String className = 'NucleotideSequence';
  static const String version = '1';

  late List<Nucleotide> sequence = [];
  EnumNucleotideSequenceType type;
  EnumNucleotideSequenceDirection direction;
  String? id;
  String? description;
  Map<String, dynamic>? info;
  Map<String, NucleotideInfo>? nucleotideInfo;

  /// * [seqStr] : The base sequence. Only lowercase letters are allowed.
  /// Give the result of running toLowerCase() if it contains uppercase letters.
  /// * [type] : DNA or RNA.
  /// * [id] : This sequence id.
  /// * [direction] : sequence direction. 5'to3' or 3'to5'.
  /// This value is reversed for complemented objects.
  /// * [description] : The description of this sequence.
  /// * [info] : Other information of this sequence.
  /// * [nucleotideInfo] : Reference for information by nucleotide.
  NucleotideSequence(String seqStr,
      {this.type = EnumNucleotideSequenceType.dna,
      this.id,
      this.direction = EnumNucleotideSequenceDirection.fiveToThree,
      this.description,
      this.info,
      this.nucleotideInfo}) {
    for (String baseName in seqStr.split('')) {
      sequence.add(Nucleotide(EnumBase.values.byName(baseName)));
    }
  }

  /// Generate from sequence data.
  NucleotideSequence.fromSeq(this.sequence,
      {this.type = EnumNucleotideSequenceType.dna,
      this.id,
      this.direction = EnumNucleotideSequenceDirection.fiveToThree,
      this.description,
      this.info,
      this.nucleotideInfo});

  /// deep copy.
  NucleotideSequence deepCopy() {
    List<Nucleotide> copySeq = [];
    for (Nucleotide i in sequence) {
      copySeq.add(i.deepCopy());
    }
    Map<String, NucleotideInfo>? copyNInfo;
    if (nucleotideInfo != null) {
      copyNInfo = {};
      for (String i in nucleotideInfo!.keys) {
        copyNInfo[i] = nucleotideInfo![i]!.deepCopy();
      }
    }
    return NucleotideSequence.fromSeq(copySeq,
        type: type,
        id: id,
        direction: direction,
        description: description,
        info: info != null ? {...info!} : null,
        nucleotideInfo: copyNInfo);
  }

  /// to map.
  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['className'] = className;
    d['version'] = version;
    List<Map<String, dynamic>> seqList = [];
    for (Nucleotide i in sequence) {
      seqList.add(i.toDict());
    }
    d['sequence'] = seqList;
    d['type'] = type.name;
    d['id'] = id;
    d['direction'] = direction.name;
    d['description'] = description;
    d['info'] = info;
    Map<String, Map<String, dynamic>>? saveNInfo;
    if (nucleotideInfo != null) {
      saveNInfo = {};
      for (String i in nucleotideInfo!.keys) {
        saveNInfo[i] = nucleotideInfo![i]!.toDict();
      }
    }
    d['nucleotideInfo'] = saveNInfo;
    return d;
  }

  /// resume map.
  static NucleotideSequence fromDict(Map<String, dynamic> src) {
    Map<String, NucleotideInfo>? loadNInfo;
    if (src['nucleotideInfo'] != null) {
      loadNInfo = {};
      for (String i in (src['nucleotideInfo'] as Map).keys) {
        loadNInfo[i] = NucleotideInfo.fromDict(src['nucleotideInfo'][i]);
      }
    }
    NucleotideSequence r = NucleotideSequence("",
        type: EnumNucleotideSequenceType.values.byName(src['type']),
        id: src['id'],
        direction:
            EnumNucleotideSequenceDirection.values.byName(src['direction']),
        description: src['description'],
        info: src['info'],
        nucleotideInfo: loadNInfo);
    List<Nucleotide> seq = [];
    for (final i in src['sequence']) {
      seq.add(Nucleotide.fromDict(i));
    }
    r.sequence = seq;
    return r;
  }

  /// Return sequence length.
  int length() {
    return sequence.length;
  }

  /// (en)　It converts to a character string with only the base sequence(lowercase letter) and returns it.
  /// Direction is not considered.
  ///
  /// (ja) 塩基配列だけの文字列（英小文字）に変換して返します。方向は考慮されません。
  String toStr() {
    String r = "";
    for (Nucleotide i in sequence) {
      r += i.base.name;
    }
    return r;
  }

  /// (en) Gets a new array whose type has been converted.
  /// Orientation does not change.
  /// Also, nucleotideInfo is returned as empty.
  ///
  /// (ja) 型を変換した新しい配列を取得します。向きは変化しません。
  /// また、nucleotideInfoは空のものが返されます。
  /// * [type] : return sequence type. DNA or RNA.
  NucleotideSequence converted(EnumNucleotideSequenceType type) {
    List<Nucleotide> rSeq = [];
    for (Nucleotide i in sequence) {
      rSeq.add(i.converted(type));
    }
    return NucleotideSequence.fromSeq(rSeq, type: type, direction: direction);
  }

  /// (en) Get the complementary sequence.
  /// Also, nucleotideInfo is returned as empty.
  ///
  /// (ja) 相補的な配列を取得します。
  /// また、nucleotideInfoは空のものが返されます。
  /// * [type] : return sequence type. DNA or RNA.
  NucleotideSequence complemented(EnumNucleotideSequenceType type) {
    List<Nucleotide> rSeq = [];
    for (Nucleotide i in sequence) {
      rSeq.add(i.complemented(type));
    }
    return NucleotideSequence.fromSeq(rSeq,
        type: type, direction: direction.reversed());
  }

  /// (en) Reverses the order of bases in this Sequence.
  ///
  /// (ja) このSequenceの塩基の順序を反転します。
  void reverse() {
    sequence = sequence.reversed.toList();
    direction = direction.reversed();
  }

  ///　(en) Gets a new reversed Sequence.
  ///
  /// (ja) 反転した新しいSequenceを取得します。
  NucleotideSequence reversed() {
    NucleotideSequence r = deepCopy();
    r.sequence = r.sequence.reversed.toList();
    r.direction = r.direction.reversed();
    return r;
  }

  ///　(en) Get a partial sequence. Data other than seq are copied.
  ///
  /// (ja) 部分的なシーケンスを取得します。seq以外のデータについてはコピーされます。
  /// * [startIndex] : Copy start index.
  /// * [endIndex] : Copy end index. Works the same as list.sublist.
  NucleotideSequence subSeq(int startIndex, [int? endIndex]) {
    List<Nucleotide> copySeq = [];
    for (Nucleotide i in sequence.sublist(startIndex, endIndex)) {
      copySeq.add(i.deepCopy());
    }
    Map<String, NucleotideInfo>? copyNInfo;
    if (nucleotideInfo != null) {
      copyNInfo = {};
      for (String i in nucleotideInfo!.keys) {
        copyNInfo[i] = nucleotideInfo![i]!.deepCopy();
      }
    }
    return NucleotideSequence.fromSeq(copySeq,
        type: type,
        id: id,
        direction: direction,
        description: description,
        info: info != null ? {...info!} : null,
        nucleotideInfo: copyNInfo);
  }

  ///　(en) Get a partial sequence. Data other than seq are not copied.
  /// Use this when speed is a priority.(e.g. UtilCompareNucleotide.compareBase)
  /// return info and nucleotideInfo will be null.
  ///
  /// (ja) 部分的なシーケンスを取得します。seq以外のデータについてはコピーされません。
  /// これは速度が優先される場合に利用します。(例： UtilCompareNucleotide.compareBase)
  /// 戻り値のinfoとnucleotideInfoはnullになります。
  /// * [startIndex] : Copy start index.
  /// * [endIndex] : Copy end index. Works the same as list.sublist.
  NucleotideSequence subSeqNonInfo(int startIndex, [int? endIndex]) {
    List<Nucleotide> copySeq = [];
    for (Nucleotide i in sequence.sublist(startIndex, endIndex)) {
      copySeq.add(i.deepCopy());
    }
    return NucleotideSequence.fromSeq(copySeq,
        type: type,
        id: id,
        direction: direction,
        description: description,
        info: null,
        nucleotideInfo: null);
  }

  /// (en) Combines this NucleotideSequence with another NucleotideSequence.
  ///
  /// (ja) このNucleotideSequenceに別のNucleotideSequenceを結合します。
  /// * [seq] : The other sequence.
  /// * [useDirection] : If true, The direction is taken into account,
  /// if it's the opposite direction, it flips the other array and then joins it.
  void add(NucleotideSequence seq, {bool useDirection = true}) {
    if (useDirection) {
      if ((direction == seq.direction)) {
        sequence.addAll(seq.sequence);
      } else {
        sequence.addAll(seq.sequence.reversed);
      }
    } else {
      sequence.addAll(seq.sequence);
    }
  }

  NucleotideSequence operator +(NucleotideSequence seq) {
    NucleotideSequence r = deepCopy();
    r.add(seq, useDirection: false);
    return r;
  }
}
