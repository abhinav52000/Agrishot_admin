import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Directory/routes.dart';
import 'Network/Bloc/Login_Bloc/login_bloc.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(create: (context) => LoginBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff363740),
          appBarTheme: const AppBarTheme(
            color: Colors.black,
          ),
        ),
        // initialRoute: LoginScreen.id,
        initialRoute: HomeScreen.id,
        onGenerateRoute: (settings) => generateRoute(settings),
      ),
    );
  }
}
