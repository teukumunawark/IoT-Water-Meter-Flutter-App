import 'package:equatable/equatable.dart';

import '../../../domain/entities/daily_usage/hourly_usage.dart';

class HourlyUsageModel extends Equatable {
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

  const HourlyUsageModel({
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

  factory HourlyUsageModel.fromJson(Map<String, dynamic> json) {
    return HourlyUsageModel(
      oneAM: (json['01:00'] as num?)?.toDouble(),
      twoAM: (json['02:00'] as num?)?.toDouble(),
      threeAM: (json['03:00'] as num?)?.toDouble(),
      fourAM: (json['04:00'] as num?)?.toDouble(),
      fiveAM: (json['05:00'] as num?)?.toDouble(),
      sixAM: (json['06:00'] as num?)?.toDouble(),
      sevenAM: (json['07:00'] as num?)?.toDouble(),
      eightAM: (json['08:00'] as num?)?.toDouble(),
      nineAM: (json['09:00'] as num?)?.toDouble(),
      tenAM: (json['10:00'] as num?)?.toDouble(),
      elevenAM: (json['11:00'] as num?)?.toDouble(),
      twelvePM: (json['12:00'] as num?)?.toDouble(),
      onePM: (json['13:00'] as num?)?.toDouble(),
      twoPM: (json['14:00'] as num?)?.toDouble(),
      threePM: (json['15:00'] as num?)?.toDouble(),
      fourPM: (json['16:00'] as num?)?.toDouble(),
      fivePM: (json['17:00'] as num?)?.toDouble(),
      sixPM: (json['18:00'] as num?)?.toDouble(),
      sevenPM: (json['19:00'] as num?)?.toDouble(),
      eightPM: (json['20:00'] as num?)?.toDouble(),
      ninePM: (json['21:00'] as num?)?.toDouble(),
      tenPM: (json['22:00'] as num?)?.toDouble(),
      elevenPM: (json['23:00'] as num?)?.toDouble(),
      midnight: (json['00:00'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        '01:00': oneAM,
        '02:00': twoAM,
        '03:00': threeAM,
        '04:00': fourAM,
        '05:00': fiveAM,
        '06:00': sixAM,
        '07:00': sevenAM,
        '08:00': eightAM,
        '09:00': nineAM,
        '10:00': tenAM,
        '11:00': elevenAM,
        '12:00': twelvePM,
        '13:00': onePM,
        '14:00': twoPM,
        '15:00': threePM,
        '16:00': fourPM,
        '17:00': fivePM,
        '18:00': sixPM,
        '19:00': sevenPM,
        '20:00': eightPM,
        '21:00': ninePM,
        '22:00': tenPM,
        '23:00': elevenPM,
        '00:00': midnight,
      };

  UsageInHour toEntity() {
    return UsageInHour(
      oneAM: oneAM,
      twoAM: twoAM,
      threeAM: threeAM,
      fourAM: fourAM,
      fiveAM: fiveAM,
      sixAM: sixAM,
      sevenAM: sevenAM,
      eightAM: eightAM,
      nineAM: nineAM,
      tenAM: tenAM,
      elevenAM: elevenAM,
      twelvePM: twelvePM,
      onePM: onePM,
      twoPM: twoPM,
      threePM: threePM,
      fourPM: fourPM,
      fivePM: fivePM,
      sixPM: sixPM,
      sevenPM: sevenPM,
      eightPM: eightPM,
      ninePM: ninePM,
      tenPM: tenPM,
      elevenPM: elevenPM,
      midnight: midnight,
    );
  }

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
