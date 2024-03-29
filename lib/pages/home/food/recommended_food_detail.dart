

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/widgets/app_icon.dart';
import 'package:fooddelivery/widgets/big_text.dart';

import '../../../utils/dimensions.dart';
import '../../../widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(

                child: Center(child: BigText(size: Dimensions.font26,text: "Chinese Side",),),
                width: double.maxFinite,
                padding: EdgeInsets.only(top:5,bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20),

                )
              ),
              ),
//                margin: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20),
            ),
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/food1.jpg",
              width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(

                  child: ExpandableTextWidget(text:"Ingredients: Chicken, Soy Souce, Garlic, Ginger, Sesame seeds and green olives,Ingredients: Chicken, Soy Souce, Garlic, Ginger, Sesame seeds and green olives ,Ingredients: Chicken, Soy Souce, Garlic, Ginger, Sesame seeds and green olives ,Ingredients: Chicken, Soy Souce, Garlic, Ginger, Sesame seeds and green olives ,Ingredients: Chicken, Soy Souce, Garlic, Ginger, Sesame seeds and green olives ,Ingredients: Chicken, Soy Souce, Garlic, Ginger, Sesame seeds and green olives ,Ingredients: Chicken, Soy Souce, Garlic, Ginger, Sesame seeds and green olives ,Ingredients: Chicken, Soy Souce, Garlic, Ginger, Sesame seeds and green olives ,Ingredients: Chicken, Soy Souce, Garlic, Ginger, Sesame seeds and green olives ,Ingredients: Chicken, Soy Souce, Garlic, Ginger, Sesame seeds and green olives ,Ingredients: Chicken, Soy Souce, Garlic, Ginger, Sesame seeds and green olives ,Ingredients: Chicken, Soy Souce, Garlic, Ginger, Sesame seeds and green olives ,"),
                  margin: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20),
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                AppIcon(
                  iconSize: Dimensions.iconSize24,
                    iconColor:Colors.white,
                    backgroundColor:Colors.blue,
                    icon: Icons.remove),
                BigText(text:"\$12.88"+" x "+"0", color: Colors.black, size: Dimensions.font26,),
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor:Colors.white,
                    backgroundColor:Colors.blue,
                    icon: Icons.add),


              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHightBar,
            padding:EdgeInsets.only(top:Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(

                  topLeft: Radius.circular(Dimensions.radius20*2),
                  topRight: Radius.circular(Dimensions.radius20*2),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top:Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top:Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),

                  child: BigText(text: "\$12.88 | Add to cart",color: Colors.white,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.blue
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
