class AminoAcid {
  static const Map<String, String> fullToThree = {
    'Alanine': 'Ala',
    'Arginine': 'Arg',
    'Asparagine': 'Asn',
    'Aspartic acid': 'Asp',
    'Cysteine': 'Cys',
    'Glutamic acid': 'Glu',
    'Glutamine': 'Gln',
    'Glycine': 'Gly',
    'Histidine': 'His',
    'Isoleucine': 'Ile',
    'Leucine': 'Leu',
    'Lysine': 'Lys',
    'Methionine': 'Met',
    'Phenylalanine': 'Phe',
    'Proline': 'Pro',
    'Serine': 'Ser',
    'Threonine': 'Thr',
    'Tryptophan': 'Trp',
    'Tyrosine': 'Tyr',
    'Valine': 'Val'
  };

  static const Map<String, String> fullToOne = {
    'Alanine': 'A',
    'Arginine': 'R',
    'Asparagine': 'N',
    'Aspartic acid': 'D',
    'Cysteine': 'C',
    'Glutamic acid': 'E',
    'Glutamine': 'Q',
    'Glycine': 'G',
    'Histidine': 'H',
    'Isoleucine': 'I',
    'Leucine': 'L',
    'Lysine': 'K',
    'Methionine': 'M',
    'Phenylalanine': 'F',
    'Proline': 'P',
    'Serine': 'S',
    'Threonine': 'T',
    'Tryptophan': 'W',
    'Tyrosine': 'Y',
    'Valine': 'V'
  };

  static const Map<String, String> threeToFull = {
    'Ala': 'Alanine',
    'Arg': 'Arginine',
    'Asn': 'Asparagine',
    'Asp': 'Aspartic acid',
    'Cys': 'Cysteine',
    'Glu': 'Glutamic acid',
    'Gln': 'Glutamine',
    'Gly': 'Glycine',
    'His': 'Histidine',
    'Ile': 'Isoleucine',
    'Leu': 'Leucine',
    'Lys': 'Lysine',
    'Met': 'Methionine',
    'Phe': 'Phenylalanine',
    'Pro': 'Proline',
    'Ser': 'Serine',
    'Thr': 'Threonine',
    'Trp': 'Tryptophan',
    'Tyr': 'Tyrosine',
    'Val': 'Valine'
  };

  static const Map<String, String> threeToOne = {
    'Ala': 'A',
    'Arg': 'R',
    'Asn': 'N',
    'Asp': 'D',
    'Cys': 'C',
    'Glu': 'E',
    'Gln': 'Q',
    'Gly': 'G',
    'His': 'H',
    'Ile': 'I',
    'Leu': 'L',
    'Lys': 'K',
    'Met': 'M',
    'Phe': 'F',
    'Pro': 'P',
    'Ser': 'S',
    'Thr': 'T',
    'Trp': 'W',
    'Tyr': 'Y',
    'Val': 'V'
  };

  static const Map<String, String> oneToFull = {
    'A': 'Alanine',
    'R': 'Arginine',
    'N': 'Asparagine',
    'D': 'Aspartic acid',
    'C': 'Cysteine',
    'E': 'Glutamic acid',
    'Q': 'Glutamine',
    'G': 'Glycine',
    'H': 'Histidine',
    'I': 'Isoleucine',
    'L': 'Leucine',
    'K': 'Lysine',
    'M': 'Methionine',
    'F': 'Phenylalanine',
    'P': 'Proline',
    'S': 'Serine',
    'T': 'Threonine',
    'W': 'Tryptophan',
    'Y': 'Tyrosine',
    'V': 'Valine'
  };

  static const Map<String, String> oneToThree = {
    'A': 'Ala',
    'R': 'Arg',
    'N': 'Asn',
    'D': 'Asp',
    'C': 'Cys',
    'E': 'Glu',
    'Q': 'Gln',
    'G': 'Gly',
    'H': 'His',
    'I': 'Ile',
    'L': 'Leu',
    'K': 'Lys',
    'M': 'Met',
    'F': 'Phe',
    'P': 'Pro',
    'S': 'Ser',
    'T': 'Thr',
    'W': 'Trp',
    'Y': 'Tyr',
    'V': 'Val'
  };

  /// Convert full name to three-letter notation.
  static String? convertThree(String aminoAcidFullName) {
    return fullToThree[aminoAcidFullName];
  }

  /// Convert full name to one-letter notation.
  static String? convertOne(String aminoAcidFullName) {
    return fullToOne[aminoAcidFullName];
  }

  /// Convert three-letter notation to full name.
  static String? convertThreeToFull(String threeLetterNotation) {
    return threeToFull[threeLetterNotation];
  }

  /// Convert three-letter notation to one-letter notation.
  static String? convertThreeToOne(String threeLetterNotation) {
    return threeToOne[threeLetterNotation];
  }

  /// Convert one-letter notation to full name.
  static String? convertOneToFull(String oneLetterNotation) {
    return oneToFull[oneLetterNotation];
  }

  /// Convert one-letter notation to three-letter notation.
  static String? convertOneToThree(String oneLetterNotation) {
    return oneToThree[oneLetterNotation];
  }
}
