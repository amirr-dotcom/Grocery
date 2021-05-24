

import 'package:flutter/material.dart';
import 'package:grocery/AppManager/appColors.dart';

class MyWidget {

  myAppBar({
    context,
    elevation,
    leadingIcon,
    title,
    List<Widget> action,
}){
    return AppBar(
      elevation: elevation,
      leading: leadingIcon?? IconButton(
        icon: Icon(Icons.arrow_back,
        color: Colors.white,),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      title:  title?? Container(
        child: Text('ELMCH',
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      backgroundColor: AppColor.lightThemeColor,
      actions: action,
    );
  }

}