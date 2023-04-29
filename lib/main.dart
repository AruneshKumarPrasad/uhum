import 'package:uhum/Barrel/app_barrel.dart';

import 'Provider/AudioPlayerScreen/audio_player_provider.dart';



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
          SplashScreen.routeName: (context) => const SplashScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          LandingScreen.routeName: (context) => const LandingScreen(),
          OnBoardingScreen.routeName: (context) => ChangeNotifierProvider(
                create: (context) => OnBoardingProvider(),
                child: OnBoardingScreen(
                  uid: ModalRoute.of(context)!.settings.arguments as String,
                ),
              ),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          TracksScreen.routeName: (context) => TracksScreen(
                meditationCategory: ModalRoute.of(context)!.settings.arguments
                    as MeditationCategory,
              ),
          AudioPlayerScreen.routeName: (context) =>
              ChangeNotifierProvider.value(
                value: AudioNotifier(),
                child: AudioPlayerScreen(
                  meditation:
                      ModalRoute.of(context)!.settings.arguments as Meditation,
                ),
              ),
        },
      ),
    );
  }
}
