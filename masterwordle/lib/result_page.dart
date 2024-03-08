import 'package:flutter/material.dart';
import 'package:masterwordle/notifiers/master_wordle_notifer.dart';
import 'package:masterwordle/styles/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class MasterWordleResultsPage extends StatefulWidget {
  const MasterWordleResultsPage({super.key});

  @override
  State<MasterWordleResultsPage> createState() =>
      _MasterWordleResultsPageState();
}

class _MasterWordleResultsPageState extends State<MasterWordleResultsPage> {
  String title = "";
  String message = "";

  @override
  void initState() {
    super.initState();
    final results =
        Provider.of<MasterWordleModel>(context, listen: false).getAlertData();
    setState(() {
      title = results.$1;
      message = results.$2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MasterWordleModel>(
        builder: (context, masterWordleModel, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              centerTitle: true,
              title: Title(
                  color: AppColors.backgroundColor,
                  child: const Text(
                    "MasterWordle",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w900),
                  ))),
          body: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (title == "Congratulations")
                    ? Icon(
                        Icons.check_circle,
                        size: 60,
                        color: AppColors.successColor,
                      )
                    : Icon(
                        Icons.cancel,
                        size: 60,
                        color: AppColors.errorColor,
                      ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  message,
                  style: TextStyle(fontSize: 18, color: AppColors.blackColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () async {
                    final box = context.findRenderObject() as RenderBox?;
                    await Share.share(
                      masterWordleModel.getShareMessage(),
                      subject: "MasterWordle",
                      sharePositionOrigin:
                          box!.localToGlobal(Offset.zero) & box.size,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Share Result",
                      style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
