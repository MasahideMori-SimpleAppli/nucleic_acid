class RNA {
  static const Map<String, String> toAminoAcids = {
    'UUU': 'Phe',
    'UUC': 'Phe',
    'UUA': 'Leu',
    'UUG': 'Leu',
    'CUU': 'Leu',
    'CUC': 'Leu',
    'CUA': 'Leu',
    'CUG': 'Leu',
    'AUU': 'Ile',
    'AUC': 'Ile',
    'AUA': 'Ile',
    'AUG': 'Met',
    'GUU': 'Val',
    'GUC': 'Val',
    'GUA': 'Val',
    'GUG': 'Val',
    'UCU': 'Ser',
    'UCC': 'Ser',
    'UCA': 'Ser',
    'UCG': 'Ser',
    'CCU': 'Pro',
    'CCC': 'Pro',
    'CCA': 'Pro',
    'CCG': 'Pro',
    'ACU': 'Thr',
    'ACC': 'Thr',
    'ACA': 'Thr',
    'ACG': 'Thr',
    'GCU': 'Ala',
    'GCC': 'Ala',
    'GCA': 'Ala',
    'GCG': 'Ala',
    'UAU': 'Tyr',
    'UAC': 'Tyr',
    'UAA': 'Stop',
    'UAG': 'Stop',
    'CAU': 'His',
    'CAC': 'His',
    'CAA': 'Gln',
    'CAG': 'Gln',
    'AAU': 'Asn',
    'AAC': 'Asn',
    'AAA': 'Lys',
    'AAG': 'Lys',
    'GAU': 'Asp',
    'GAC': 'Asp',
    'GAA': 'Glu',
    'GAG': 'Glu',
    'UGU': 'Cys',
    'UGC': 'Cys',
    'UGA': 'Stop',
    'UGG': 'Trp',
    'CGU': 'Arg',
    'CGC': 'Arg',
    'CGA': 'Arg',
    'CGG': 'Arg',
    'AGU': 'Ser',
    'AGC': 'Ser',
    'AGA': 'Arg',
    'AGG': 'Arg',
    'GGU': 'Gly',
    'GGC': 'Gly',
    'GGA': 'Gly',
    'GGG': 'Gly',
  };

  static final Map<String, String> complementMap = {
    'A': 'U',
    'U': 'A',
    'C': 'G',
    'G': 'C'
  };

  static final Map<String, String> dnaComplementMap = {
    'A': 'T',
    'U': 'A',
    'C': 'G',
    'G': 'C'
  };

  /// (en) Checks the given string for non-RNA characters.
  ///
  /// (ja) 与えられた文字列にRNAではない文字が無いかをチェックします。
  ///
  /// Return: char list.
  ///
  /// Throw: Invalid DNA string.
  static void checkBase(String rna) {
    for (int i = 0; i < rna.length; i++) {
      if (!complementMap.containsKey(rna[i])) {
        throw Exception('Invalid RNA base: ${rna[i]}');
      }
    }
  }

  /// (en)Converts an input RNA sequence into a complementary strand sequence(RNA).
  ///
  /// (ja)入力 RNA 配列を相補鎖配列(RNA)に変換します。
  ///
  /// Throw: Invalid RNA string.
  static String complement(String rna) {
    String r = '';
    for (int i = 0; i < rna.length; i++) {
      r += complementMap[rna[i]]!;
    }
    return r;
  }

  /// (en)Converts an input RNA sequence into a complementary strand sequence(DNA).
  ///
  /// (ja)入力 RNA 配列を相補鎖配列(DNA)に変換します。
  ///
  /// Throw: Invalid RNA string.
  static String complementDNA(String rna) {
    String r = '';
    for (int i = 0; i < rna.length; i++) {
      r += dnaComplementMap[rna[i]]!;
    }
    return r;
  }
}
