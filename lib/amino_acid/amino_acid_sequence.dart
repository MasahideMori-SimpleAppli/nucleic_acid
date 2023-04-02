import 'package:nucleic_acid/amino_acid/amino_acid_info.dart';
import 'package:nucleic_acid/nucleic_acid.dart';

class AminoAcidSequence {
  static const String className = 'AminoAcidSequence';
  static const String version = '1';

  late List<AminoAcid> sequence = [];

  // N末端->C末端か、C末端->N末端。
  late EnumAminoAcidSequenceDirection direction;
  String? description;
  Map<String, dynamic>? info;
  Map<String, AminoAcidInfo>? aminoAcidInfo;

  /// * [seq] : The mRNA sequence.
  /// * [direction] : sequence direction. 5'to3' or 3'to5' for mRNA sequence.
  /// This value is reversed for complemented objects.
  /// * [description] : The description of this sequence.
  /// * [info] : Other information of this sequence.
  /// * [aminoAcidInfo] : Reference for information by AminoAcid.
  AminoAcidSequence(NucleotideSequence seq,
      {this.description, this.info, this.aminoAcidInfo}) {
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
      this.info,
      this.aminoAcidInfo});

  /// deep copy.
  AminoAcidSequence deepCopy() {
    List<AminoAcid> copySeq = [];
    for (AminoAcid i in sequence) {
      copySeq.add(i.deepCopy());
    }
    Map<String, AminoAcidInfo>? copyAAInfo;
    if (aminoAcidInfo != null) {
      copyAAInfo = {};
      for (String i in aminoAcidInfo!.keys) {
        copyAAInfo[i] = aminoAcidInfo![i]!.deepCopy();
      }
    }
    return AminoAcidSequence.fromSeq(copySeq,
        direction: direction,
        description: description,
        info: info != null ? {...info!} : null,
        aminoAcidInfo: copyAAInfo);
  }

  /// to map.
  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['className'] = className;
    d['version'] = version;
    List<Map<String, dynamic>> seqList = [];
    for (AminoAcid i in sequence) {
      seqList.add(i.toDict());
    }
    d['sequence'] = seqList;
    d['direction'] = direction.name;
    d['description'] = description;
    d['info'] = info;
    Map<String, Map<String, dynamic>>? saveAAInfo;
    if (aminoAcidInfo != null) {
      saveAAInfo = {};
      for (String i in aminoAcidInfo!.keys) {
        saveAAInfo[i] = aminoAcidInfo![i]!.toDict();
      }
    }
    d['aminoAcidInfo'] = saveAAInfo;
    return d;
  }

  /// resume map.
  static AminoAcidSequence fromDict(Map<String, dynamic> src) {
    Map<String, AminoAcidInfo>? loadAAInfo;
    if (src['aminoAcidInfo'] != null) {
      loadAAInfo = {};
      for (String i in (src['aminoAcidInfo'] as Map).keys) {
        loadAAInfo[i] = AminoAcidInfo.fromDict(src['aminoAcidInfo'][i]);
      }
    }
    AminoAcidSequence r = AminoAcidSequence.fromSeq([],
        direction:
            EnumAminoAcidSequenceDirection.values.byName(src['direction']),
        description: src['description'],
        info: src['info'],
        aminoAcidInfo: loadAAInfo);
    List<AminoAcid> seq = [];
    for (final i in src['sequence']) {
      seq.add(AminoAcid.fromDict(i));
    }
    r.sequence = seq;
    return r;
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
  AminoAcidSequence reversed() {
    AminoAcidSequence r = deepCopy();
    r.sequence = r.sequence.reversed.toList();
    r.direction = r.direction.reversed();
    return r;
  }

  /// (en) Returns text written in single letter(uppercase letter) notation.
  /// Direction is not considered.
  ///
  /// (ja) 一文字表記（英大文字）で記述したテキストを返します。方向は考慮されません。
  String toStr() {
    String r = "";
    for (final i in sequence) {
      r += i.type.toOneStr();
    }
    return r;
  }

  ///　(en) Get a partial sequence. Data other than sequence are copied.
  ///
  /// (ja) 部分的なシーケンスを取得します。sequence以外のデータについてはコピーされます。
  /// * [startIndex] : Copy start index.
  /// * [endIndex] : Copy end index. Works the same as list.sublist.
  AminoAcidSequence subSeq(int startIndex, [int? endIndex]) {
    List<AminoAcid> copySeq = [];
    for (AminoAcid i in sequence.sublist(startIndex, endIndex)) {
      copySeq.add(i.deepCopy());
    }
    Map<String, AminoAcidInfo>? copyAAInfo;
    if (aminoAcidInfo != null) {
      copyAAInfo = {};
      for (String i in aminoAcidInfo!.keys) {
        copyAAInfo[i] = aminoAcidInfo![i]!.deepCopy();
      }
    }
    return AminoAcidSequence.fromSeq(copySeq,
        direction: direction,
        description: description,
        info: info != null ? {...info!} : null,
        aminoAcidInfo: copyAAInfo);
  }

  ///　(en) Get a partial sequence. Data other than sequence are not copied.
  /// Use this when speed is a priority.
  /// return info and aminoAcidInfo will be null.
  ///
  /// (ja) 部分的なシーケンスを取得します。sequence以外のデータについてはコピーされません。
  /// これは速度が優先される場合に利用します。
  /// 戻り値のinfoとaminoAcidInfoはnullになります。
  /// * [startIndex] : Copy start index.
  /// * [endIndex] : Copy end index. Works the same as list.sublist.
  AminoAcidSequence subSeqNonInfo(int startIndex, [int? endIndex]) {
    List<AminoAcid> copySeq = [];
    for (AminoAcid i in sequence.sublist(startIndex, endIndex)) {
      copySeq.add(i.deepCopy());
    }
    return AminoAcidSequence.fromSeq(copySeq,
        direction: direction,
        description: description,
        info: null,
        aminoAcidInfo: null);
  }

  /// (en) Combines this AminoAcidSequence with another AminoAcidSequence.
  ///
  /// (ja) このAminoAcidSequenceに別のAminoAcidSequenceを結合します。
  /// * [seq] : The other sequence.
  /// * [useDirection] : If true, The direction is taken into account,
  /// if it's the opposite direction, it flips the other array and then joins it.
  void add(AminoAcidSequence seq, {bool useDirection = true}) {
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

  AminoAcidSequence operator +(AminoAcidSequence seq) {
    AminoAcidSequence r = deepCopy();
    r.add(seq, useDirection: false);
    return r;
  }
}
