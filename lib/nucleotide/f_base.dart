/// Some information was created with reference to:
/// https://www.ddbj.nig.ac.jp/ddbj/code.html
/// https://creativecommons.org/licenses/by/4.0/deed.ja

import 'enum_base.dart';

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
    EnumBase.t: [EnumBase.t, EnumBase.u],
    EnumBase.u: [EnumBase.u, EnumBase.t],
    EnumBase.m: [EnumBase.m, EnumBase.a, EnumBase.c],
    EnumBase.r: [EnumBase.r, EnumBase.a, EnumBase.g],
    EnumBase.w: [EnumBase.w, EnumBase.a, EnumBase.t, EnumBase.u],
    EnumBase.s: [EnumBase.s, EnumBase.c, EnumBase.g],
    EnumBase.y: [EnumBase.y, EnumBase.c, EnumBase.t, EnumBase.u],
    EnumBase.k: [EnumBase.k, EnumBase.g, EnumBase.t, EnumBase.u],
    EnumBase.v: [EnumBase.v, EnumBase.a, EnumBase.c, EnumBase.g],
    EnumBase.h: [EnumBase.h, EnumBase.a, EnumBase.c, EnumBase.t, EnumBase.u],
    EnumBase.d: [EnumBase.d, EnumBase.a, EnumBase.g, EnumBase.t, EnumBase.u],
    EnumBase.b: [EnumBase.b, EnumBase.c, EnumBase.g, EnumBase.t, EnumBase.u],
    EnumBase.n: [
      EnumBase.n,
      EnumBase.a,
      EnumBase.c,
      EnumBase.g,
      EnumBase.t,
      EnumBase.u
    ],
  };
}
