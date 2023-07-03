import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/order_details/screens/order_details.dart';
import 'package:amazon_clone/features/product_details/screens/product_detail_screen.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

import 'common/widgets/bottom_bar.dart';
import 'models/order.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
          builder: (context) => const AuthScreen()
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const HomeScreen()
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const BottomBar()
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const AddProductScreen()
      );

    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CategoryDealsScreen(
            category: category
          )
      );

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SearchScreen(
            searchQuery: searchQuery
          )
      );

    case ProductDetailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ProductDetailsScreen(
              product: product,
          )
      );

    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => AddressScreen(
            totalAmount: totalAmount,
          )
      );

    case OrderDetailsScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => OrderDetailsScreen(
            order: order,
          )
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold(
        body: Center(
          child: Text('404 | Page not found'),
        ),
      ));
  }
}