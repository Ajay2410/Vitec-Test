import 'package:vitec_test/features/home_module/ui/home_screen.dart';

import 'imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  VariableUtilities.pref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

final navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorUtilities.primaryColor,
      statusBarIconBrightness: Brightness.dark,
    ));

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Travel App',
            navigatorKey: navKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: ColorUtilities.primaryColor),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          );
        });
  }
}
