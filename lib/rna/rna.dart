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

  /// (en)Converts an input RNA sequence into a complementary strand sequence(RNA).
  ///
  /// (ja)入力 RNA 配列を相補鎖配列(RNA)に変換します。
  static String complement(String rna) {
    String r = '';
    for (var i = 0; i < rna.length; i++) {
      var base = rna[i];
      if (complementMap.containsKey(base)) {
        r += complementMap[base]!;
      } else {
        throw Exception('Invalid RNA base: $base');
      }
    }
    return r;
  }

  /// (en)Converts an input RNA sequence into a complementary strand sequence(DNA).
  ///
  /// (ja)入力 RNA 配列を相補鎖配列(DNA)に変換します。
  static String complementDNA(String rna) {
    String r = '';
    for (var i = 0; i < rna.length; i++) {
      var base = rna[i];
      if (dnaComplementMap.containsKey(base)) {
        r += dnaComplementMap[base]!;
      } else {
        throw Exception('Invalid RNA base: $base');
      }
    }
    return r;
  }
}
