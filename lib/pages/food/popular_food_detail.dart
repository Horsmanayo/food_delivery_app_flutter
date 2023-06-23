import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height.toString());
    //using scaffold allows you to put one container on top of the other
    return Scaffold(
      body: Stack(
        children: [
          //positioned is like position in CSS, with almost same attribute
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/food01.jpg"))),
              )),
          Positioned(
              left: Dimensions.width20, right: Dimensions.width20, child: Row())
        ],
      ),
    );
  }
}
