/// Some information was created with reference to:
/// https://www.ddbj.nig.ac.jp/ddbj/code.html
/// https://creativecommons.org/licenses/by/4.0/deed.ja
import 'package:nucleic_acid/nucleobase/enum_base.dart';

class FBase {
  static const Map<String, String> oneToFull = {
    'a': 'adenine',
    'c': 'cytosine',
    'g': 'guanine',
    // 注：国際塩基配列データベースではRNAの場合はuと同様になる。
    't': 'thymine',
    'u': 'uracil',
    'n': 'any',
  };

  static const Map<EnumBase, List<EnumBase>> allCode = {
    EnumBase.a: [EnumBase.a],
    EnumBase.c: [EnumBase.c],
    EnumBase.g: [EnumBase.g],
    EnumBase.t: [EnumBase.t],
    EnumBase.m: [EnumBase.a, EnumBase.c],
    EnumBase.r: [EnumBase.a, EnumBase.g],
    EnumBase.w: [EnumBase.a, EnumBase.t],
    EnumBase.s: [EnumBase.c, EnumBase.g],
    EnumBase.y: [EnumBase.c, EnumBase.t],
    EnumBase.k: [EnumBase.g, EnumBase.t],
    EnumBase.v: [EnumBase.a, EnumBase.c, EnumBase.g],
    EnumBase.h: [EnumBase.a, EnumBase.c, EnumBase.t],
    EnumBase.d: [EnumBase.a, EnumBase.g, EnumBase.t],
    EnumBase.b: [EnumBase.c, EnumBase.g, EnumBase.t],
    EnumBase.n: [EnumBase.a, EnumBase.c, EnumBase.g, EnumBase.t],
  };
}
