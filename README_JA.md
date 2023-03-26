# nucleic_acid

## 概要
これは核酸の分析支援のためのパッケージです。
基本的に科学者の利用を想定しています。

## 使い方
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

```

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