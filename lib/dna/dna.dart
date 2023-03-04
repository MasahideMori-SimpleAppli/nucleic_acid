class DNA {
  static const Map<String, String> toAminoAcids = {
    'TTT': 'Phe',
    'TTC': 'Phe',
    'TTA': 'Leu',
    'TTG': 'Leu',
    'CTT': 'Leu',
    'CTC': 'Leu',
    'CTA': 'Leu',
    'CTG': 'Leu',
    'ATT': 'Ile',
    'ATC': 'Ile',
    'ATA': 'Ile',
    'ATG': 'Met',
    'GTT': 'Val',
    'GTC': 'Val',
    'GTA': 'Val',
    'GTG': 'Val',
    'TCT': 'Ser',
    'TCC': 'Ser',
    'TCA': 'Ser',
    'TCG': 'Ser',
    'CCT': 'Pro',
    'CCC': 'Pro',
    'CCA': 'Pro',
    'CCG': 'Pro',
    'ACT': 'Thr',
    'ACC': 'Thr',
    'ACA': 'Thr',
    'ACG': 'Thr',
    'GCT': 'Ala',
    'GCC': 'Ala',
    'GCA': 'Ala',
    'GCG': 'Ala',
    'TAT': 'Tyr',
    'TAC': 'Tyr',
    'TAA': 'Stop',
    'TAG': 'Stop',
    'CAT': 'His',
    'CAC': 'His',
    'CAA': 'Gln',
    'CAG': 'Gln',
    'AAT': 'Asn',
    'AAC': 'Asn',
    'AAA': 'Lys',
    'AAG': 'Lys',
    'GAT': 'Asp',
    'GAC': 'Asp',
    'GAA': 'Glu',
    'GAG': 'Glu',
    'TGT': 'Cys',
    'TGC': 'Cys',
    'TGA': 'Stop',
    'TGG': 'Trp',
    'CGT': 'Arg',
    'CGC': 'Arg',
    'CGA': 'Arg',
    'CGG': 'Arg',
    'AGT': 'Ser',
    'AGC': 'Ser',
    'AGA': 'Arg',
    'AGG': 'Arg',
    'GGT': 'Gly',
    'GGC': 'Gly',
    'GGA': 'Gly',
    'GGG': 'Gly',
  };

  static const Map<String, String> complementMap = {
    'A': 'T',
    'T': 'A',
    'C': 'G',
    'G': 'C'
  };

  static const Map<String, String> rnaComplementMap = {
    'A': 'U',
    'T': 'A',
    'C': 'G',
    'G': 'C'
  };

  static const Map<String, String> transcriptionMap = {
    'A': 'A',
    'T': 'U',
    'C': 'C',
    'G': 'G'
  };

  /// (en) Checks the given string for non-DNA characters.
  ///
  /// (ja) 与えられた文字列にDNAではない文字が無いかをチェックします。
  ///
  /// Return: char list.
  ///
  /// Throw: Invalid DNA string.
  static void checkBase(String dna) {
    for (int i = 0; i < dna.length; i++) {
      if (!complementMap.containsKey(dna[i])) {
        throw Exception('Invalid DNA base: ${dna[i]}');
      }
    }
  }

  /// (en)Converts an input DNA sequence into a complementary strand sequence(DNA).
  ///
  /// (ja)入力 DNA 配列を相補鎖配列(DNA)に変換します。
  static String complement(String dna) {
    String r = '';
    for (int i = 0; i < dna.length; i++) {
      r += complementMap[dna[i]]!;
    }
    return r;
  }

  /// (en)Converts an input DNA sequence into a complementary strand sequence(RNA).
  ///
  /// (ja)入力 DNA 配列を相補鎖配列(RNA)に変換します。
  ///
  /// Throw: Invalid DNA string.
  static String complementRNA(String dna) {
    String r = '';
    for (int i = 0; i < dna.length; i++) {
      r += rnaComplementMap[dna[i]]!;
    }
    return r;
  }

  /// (en)Gets the RNA sequence that results from the transcription of the input DNA sequence.
  ///
  /// (ja)入力 DNA 配列が転写された結果生成される RNA 配列を取得します。
  ///
  /// * [dna] : sense strand.
  ///
  /// Throw: Invalid DNA string.
  static String transcriptionFromSenseStrand(String dna) {
    String r = '';
    for (int i = 0; i < dna.length; i++) {
      r += transcriptionMap[dna[i]]!;
    }
    return r;
  }

  /// (en)Gets the RNA sequence that results from the transcription of the input DNA sequence.
  ///
  /// (ja)入力 DNA 配列が転写された結果生成される RNA 配列を取得します。
  ///
  /// * [dna] : antisense strand.
  ///
  /// Throw: Invalid DNA string.
  static String transcriptionFromAntiSenseStrand(String dna) {
    String senseStrand = complement(dna);
    return transcriptionFromSenseStrand(senseStrand);
  }
}
