import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masterwordle/ads/banner_ad.dart';
import 'package:masterwordle/master_wordle_page.dart';
import 'package:masterwordle/notifiers/master_wordle_notifer.dart';
import 'package:masterwordle/styles/app_colors.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MasterWordleModel>(
      builder: (context, masterWordleModel, child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            centerTitle: true,
            title: Title(
              color: AppColors.backgroundColor,
              child: const Text(
                "MastterGames",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.blackColor, fontWeight: FontWeight.w900),
              ),
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          masterWordleModel.resetPage();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MasterWordlePage()));
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.blackColor.withOpacity(0.1),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "MastterWordle",
                                style: TextStyle(color: AppColors.blackColor, fontWeight: FontWeight.w900, fontSize: 18),
                              ),
                              Text(
                                DateFormat("EEEE, dd MMMM").format(masterWordleModel.date),
                                style: const TextStyle(color: AppColors.darkGreyColor, fontSize: 14),
                              ),
                              const Text(
                                "A unique cross between Mastermind and Wordle. Guess the daily word in 8 attempts or less.",
                                style: TextStyle(color: AppColors.blackColor, fontSize: 16),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        masterWordleModel.resetPage();
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const MasterWordlePage()));
                                      },
                                      style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.whiteColor)),
                                      child: const Text("PLAY"))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: kIsWeb ? const SizedBox() : SafeArea(child: MyBannerAdWidget()),
              )
            ],
          ),
        );
      },
    );
  }
}
