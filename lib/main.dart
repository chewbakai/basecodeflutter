import 'package:basecode/screens/DashboardScreen.dart';
import 'package:basecode/services/LocalService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './screens/LoginScreen.dart';
import './routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalService.initialize();
  runApp(GetMaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.teal[700],
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        headline5: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 18.0),
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow[800]),
    ),
    getPages: routes,
    initialRoute: LocalService.isUserLoggedIn()
        ? DashboardScreen.routeName
        : LoginScreen.routeName,
  ));
}
// class App extends StatefulWidget {
//   // Create the initialization Future outside of `build`:
//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   /// The future is part of the state of our widget. We should not call `initializeApp`
//   /// directly inside [build].
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire:
//       future: _initialization,
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           return SomethingWentWrong();
//         }

//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return MyAwesomeApp();
//         }

//         // Otherwise, show something whilst waiting for initialization to complete
//         return Loading();
//       },
//     );
//   }
// }
