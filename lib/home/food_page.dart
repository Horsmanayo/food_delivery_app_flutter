import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
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
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

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
    return Column(
      children: [
        Container(
          // color: Colors.redAccent,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    // returns an instance with a three coordinate of x, y and z
    Matrix4 matrix = Matrix4.identity();
    // print(matrix);

    // checking if index value matches with the current page value
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      matrix = Matrix4.diagonal3Values(1, 0.8, 1)
        ..setTranslationRaw(0, _height * (1 - 0.8) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
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
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(
                    left: 30, right: 30, bottom: Dimensions.height30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        //@offset first val is the x axis, second is y
                        offset: Offset(0, 5),
                      ),
                      //the box shadow below is to remove the shadows on the left side of the box
                      BoxShadow(
                        color: Colors.white,
                        //@offset first val is the x axis, second is y
                        offset: Offset(-5, 0),
                      ),
                      //the box shadow below is to remove the shadows on the right side of the box
                      BoxShadow(
                        color: Colors.white,
                        //@offset first val is the x axis, second is y
                        offset: Offset(5, 0),
                      )
                    ]),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15, left: 15, right: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: "Chinese Side",
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: Dimensions.height10,
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
                          height: Dimensions.height10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),
    );
  }
}
