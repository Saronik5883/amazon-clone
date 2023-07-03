import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/screens/auth_screen.dart';

void main() {
  //SharedPreferences.setMockInitialValues({});
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => UserProvider(),
    )
  ],child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: GlobalVariables.backgroundColor,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black87,
          ),
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty ?
      Provider.of<UserProvider>(context).user.type == 'user' ?
      const BottomBar() : const AdminScreen() : const AuthScreen(),
    );
  }
}


// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final AuthService authService = AuthService();
//   final messangerKey = GlobalKey<ScaffoldMessengerState>();
//   @override
//   void initState() {
//     super.initState();
//     authService.getUserData(messangerKey.currentState!.context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       scaffoldMessengerKey: messangerKey,
//       title: 'Amazon Clone',
//       theme: ThemeData(
//         scaffoldBackgroundColor: GlobalVariables.backgroundColor,
//         colorScheme:
//         const ColorScheme.light(primary: GlobalVariables.secondaryColor),
//         appBarTheme: const AppBarTheme(
//           elevation: 0,
//           iconTheme: IconThemeData(color: Colors.black),
//         ),
//       ),
//       onGenerateRoute: ((settings) => generateRoute(settings)),
//       home: Provider.of<UserProvider>(context).user.token.isNotEmpty
//           ? const HomeScreen()
//           : const AuthScreen(),
//     );
//   }
// }
