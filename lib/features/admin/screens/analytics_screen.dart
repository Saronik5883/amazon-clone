
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../models/sales.dart';
import '../services/admin_services.dart';
import '../widgets/catergory_products_chart.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(
      children: [
        const SizedBox(height: 20),
        Text(
          'Total Sales : \$$totalSales',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 250,
          child: CategoryProductsChart(
            barGroups: generateBarGroups(earnings!),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1: Mobiles          : \$${earnings![0].earning}', style: const TextStyle(fontSize: 20),),
              Text('2: Essentials      : \$${earnings![1].earning}', style: const TextStyle(fontSize: 20),),
              Text('3: Appliances     : \$${earnings![2].earning}', style: const TextStyle(fontSize: 20),),
              Text('4: Books             : \$${earnings![3].earning}', style: const TextStyle(fontSize: 20),),
              Text('5: Fashion           : \$${earnings![4].earning}', style: const TextStyle(fontSize: 20),),
            ],
          ),
        ),

      ],
    );
  }

  List<BarChartGroupData> generateBarGroups(List<Sales> earnings) {
    return earnings
        .asMap()
        .map((index, sales) => MapEntry(
      index,
      generateGroupData(index + 1, sales.earning),
    ))
        .values
        .toList();
  }

  BarChartGroupData generateGroupData(int x, int y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y.toDouble()),
      ],
    );
  }
}
