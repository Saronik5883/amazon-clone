import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:flutter/material.dart';

class TopCatergories extends StatelessWidget {
  const TopCatergories({Key? key}) : super(key: key);

  void navigateToCategoryPage(BuildContext context, String category){
    Navigator.pushNamed(context, CategoryDealsScreen.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemExtent: MediaQuery.of(context).size.width/5 ,
          itemCount: GlobalVariables.categoryImages.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: () => navigateToCategoryPage(
                  context, GlobalVariables.categoryImages[index]['title']!
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(GlobalVariables.categoryImages[index]['image']!,
                        fit: BoxFit.cover,
                        width: 40, height: 40,),
                    ),
                  ),
                  Text(
                      GlobalVariables.categoryImages[index]['title']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]
              ),
            );
          },
      ),
    );
  }
}
