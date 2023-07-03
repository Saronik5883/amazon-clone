import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/cart/screens/cart_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page =0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];

  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updatePage,
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,

              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: _page == 0 ?
                        GlobalVariables.selectedNavBarColor : Colors.transparent,
                        width: bottomBarBorderWidth,
                    )
                )
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,

              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: _page == 1 ?
                        GlobalVariables.selectedNavBarColor : Colors.transparent,
                        width: bottomBarBorderWidth,
                      )
                  )
              ),
              child: const Icon(Icons.person_outline),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,

              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: _page == 2 ?
                        GlobalVariables.selectedNavBarColor : Colors.transparent,
                        width: bottomBarBorderWidth,
                      )
                  )
              ),
              child: Badge(

                label: Text(userCartLen.toString(),),
                backgroundColor: Colors.redAccent,
                textColor: Colors.black,
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            ),
            label: '',
          ),
        ],
      )
    );
  }
}
