import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:task_manager/application/task_bloc.dart';
import 'package:task_manager/domain/core/config/injection.dart';
import 'package:task_manager/presentation/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  // Hive.registerAdapter(LoginDataAdapter());
  await Hive.initFlutter();
  await Hive.openBox('tudStorage');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(),
        )
      ],
      child: MaterialApp(
        title: "Task",
        debugShowCheckedModeBanner: false,
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: MediaQuery.of(context).size.width / 1,
          minWidth: 480,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
        ),
        theme: ThemeData(
          // Define your theme data
          primarySwatch: Colors.blue,
          // Add other theme configurations as needed
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
