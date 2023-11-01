import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/constants.dart';

class MyDropdownButton extends StatefulWidget {
  const MyDropdownButton({super.key});

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  final TextEditingController monthController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  MonthLabel? selectedmonth;

  final List<DropdownMenuEntry<MonthLabel>> monthEntries =
      <DropdownMenuEntry<MonthLabel>>[];

  @override
  Widget build(BuildContext context) {
    final monthEntries = <DropdownMenuEntry<MonthLabel>>[];

    for (final MonthLabel month in MonthLabel.values) {
      monthEntries.add(
        DropdownMenuEntry<MonthLabel>(
          value: month,
          label: month.label,
        ),
      );
    }

    return SizedBox(
      child: DropdownMenu<MonthLabel>(
        menuHeight: 250,
        textStyle: kSubtitle.copyWith(fontSize: 12),
        menuStyle: const MenuStyle(
          backgroundColor: MaterialStatePropertyAll(
            AppColors.contentColorWhite,
          ),
        ),
        initialSelection: MonthLabel.januari,
        controller: monthController,
        label: Text(
          'Mounth',
          style: kSubtitle.copyWith(fontSize: 12),
        ),
        dropdownMenuEntries: monthEntries,
        onSelected: (MonthLabel? month) {
          setState(() {
            selectedmonth = month;
          });
        },
      ),
    );
  }
}

enum MonthLabel {
  januari('Januari'),
  februari('Februari'),
  maret('Maret'),
  april('April'),
  mei('Mei'),
  juni('Juni'),
  juli('Juli'),
  agustus('Agustus'),
  september('September'),
  oktober('Oktober'),
  november('November'),
  desember('Desember');

  const MonthLabel(this.label);
  final String label;
}
