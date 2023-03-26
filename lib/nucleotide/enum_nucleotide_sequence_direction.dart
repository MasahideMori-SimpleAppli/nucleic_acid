enum EnumNucleotideSequenceDirection { fiveToThree, threeToFive }

extension ExtEnumNucleotideSequenceDirection
    on EnumNucleotideSequenceDirection {
  /// Return reversed direction.
  EnumNucleotideSequenceDirection reversed() {
    if (this == EnumNucleotideSequenceDirection.fiveToThree) {
      return EnumNucleotideSequenceDirection.threeToFive;
    } else {
      return EnumNucleotideSequenceDirection.fiveToThree;
    }
  }
}
