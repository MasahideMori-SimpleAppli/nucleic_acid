enum EnumAminoAcidSequenceDirection { nToC, cToN }

extension ExtEnumAminoAcidSequenceDirection on EnumAminoAcidSequenceDirection {
  EnumAminoAcidSequenceDirection reversed() {
    if (this == EnumAminoAcidSequenceDirection.nToC) {
      return EnumAminoAcidSequenceDirection.cToN;
    } else {
      return EnumAminoAcidSequenceDirection.nToC;
    }
  }
}
