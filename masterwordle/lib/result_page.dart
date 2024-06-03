import 'package:flutter/material.dart';
import 'package:masterwordle/notifiers/master_wordle_notifer.dart';
import 'package:masterwordle/styles/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MasterWordleResultsPage extends StatefulWidget {
  const MasterWordleResultsPage({super.key});

  @override
  State<MasterWordleResultsPage> createState() => _MasterWordleResultsPageState();
}

class _MasterWordleResultsPageState extends State<MasterWordleResultsPage> {
  String title = "";
  String message = "";
  bool shareLoading = false;
  List<int> stats = [0, 0, 0, 0, 0, 0, 0, 0];

  void handleGetStats() async {
    stats = await Provider.of<MasterWordleModel>(context, listen: false).getAllStats();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    final results = Provider.of<MasterWordleModel>(context, listen: false).getAlertData();
    setState(() {
      title = results.$1;
      message = results.$2;
    });
    handleGetStats();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MasterWordleModel>(
      builder: (context, masterWordleModel, child) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                  backgroundColor: AppColors.backgroundColor,
                  centerTitle: true,
                  title: Title(
                      color: AppColors.backgroundColor,
                      child: const Text(
                        "MasterWordle",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.blackColor, fontWeight: FontWeight.w900),
                      ))),
              body: Container(
                padding: const EdgeInsets.all(32),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (title == "Congratulations")
                        ? const Icon(
                            Icons.check_circle,
                            size: 60,
                            color: AppColors.successColor,
                          )
                        : const Icon(
                            Icons.cancel,
                            size: 60,
                            color: AppColors.errorColor,
                          ),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.blackColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      message,
                      style: const TextStyle(fontSize: 18, color: AppColors.blackColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: SfCartesianChart(
                          primaryXAxis: const CategoryAxis(
                              title: AxisTitle(
                            text: 'Score',
                          )),
                          primaryYAxis: NumericAxis(
                            minimum: 0,
                            maximum: (stats.reduce((a, b) => a > b ? a : b) + 5).toDouble(),
                            interval: 5,
                            title: const AxisTitle(text: "Frequency"),
                          ),
                          series: <CartesianSeries<int, String>>[
                            BarSeries<int, String>(
                                dataSource: stats,
                                xValueMapper: (int data, index) => (index + 1).toString(),
                                yValueMapper: (int data, _) => data,
                                name: 'Gold',
                                color: AppColors.primaryColor)
                          ]),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final box = context.findRenderObject() as RenderBox?;
                        setState(() {
                          shareLoading = true;
                        });
                        await Share.share(
                          masterWordleModel.getShareMessage(),
                          subject: "MasterWordle",
                          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                        );
                        setState(() {
                          shareLoading = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: shareLoading
                            ? const CircularProgressIndicator(color: AppColors.whiteColor)
                            : const Text(
                                "Share Result",
                                style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 18),
                                maxLines: 1,
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
