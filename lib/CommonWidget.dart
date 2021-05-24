
import 'package:flutter/material.dart';
import 'package:grocery/AppManager/appColors.dart';
import 'package:shimmer/shimmer.dart';

class CommonWidget {

  TextEditingController instructionsC=TextEditingController();
  bool startValidation=false;
 // final _formKey = GlobalKey<FormState>();




  onScreenLogo(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(40,0,40,0),
      child: SizedBox(
          height: 320,
          child: Column(
            children: [
              Expanded(child: Image(image: AssetImage('assets/logo.png'),)),
              Text('Shopping',
                style: TextStyle(
                  color: AppColor.lightThemeColor,
                  fontSize: 25,
                ),),
            ],
          )),
    );
  }




  restaurantPic(){
    return  Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(0)),
              border: Border.all(color: Colors.grey[200],
                  width: 2),
              image: DecorationImage(
                  image: AssetImage('assets/catering.jpg'),
                  fit: BoxFit.cover
              )
          ),
        ),
        SizedBox(
            height: 80,
            child: Image(image: AssetImage('assets/smallSideLogo.jfif'),))
      ],
    );
  }


  customRadio({bool value}){
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.iconAndTextColor
        ),
      ),
      child: Visibility(
        visible: value?? false,
        child: Icon(Icons.check,
          color: AppColor.lightThemeColor,
          size: 15,),
      ),
    );
  }


  shimmerEffect({
    Widget child,
    bool shimmer,
  }){
    return (shimmer?? true)? Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: child
    ):child;
  }


  defaultText(){
    return 'RizqHub';
  }









}


convertToDouble(price){
  try
  {
    return double.parse(price.toString());
  }
  catch(NumberFormatException)
  {
    return 0.00;
  }
}