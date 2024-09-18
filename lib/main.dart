import 'package:CodinGoat_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CodinGoat_flutter/screens/dashboard_screen.dart';
import 'package:CodinGoat_flutter/screens/login_screen.dart';
import 'package:CodinGoat_flutter/src/widgets/transition_route_observer.dart';



// Define a custom MaterialColor
Map<int, Color> cyanColorShades = {
  50: Color.fromARGB(255, 233, 238, 238),
  100: Color.fromARGB(255, 233, 238, 238),
  200: Color.fromARGB(255, 233, 238, 238),
  300: Color.fromARGB(255, 233, 238, 238),
  400: Color.fromARGB(255, 233, 238, 238),
  500: Color.fromARGB(255, 233, 238, 238),
  600: Color.fromRGBO(0, 188, 212, .7),
  700: Color.fromRGBO(0, 188, 212, .8),
  800: Color.fromRGBO(0, 188, 212, .9),
  900: Color.fromRGBO(0, 188, 212, 1.0),
};

MaterialColor customCyan = MaterialColor(0xFF00BCD4, cyanColorShades);

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        useMaterial3: true,
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Color.fromARGB(255, 32, 32, 79)),
        // fontFamily: 'SourceSansPro',
        textTheme: TextTheme(
          displaySmall: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            // fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 32, 32, 79),
          ),
          labelLarge: const TextStyle(
            // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
            fontFamily: 'OpenSans',
          ),
          bodySmall: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.deepPurple[300],
          ),
          displayLarge: const TextStyle(fontFamily: 'Quicksand'),
          displayMedium: const TextStyle(fontFamily: 'Quicksand'),
          headlineMedium: const TextStyle(fontFamily: 'Quicksand'),
          headlineSmall: const TextStyle(fontFamily: 'NotoSans'),
          titleLarge: const TextStyle(fontFamily: 'NotoSans'),
          titleMedium: const TextStyle(fontFamily: 'NotoSans'),
          bodyLarge: const TextStyle(fontFamily: 'NotoSans'),
          bodyMedium: const TextStyle(fontFamily: 'NotoSans'),
          titleSmall: const TextStyle(fontFamily: 'NotoSans'),
          labelSmall: const TextStyle(fontFamily: 'NotoSans'),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: customCyan)
            .copyWith(secondary: Color.fromARGB(255, 32, 32, 79)),
      ),
      navigatorObservers: [TransitionRouteObserver()],
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        DashboardScreen.routeName: (context) => const DashboardScreen(),
      },
    );
  }
}
