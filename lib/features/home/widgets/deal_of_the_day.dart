import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/product_details/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../../../models/product.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async{
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailsScreen() {
    Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: product,);
  }

  @override
  Widget build(BuildContext context) {
    return product == null
    ? const Loader()
    : product!.name.isEmpty
        ? const SizedBox()
    : GestureDetector(
      onTap: navigateToDetailsScreen,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, top: 15, bottom: 10),
            child: const Text('Deal of the day', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15, top: 5, right: 40, bottom: 10),
            child: Text(
              'Up to 70% off | ${product!.category} clearance store',
              style: const TextStyle(fontSize: 15),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Image.network(
            product!.images.last,
            height: 235,
            fit: BoxFit.fitHeight,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15,),
            alignment: Alignment.topLeft,
            child: const Text(
              '\$ 1,299.00 - \$ 1,999.00',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15,),
            alignment: Alignment.topLeft,
            child: Text(
              '${product!.name}',
              style: TextStyle(fontSize: 18),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: product!.images.map((e) =>
                  Image.network(
                    e,
                    fit: BoxFit.fitWidth,
                    width: 100, height: 100,
                  ),
              ).toList(),

            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
            alignment: Alignment.topLeft,
            child: const Text(''
                'See all deals',
                style: TextStyle(
                    fontSize: 18, color: Colors.cyan
                ),
            ),
          )
        ],
      ),
    );
  }
}
