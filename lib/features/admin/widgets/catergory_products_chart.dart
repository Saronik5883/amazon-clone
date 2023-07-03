import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<BarChartGroupData> barGroups;

  const CategoryProductsChart({
    Key? key,
    required this.barGroups,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(

        barGroups: barGroups,
      ),
    );
  }
}

List<String> categories = ['Mobiles', 'Laptops', 'Clothes', 'Shoes', 'Watches'];
BarChartGroupData generateGroupData(int x, int y) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(toY: y.toDouble()),
    ],
  );
}
