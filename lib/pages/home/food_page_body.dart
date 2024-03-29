import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:fooddelivery/widgets/app_column.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:fooddelivery/widgets/icon_and_text_widget.dart';
import 'package:fooddelivery/widgets/small_text.dart';
import 'package:get/get.dart';
class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController=PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue=pageController.page!;
      });
    });
  }
  @override
  void dispose(){
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      //slider section
      children: [
        GetBuilder<PopularProductController>(builder:(popularProducts){
          return Container(
            //color: Colors.red,
            height: Dimensions.pageView,
            child: PageView.builder(
                controller:pageController,
                itemCount: 5,
                itemBuilder: (context,position){
                  return _buildPageItem(position);
                }),
          );
        }),
        //dots
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
           size: const Size.square(9.0),
             activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    ),
        //popular receipts
        SizedBox(height: Dimensions.height30,),
        Container(
          margin:EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text:"Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3) ,
                child: BigText(text: ".", color:Colors.black),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2) ,

                child: SmallText(text: "Food pairing"),
              )
            ],
          ),
        ),

        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context,index){
                return Container(
                  margin:EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10,top: Dimensions.height10),
                  child: Row(
                    children: [
                      //image section
                      Container(
                        width:Dimensions.listViewImgSize,
                        height:Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit:BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/food2.jpg"
                                )
                            )
                        ),
                      ),
                      //text container
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewTextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20)
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: "Chicken salad"),
                                SizedBox(height: Dimensions.height10),
                                SmallText(text: "With ceaser souce"),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndTextWidget(icon: Icons.circle_sharp,
                                        text: "Normal",
                                        iconColor: Colors.orangeAccent),
                                    IconAndTextWidget(icon: Icons.location_on,
                                        text: "1.4km",
                                        iconColor: Colors.blueAccent),
                                    IconAndTextWidget(icon: Icons.access_time_rounded,
                                        text: "30min",
                                        iconColor: Colors.redAccent)
                                  ],

                                )
                              ],
                            ),
                          )
                        ),
                      )
                    ],
                  ),
                );
              }),

        //list of food and images


      ],
    );
  }




  Widget _buildPageItem(int index){
    Matrix4 matrix=new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans,0);

    }else if(index==_currPageValue.floor()+1){
      var currScale=_scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;

      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans,0);

    }else if(index==_currPageValue.floor()-1){
      var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;

      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans,0);

    }else{
      var currScale=0.8;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);

    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:index.isEven? Color(0xFF69c5df):Color(0xFF9294cc),
                image: DecorationImage(
                    fit:BoxFit.cover,
                    image: AssetImage(
                        "assets/images/food1.jpg"
                    )
                )
            ),

          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: 30,right: 30,bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0,5)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5,0)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(5,0)
                    )
                  ]
                      ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15,left: 15,right: 15),
                child:AppColumn(text:"Chinese side"),
              ),
                  ),

            )
      ],
      ),
    );
  }
}
