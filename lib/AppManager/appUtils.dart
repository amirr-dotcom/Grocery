

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_indicators/progress_indicators.dart';

import 'appColors.dart';


var baseUrl='https://rg-api.voycode.com/';
var newBaseUrl='http://rizqhub.com/Merchants_Api/';
var imageUrl='http://rizqhub.com/';
var secretMapKey='AIzaSyC-Y5wnPBoFpwCbMyG9whRurIA9YtEkTNE';





class App
{

  var canEnterApiDialogue=true;

  var canceledByUser=false;

  api(url,body,context,{bool  useNew})
  async {
    canceledByUser=false;
    canEnterApiDialogue=true;
    while(true)
    {
      if(canceledByUser)
      {
        return {'status':'fail', 'msg':'Try again'};
      }
      try{
        var response = await http.post(
            Uri.parse((baseUrl)+url),
            body: body
        );
        var data = json.decode(response.body);
        // print(data);
        if(!canEnterApiDialogue)
        {
          canEnterApiDialogue=true;
          Navigator.of(context).pop();
        }
        if(data is List){
          return data[0];
        }
        else{
          return data;
        }
      }
      on SocketException {
        print('No Internet connection');

        if(canEnterApiDialogue)
        {
          canEnterApiDialogue=false;
          showDialogueApi(context, 'Alert', 'Internet connection issue, trying to reconnect.');
        }
        // return res;
      }
      on TimeoutException catch (e) {
        print('Time Out'+e.toString());
        if(canEnterApiDialogue)
        {
          canEnterApiDialogue=false;
          showDialogueApi(context, 'Alert', 'Time Out, plz check your connection');
        }
        //  return res;
      }
      catch (e) {
        print('Error in Api: $e');
        if(canEnterApiDialogue)
        {
          canEnterApiDialogue=false;
          showDialogueApi(context, 'Alert', 'Some Error Occur, plz check your connection');
        }
        // return res;
      }
    }

  }
  apiWithoutAT(url,body)
  async {
    var response = await http.post(
        Uri.parse((baseUrl)+url),
        body: body
    );
    var data = json.decode(response.body);
    // print(data);
    if(data is List){
      return data[0];
    }
    else{
      return data;
    }
  }

  getApi(url,context)
  async {
    canceledByUser=false;
    canEnterApiDialogue=true;
    while(true)
    {
      if(canceledByUser)
      {
        return {'status':'fail', 'msg':'Try again'};
      }
      try{
        var response = await http.get(
          Uri.parse((baseUrl)+url),
        );
       // print(response.body);
        var data = json.decode(response.body);
        // print(data);
        if(!canEnterApiDialogue)
        {
          canEnterApiDialogue=true;
          Navigator.of(context).pop();
        }
        if(data is List){
          return data;
        }
        else{
          return data;
        }

      }
      on SocketException {
        print('No Internet connection');

        if(canEnterApiDialogue)
        {
          canEnterApiDialogue=false;
          showDialogueApi(context, 'Alert', 'Internet connection issue, trying to reconnect.');
        }
        // return res;
      }
      on TimeoutException catch (e) {
        print('Time Out '+e.toString());
        if(canEnterApiDialogue)
        {
          canEnterApiDialogue=false;
          showDialogueApi(context, 'Alert', 'Time Out, plz check your connection');
        }
        //  return res;
      }
      catch (e) {
        print('Error in Api: $e');
        if(canEnterApiDialogue)
        {
          canEnterApiDialogue=false;
          showDialogueApi(context, 'Alert', 'Some Error Occur, plz check your connection');
        }
        // return res;
      }
    }
  }

  showDialogueApi(BuildContext context,alert , msg){
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(alert,
            style: TextStyle(
                color: AppColor.lightThemeColor,
                fontSize: 15.0
            ),),
          content: Text(msg,
            style: TextStyle(
                fontSize: 15.0
            ),),
          actions: <Widget>[
            TextButton(
              child: Text('cancel',
                style: TextStyle(
                    color: AppColor.lightThemeColor,
                    fontSize: 15.0
                ),),
              onPressed: () {
                canceledByUser=true;
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('retry',
                style: TextStyle(
                    color: AppColor.lightThemeColor,
                    fontSize: 15.0
                ),),
              onPressed: () {
                canEnterApiDialogue=true;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  navigate(context,route){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
    {
      return route;
    }));
  }



  progressIndicator(isLoading,msg)
  {
    return Visibility(
      visible: isLoading,
      child: Container(
        color: Colors.black54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 30,),
                Expanded(
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30,15,30,15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeartbeatProgressIndicator(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    height: 20,
                                    child: Image(image: AssetImage('assets/logo.png'),)),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              child: Text(msg,
                                style: TextStyle(
                                    color: AppColor.lightThemeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30,),
              ],
            ),
          ],
        ),
      ),
    );
  }

  loader(isLoading)
  {
    return Visibility(
      visible: isLoading,
      child: Container(
        color: Colors.black54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogue(BuildContext context,alert , msg){
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(alert,
            style: TextStyle(
                color: AppColor.lightThemeColor,
                fontSize: 15
            ),),
          content: Text(msg.toString()),
          actions: <Widget>[
            TextButton(
              child: Text('Okay',
                style: TextStyle(
                    color: AppColor.lightThemeColor,
                    fontSize: 15
                ),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  showDialogueAsWidget(BuildContext context,widget){
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            widget
                          ],
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        );
      },
    );
  }







}