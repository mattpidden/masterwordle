import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:masterwordle/notifiers/master_wordle_notifer.dart';
import 'package:masterwordle/overview_page.dart';
import 'package:masterwordle/styles/app_colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MasterWordleModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mastter Games',
      color: AppColors.backgroundColor,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: const Scaffold(backgroundColor: AppColors.backgroundColor, body: OverviewPage()),
    );
  }
}
