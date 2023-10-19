import 'package:flutter/material.dart';
import 'package:play_store/AndroidScreen.dart';
import 'package:play_store/IOSScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Androidprovider()),
      ChangeNotifierProvider(create: (context) => ISOProvider())
    ],
      child: MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Play store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff0982fe)),
        useMaterial3: true,
      ),
      home: AndroidScreen(),
    );
  }
}
