import 'package:firebase_core/firebase_core.dart';
import 'package:uhum/Barrel/app_barrel.dart';
import 'package:uhum/Screens/SplashScreen/spash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Ahum',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          LandingScreen.routeName: (context) => LandingScreen(),
          OnBoardingScreen.routeName: (context) => ChangeNotifierProvider(
                create: (context) => OnBoardingProvider(),
                child: OnBoardingScreen(
                  uid: ModalRoute.of(context)!.settings.arguments as String,
                ),
              ),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
        },
      ),
    );
  }
}
