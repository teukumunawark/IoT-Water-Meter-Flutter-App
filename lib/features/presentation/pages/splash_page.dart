import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iot_water_meter/features/routes/routes.dart';

import '../../../common/sharef_pref_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () async {
      final devID = await getDevID();

      print(devID);
      if (devID == null) {
        router.pushNamed('inputId');
      } else {
        router.pushNamed('home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
