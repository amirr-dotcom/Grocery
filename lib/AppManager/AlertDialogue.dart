
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:grocery/AppManager/appColors.dart';


class AlertDialogue {
  final MyAlertDialogueController pressController = Get.put(MyAlertDialogueController ());






  show(context,alert,msg,
      {
        String firstButtonName,
        Function firstButtonPressEvent,
        String  secondButtonName,
        Function secondButtonPressEvent,
        bool showCancelButton,
        bool showOkButton,
        bool disableDuration,
        bool checkIcon
      }
      ){
    pressController.changeValue(true );
    if(pressController.readValue().value){
      var canPressOk=true;
      pressController.changeValue(false);
      return Flushbar(
        // title: "Hey Ninja",
        // message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        flushbarPosition: FlushbarPosition.BOTTOM,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.elasticOut,
        backgroundColor: Colors.white,
        // boxShadows: [BoxShadow(color: Colors.blue[800], offset: Offset(0.0, 2.0), blurRadius: 3.0)],
        // backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
        isDismissible: true,
        duration: disableDuration?? false? null:Duration(seconds: 4),
        borderColor: AppColor.lightThemeColor,
        //  leftBarIndicatorColor: Colors.blue[300],
        icon: Icon(
          checkIcon?? false? Icons.check:Icons.info_outline,
          color: AppColor.lightThemeColor,
        ),
        mainButton: Row(
          children: [
            Visibility(
              visible: showCancelButton?? false,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(8)
                ),
                onPressed: () {
                  if(canPressOk)
                  {
                    canPressOk=false;
                    pressController.changeValue(true);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: AppColor.lightThemeColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Visibility(
              visible: secondButtonName!=null,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(8)
                ),
                onPressed: () {
                  if(canPressOk)
                  {
                    canPressOk=false;
                    pressController.changeValue(true);
                    secondButtonPressEvent();
                  }
                },
                child: Text(
                  secondButtonName.toString(),
                  style: TextStyle(color: AppColor.lightThemeColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Visibility(
              visible: firstButtonName!=null,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(8)
                ),
                onPressed: () {
                  if(canPressOk)
                  {
                    canPressOk=false;
                    pressController.changeValue(true);
                    firstButtonPressEvent();
                  }
                },
                child: Text(
                  firstButtonName.toString(),
                  style: TextStyle(color: AppColor.lightThemeColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Visibility(
              visible: showOkButton?? false,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(0)
                ),
                onPressed: () {
                  if(canPressOk)
                  {
                    canPressOk=false;
                    pressController.changeValue(true);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: AppColor.lightThemeColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        // showProgressIndicator: true,
        progressIndicatorBackgroundColor: Colors.blueGrey,
        titleText: Text(
          alert,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16.0, color: AppColor.lightThemeColor, fontFamily: "ShadowsIntoLightTwo"),
        ),
        messageText: Text(
          msg,
          style: TextStyle(  fontWeight: FontWeight.bold,
              fontSize: 14.0, color: AppColor.customBlack, fontFamily: "ShadowsIntoLightTwo"),
        ),
      )..show(context).then((value)   {
        pressController.changeValue(true );
        canPressOk=false;
      });
    }
    else{
      print('ffffffffffffffffffff');
    }

  }

}



class MyAlertDialogueController extends GetxController {
  var canShowNewDialogue = true .obs;

  readValue(){
    return canShowNewDialogue;
  }

  changeValue(val){
    canShowNewDialogue=RxBool(val);
   //  print(canShowNewDialogue);
    // update();
  }


}



class AlertDialogue2 {






  show(context,alert,msg,
      {
        String firstButtonName,
        Function firstButtonPressEvent,
        String  secondButtonName,
        Function secondButtonPressEvent,
        bool showCancelButton,
        bool showOkButton,
        bool disableDuration,
        bool checkIcon
      }
      ){
    var canPressOk=true;
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return StatefulBuilder(
              builder: (context,setState)
              {
                return Transform.scale(
                  scale: a1.value,
                  child: Opacity(
                    opacity: a1.value,
                    child: WillPopScope(
                      onWillPop: (){
                        return Future.value(false);
                      },
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Container(
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(40,0,40,0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                color: AppColor.lightThemeColor,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                )
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    checkIcon?? false? Icons.check:Icons.info_outline,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 5,),
                                                  Expanded(
                                                    child: Text(alert.toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15
                                                      ),),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0,10,0,10),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(msg.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                                ),),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Visibility(
                                                    visible: showCancelButton?? false,
                                                    child: TextButton(
                                                      style: TextButton.styleFrom(
                                                          padding: EdgeInsets.all(8)
                                                      ),
                                                      onPressed: () {
                                                        if(canPressOk)
                                                        {
                                                          canPressOk=false;
                                                          Navigator.pop(context);
                                                        }
                                                      },
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(color: AppColor.lightThemeColor,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: secondButtonName!=null,
                                                    child: TextButton(
                                                      style: TextButton.styleFrom(
                                                          padding: EdgeInsets.all(8)
                                                      ),
                                                      onPressed: () {
                                                        if(canPressOk)
                                                        {
                                                          canPressOk=false;
                                                          secondButtonPressEvent();
                                                        }
                                                      },
                                                      child: Text(
                                                        secondButtonName.toString(),
                                                        style: TextStyle(color: AppColor.lightThemeColor,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: firstButtonName!=null,
                                                    child: TextButton(
                                                      style: TextButton.styleFrom(
                                                          padding: EdgeInsets.all(8)
                                                      ),
                                                      onPressed: () {
                                                        if(canPressOk)
                                                        {
                                                          canPressOk=false;
                                                          firstButtonPressEvent();
                                                        }
                                                      },
                                                      child: Text(
                                                        firstButtonName.toString(),
                                                        style: TextStyle(color: AppColor.lightThemeColor,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: showOkButton?? false,
                                                    child: TextButton(
                                                      style: TextButton.styleFrom(
                                                        padding: EdgeInsets.all(0)
                                                      ),
                                                      onPressed: () {
                                                        if(canPressOk)
                                                        {
                                                          canPressOk=false;
                                                          Navigator.pop(context);
                                                        }
                                                      },
                                                      child: Text(
                                                        'Ok',
                                                        style: TextStyle(color: AppColor.lightThemeColor,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return null;
        }).then((val){
      canPressOk=false;
    });
  }

}
