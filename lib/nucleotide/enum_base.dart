import 'package:nucleic_acid/nucleic_acid.dart';

/// Some information was created with reference to:
/// https://www.ddbj.nig.ac.jp/ddbj/code.html
/// https://creativecommons.org/licenses/by/4.0/deed.ja
enum EnumBase { a, c, g, t, m, r, w, s, y, k, v, h, d, b, n, u }

extension ExtEnumBase on EnumBase {
  /// Fuzzy Compare. return this == other.
  /// * [other] : The target for comparison.
  bool fuzzyComparison(EnumBase other) {
    final List<EnumBase> myList = FBase.allCode[this]!;
    final List<EnumBase> others = FBase.allCode[other]!;
    for (EnumBase i in myList) {
      for (EnumBase j in others) {
        if (i == j) {
          return true;
        }
      }
    }
    return false;
  }

  /// * [type] : The converted type. DNA or RNA.
  EnumBase converted(EnumNucleotideSequenceType type) {
    if (type == EnumNucleotideSequenceType.dna) {
      if (this == EnumBase.u) {
        return EnumBase.t;
      } else {
        return this;
      }
    } else {
      if (this == EnumBase.t) {
        return EnumBase.u;
      } else {
        return this;
      }
    }
  }

  /// Converts to complementary bases in DNA.
  EnumBase complementDNA() {
    if (this == EnumBase.a) {
      return EnumBase.t;
    } else if (this == EnumBase.t) {
      return EnumBase.a;
    } else if (this == EnumBase.g) {
      return EnumBase.c;
    } else if (this == EnumBase.c) {
      return EnumBase.g;
    } else if (this == EnumBase.m) {
      return EnumBase.k;
    } else if (this == EnumBase.k) {
      return EnumBase.m;
    } else if (this == EnumBase.r) {
      return EnumBase.y;
    } else if (this == EnumBase.y) {
      return EnumBase.r;
    } else if (this == EnumBase.w) {
      return EnumBase.w;
    } else if (this == EnumBase.s) {
      return EnumBase.s;
    } else if (this == EnumBase.v) {
      return EnumBase.b;
    } else if (this == EnumBase.b) {
      return EnumBase.v;
    } else if (this == EnumBase.h) {
      return EnumBase.d;
    } else if (this == EnumBase.d) {
      return EnumBase.h;
    } else {
      return EnumBase.n;
    }
  }

  /// Converts complementary bases in RNA.
  EnumBase complementRNA() {
    if (this == EnumBase.a) {
      return EnumBase.u;
    } else if (this == EnumBase.u) {
      return EnumBase.a;
    } else if (this == EnumBase.g) {
      return EnumBase.c;
    } else if (this == EnumBase.c) {
      return EnumBase.g;
    } else if (this == EnumBase.m) {
      return EnumBase.k;
    } else if (this == EnumBase.k) {
      return EnumBase.m;
    } else if (this == EnumBase.r) {
      return EnumBase.y;
    } else if (this == EnumBase.y) {
      return EnumBase.r;
    } else if (this == EnumBase.w) {
      return EnumBase.w;
    } else if (this == EnumBase.s) {
      return EnumBase.s;
    } else if (this == EnumBase.v) {
      return EnumBase.b;
    } else if (this == EnumBase.b) {
      return EnumBase.v;
    } else if (this == EnumBase.h) {
      return EnumBase.d;
    } else if (this == EnumBase.d) {
      return EnumBase.h;
    } else {
      return EnumBase.n;
    }
  }
}
