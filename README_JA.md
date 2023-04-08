# nucleic_acid

## 概要
これは核酸の分析支援のためのパッケージです。
基本的に科学者の利用を想定しています。

## 使い方
### 基本操作
```dart

NucleotideSequence gene = NucleotideSequence("attgac");
NucleotideSequence templateDNA = gene.complemented(EnumNucleotideSequenceType.dna);

// 転写
NucleotideSequence mRNA = gene.converted(EnumNucleotideSequenceType.rna);
NucleotideSequence tRNA = mRNA.complemented(EnumNucleotideSequenceType.rna);

// 翻訳
AminoAcidSequence peptide = AminoAcidSequence(mRNA);

// 翻訳(DNAから直接アミノ酸配列に変換)
AminoAcidSequence peptideFromDNA = AminoAcidSequence(gene);

// 延長
// attgacattgac
NucleotideSequence gene2 = gene + gene;
// attgaccagtta
NucleotideSequence gene3 = gene + gene.reversed();
// attgacattgac
gene.add(gene.reversed(), useDirection: true);

// 複製
NucleotideSequence geneCopy = gene.deepCopy();

// 部分的な取り出し
NucleotideSequence gac = NucleotideSequence("attgac").subSeq(3);
```

### ファイル形式の変換
```dart
    // FASTA
    String fastaContent = '>sequence1\n';
    String seq1 = 'ATGCAGTAGCTAGCTACGT';
    fastaContent += "$seq1\n";
    fastaContent += '>sequence2\n';
    String seq2 = 'CGTAGCTAGCTAGCATCGT';
    fastaContent += "$seq2\n";
    List<NucleotideSequence> nSeq = UtilFasta.read(fastaContent);
    String reConvertFasta = UtilFasta.write(nSeq[0], "sequence1");
```


### 配列の検索
```dart
    // ecoRI の位置を探索します。
    final NucleotideSequence seq =
        NucleotideSequence('ATGAATTCAGAATTCTATATATATATACC'.toLowerCase());
    final NucleotideSequence ecoRI = NucleotideSequence('GAATTC'.toLowerCase());
    // 2 と 9 が得られます.
    List<int> ecoRIPositions = UtilNucleotideSearch.getPositions(seq, ecoRI, true);

    // 曖昧な検索も可能です。
    final NucleotideSequence fuzzyEcoRI = NucleotideSequence('GNMTTC'.toLowerCase());
    // 同様にecoRIPositions2[0] == 2, ecoRIPositions2[1] == 9 が得られます。
    List<int> ecoRIPositions2 = UtilNucleotideSearch.getPositions(seq, fuzzyEcoRI, true, fuzzyComp: true);
    
    // タンデムリピートの開始位置と終了位置を探索します。
    // tRepeat[0][0] = 15, tRepeat[0][1] = 27　が得られます。
    List<List<int>> tRepeats = UtilNucleotideSearch.tandemRepeat(seq, 2, 2, true);

    // AminoAcidSequenceでも同様のAPIが利用できます。
    AminoAcidSequence aaSeq = AminoAcidSequence.fromStr("MVWWLALALAANYY");
    AminoAcidSequence target = AminoAcidSequence.fromStr("LXLXLXXN");
    // tPositions[0] == 4 が得られます。
    List<int> tPositions = UtilAminoAcidSearch.getPositions(aaSeq, target, true, fuzzyComp: true);
```

## データ構造について (デコードされた状態)
このパッケージにおける基本的なデータ構造は以下の通りです。
- NucleotideSequence
  - sequence: List
    - nucleotide: Nucleotide
      - base: EnumBase, 塩基の種類。
      - infoKey: String?, 化学修飾などを考慮する場合に利用できる、nucleotideInfoのキー。
  - type: EnumNucleotideSequenceType, DNAまたはRNA。
  - direction: EnumNucleotideSequenceDirection, 配列の方向。
  - id: String?, このシーケンスの固有ID。
  - description: String?, このシーケンスの説明。
  - info: Map<String, dynamic>?, このシーケンスに関するその他の情報。
  - nucleotideInfo: Map<String, NucleotideInfo>?, このシーケンスのヌクレオチドについての詳細な情報の参照先。
    - key: String, Nucleotideが持つ参照用のキー。例えば、化学装飾された場合の別名など。
    - value: NucleotideInfo, Nucleotideに関する化学修飾などの情報。  
  
- AminoAcidSequence
  - sequence: List
    - nucleotide: AminoAcid
      - type: EnumAminoAcid, アミノ酸の種類。
      - infoKey: String?, 化学修飾などを考慮する場合に利用できる、aminoAcidInfoのキー。
  - direction: EnumAminoAcidSequenceDirection, 配列の方向。
  - id: String?, このシーケンスの固有ID。
  - description: String?, このシーケンスの説明。
  - info: Map<String, dynamic>?, このシーケンスに関するその他の情報。
  - aminoAcidInfo: Map<String, NucleotideInfo>?, このシーケンスのAminoAcidについての詳細な情報の参照先。
    - key: String, AminoAcidが持つ参照用のキー。例えば、化学装飾された場合の別名など。
    - value: AminoAcidInfo, AminoAcidに関する化学修飾などの情報。

## サポート
もし何らかの理由で有償のサポートが必要な場合は私の会社に問い合わせてください。  
このパッケージは私が個人で開発していますが、会社経由でサポートできる場合があります。  
[合同会社シンプルアプリ](https://simpleappli.com/index.html)

## バージョン管理について
それぞれ、Cの部分が変更されます。  
ただし、バージョン1.0.0未満は以下のルールに関係無くファイル構造が変化する場合があります。  
- 変数の追加など、以前のファイルの読み込み時に問題が起こったり、ファイルの構造が変わるような変更
  - C.X.X
- メソッドの追加など
  - X.C.X
- 軽微な変更やバグ修正
  - X.X.C

## ライセンス
このソフトウェアはMITライセンスの元配布されます。LICENSEファイルの内容をご覧ください。

## 著作権表示
The “Dart” name and “Flutter” name are trademarks of Google LLC.  
*The developer of this package is not Google LLC.