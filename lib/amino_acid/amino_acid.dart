import 'package:nucleic_acid/amino_acid/enum_amino_acid.dart';

class AminoAcid {
  EnumAminoAcid type;
  String? decoration;

  /// * [type] : amino acid type.
  /// * [decoration] : surface decoration.
  AminoAcid(this.type, {this.decoration});
}
