class AminoAcidJA {
  static const Map<String, String> enToJA = {
    'Alanine': 'アラニン',
    'Arginine': 'アルギニン',
    'Asparagine': 'アスパラギン',
    'Aspartic acid': 'アスパラギン酸',
    'Cysteine': 'システイン',
    'Glutamic acid': 'グルタミン酸',
    'Glutamine': 'グルタミン',
    'Glycine': 'グリシン',
    'Histidine': 'ヒスチジン',
    'Isoleucine': 'イソロイシン',
    'Leucine': 'ロイシン',
    'Lysine': 'リジン',
    'Methionine': 'メチオニン',
    'Phenylalanine': 'フェニルアラニン',
    'Proline': 'プロリン',
    'Serine': 'セリン',
    'Threonine': 'スレオニン',
    'Tryptophan': 'トリプトファン',
    'Tyrosine': 'チロシン',
    'Valine': 'バリン'
  };

  static const Map<String, String> jaToEn = {
    'アラニン': 'Alanine',
    'アルギニン': 'Arginine',
    'アスパラギン': 'Asparagine',
    'アスパラギン酸': 'Aspartic acid',
    'システイン': 'Cysteine',
    'グルタミン酸': 'Glutamic acid',
    'グルタミン': 'Glutamine',
    'グリシン': 'Glycine',
    'ヒスチジン': 'Histidine',
    'イソロイシン': 'Isoleucine',
    'ロイシン': 'Leucine',
    'リジン': 'Lysine',
    'メチオニン': 'Methionine',
    'フェニルアラニン': 'Phenylalanine',
    'プロリン': 'Proline',
    'セリン': 'Serine',
    'スレオニン': 'Threonine',
    'トリプトファン': 'Tryptophan',
    'チロシン': 'Tyrosine',
    'バリン': 'Valine'
  };

  /// Convert english full name to japanese full name.
  static String? convertJA(String aminoAcidFullNameEN) {
    return enToJA[aminoAcidFullNameEN];
  }

  /// Convert japanese full name to english full name.
  static String? convertEN(String aminoAcidFullNameJA) {
    return jaToEn[aminoAcidFullNameJA];
  }
}
