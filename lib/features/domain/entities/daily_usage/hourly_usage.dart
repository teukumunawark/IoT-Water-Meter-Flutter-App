import 'package:equatable/equatable.dart';

class UsageInHour extends Equatable {
  final double? oneAM;
  final double? twoAM;
  final double? threeAM;
  final double? fourAM;
  final double? fiveAM;
  final double? sixAM;
  final double? sevenAM;
  final double? eightAM;
  final double? nineAM;
  final double? tenAM;
  final double? elevenAM;
  final double? twelvePM;
  final double? onePM;
  final double? twoPM;
  final double? threePM;
  final double? fourPM;
  final double? fivePM;
  final double? sixPM;
  final double? sevenPM;
  final double? eightPM;
  final double? ninePM;
  final double? tenPM;
  final double? elevenPM;
  final double? midnight;

  const UsageInHour({
    this.oneAM,
    this.twoAM,
    this.threeAM,
    this.fourAM,
    this.fiveAM,
    this.sixAM,
    this.sevenAM,
    this.eightAM,
    this.nineAM,
    this.tenAM,
    this.elevenAM,
    this.twelvePM,
    this.onePM,
    this.twoPM,
    this.threePM,
    this.fourPM,
    this.fivePM,
    this.sixPM,
    this.sevenPM,
    this.eightPM,
    this.ninePM,
    this.tenPM,
    this.elevenPM,
    this.midnight,
  });

  @override
  List<Object?> get props {
    return [
      oneAM,
      twoAM,
      threeAM,
      fourAM,
      fiveAM,
      sixAM,
      sevenAM,
      eightAM,
      nineAM,
      tenAM,
      elevenAM,
      twelvePM,
      onePM,
      twoPM,
      threePM,
      fourPM,
      fivePM,
      sixPM,
      sevenPM,
      eightPM,
      ninePM,
      tenPM,
      elevenPM,
      midnight,
    ];
  }
}
