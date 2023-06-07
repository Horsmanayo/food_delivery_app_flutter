import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;

  @override
  void initState() {
    //this function is to get page value from pageController using the setState function
    super.initState();
    pageController.addListener(() {
      //listening to whats happening in the pageController
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    //this function is to clean up to avoid memory leak
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.redAccent,
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 5, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/food01.jpg"))),
        ),
        Align(
            //Align permits a container to be moved to any part of the website
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 140,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "Chinese Side",
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(
                                        Icons.star,
                                        color: AppColors.mainColor,
                                      ))),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "4.7",
                            color: AppColors.textColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "1287",
                            color: AppColors.textColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "comment",
                            color: AppColors.textColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          IconAndTextWidget(
                              iconColor: AppColors.yellowColor,
                              icon: Icons.circle_sharp,
                              text: "Normal"),
                          SizedBox(
                            width: 10,
                          ),
                          IconAndTextWidget(
                              iconColor: AppColors.mainColor,
                              icon: Icons.location_on,
                              text: "1.7km"),
                          SizedBox(
                            width: 10,
                          ),
                          IconAndTextWidget(
                              iconColor: AppColors.iconColor2,
                              icon: Icons.access_time_rounded,
                              text: "32min")
                        ],
                      )
                    ]),
              ),
            ))
      ],
    );
  }
}
