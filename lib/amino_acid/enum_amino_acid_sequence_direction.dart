enum EnumAminoAcidSequenceDirection { nToC, cToN }

extension ExtEnumAminoAcidSequenceDirection on EnumAminoAcidSequenceDirection {
  /// Return reversed direction.
  EnumAminoAcidSequenceDirection reversed() {
    if (this == EnumAminoAcidSequenceDirection.nToC) {
      return EnumAminoAcidSequenceDirection.cToN;
    } else {
      return EnumAminoAcidSequenceDirection.nToC;
    }
  }
}
