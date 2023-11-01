import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_water_meter/features/presentation/bloc/month/monthly_usage_bloc.dart';

import 'common/constants.dart';
import 'features/presentation/bloc/category_select_cubit.dart';
import 'features/presentation/bloc/daily/daily_usage_bloc.dart';
import 'features/presentation/bloc/sensor_bloc.dart';
import 'features/presentation/bloc/weekly/weekly_usage_bloc.dart';
import 'features/routes/routes.dart';
import 'firebase_options.dart';

import 'di.dart' as injection;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await injection.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injection.locator<SensorBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<CategorySelectedCubit>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<DailyUsageBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<WeeklyUsageBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<MonthlyUsageBloc>(),
        ),
      ],
      child: MaterialApp.router(
        restorationScopeId: 'app',
        debugShowCheckedModeBanner: false,
        // Theme
        theme: ThemeData(
          colorScheme: kColorScheme,
          useMaterial3: true,
          textTheme: kTextTheme,
        ),
        // Routing
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
