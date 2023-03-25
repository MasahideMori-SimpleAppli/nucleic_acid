enum EnumNucleotideSequenceDirection { fiveToThree, threeToFive }

extension ExtEnumNucleotideSequenceDirection
    on EnumNucleotideSequenceDirection {
  EnumNucleotideSequenceDirection reversed() {
    if (this == EnumNucleotideSequenceDirection.fiveToThree) {
      return EnumNucleotideSequenceDirection.threeToFive;
    } else {
      return EnumNucleotideSequenceDirection.fiveToThree;
    }
  }
}
