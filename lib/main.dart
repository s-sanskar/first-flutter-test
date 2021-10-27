import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_flutter_app/pages/Services/authentication_service.dart';
import 'package:first_flutter_app/pages/home.dart';
import 'package:first_flutter_app/pages/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationServices>(
            create: (_) => AuthenticationServices(FirebaseAuth.instance),
          ),
          StreamProvider(
              initialData: () => null,
              create: (context) =>
                  context.read<AuthenticationServices>().authStateChanges),
        ],
        child: MaterialApp(home: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasData) {
              print(snapshot);
              return HomePage();
            } else {
              return LoginSignIn();
            }
          },
        )));
  }
}
// const MaterialApp(
//         home: AuthenticationWrapper(),
//       ),

// class AuthenticationWrapper extends StatelessWidget {
//   const AuthenticationWrapper({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final firebaseuser = context.watch<User>();
//     if (firebaseuser != null) {
//       return HomePage();
//     }
//     return LoginSignIn();
//   }
// }
