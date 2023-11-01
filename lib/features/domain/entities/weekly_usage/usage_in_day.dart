import 'package:equatable/equatable.dart';

class UsageInDay extends Equatable {
  final double? hari1;
  final double? hari2;
  final double? hari3;
  final double? hari4;
  final double? hari5;
  final double? hari6;
  final double? hari7;

  const UsageInDay({
    this.hari1,
    this.hari2,
    this.hari3,
    this.hari4,
    this.hari5,
    this.hari6,
    this.hari7,
  });

  @override
  List<Object?> get props {
    return [
      hari1,
      hari2,
      hari3,
      hari4,
      hari5,
      hari6,
      hari7,
    ];
  }
}
