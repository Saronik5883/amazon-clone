import 'package:flutter/material.dart';

import '../../../common/widgets/stars.dart';
import '../../../models/product.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double totalRating = 0;
    for(int i=0; i< product.rating!.length; i++){
      totalRating += product.rating![i].rating;
    }
    double avgRating =0;
    if(totalRating != 0){
      avgRating = totalRating/product.rating!.length;
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10,),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.contain,
                height: 150,
                width: 150,
              ),
              Column(
                children: [
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.name,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left:10, top: 5),
                    child: Stars(rating: avgRating,),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left:10, top: 5),
                    child: Text(
                      '\$${product.price.toString()}',
                      maxLines: 2,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left:10),
                    child: const Text(
                      'Eligible for FREE shipping',
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left:10, top : 5),
                    child: const Text(
                      'In Stock',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              )
            ],
          )
        )
      ],
    );
  }
}
