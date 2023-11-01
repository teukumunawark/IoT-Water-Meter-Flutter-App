import 'package:equatable/equatable.dart';

class UsageInWeek extends Equatable {
  final double? minggu1;
  final double? minggu2;
  final double? minggu3;
  final double? minggu4;

  const UsageInWeek({
    this.minggu1,
    this.minggu2,
    this.minggu3,
    this.minggu4,
  });

  @override
  List<Object?> get props => [
        minggu1,
        minggu2,
        minggu3,
        minggu4,
      ];
}
