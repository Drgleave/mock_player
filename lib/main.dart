import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_player/config/custom_router.dart';
import 'package:mock_player/config/route_paths.dart';
import 'package:mock_player/screens/home_screen.dart';
import 'package:mock_player/screens/main_screen.dart';
import 'package:mock_player/screens/playlist_screen.dart';
import 'package:mock_player/screens/splash_screen.dart';
import 'package:mock_player/screens/track_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CustomRouter.onGenerateRoute,
      initialRoute: RoutePaths.Home,
      //home: const SplashScreen(),
      getPages: [
        GetPage(name: '/', page: () => const MainScreen()),
        GetPage(name: '/track', page: () => const TrackScreen()),
        GetPage(name: '/playlist', page: () => const PlaylistScreen())
      ],
    );
  }

}
