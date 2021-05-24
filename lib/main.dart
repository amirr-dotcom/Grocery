import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/AppManager/appColors.dart';
import 'package:grocery/pages/Dashboard.dart';
import 'package:progress_indicators/progress_indicators.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {






  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

    print(
        "                  \n"
            "         _______  \n"
            "       /   __   | \n"
            "      /  /   |  | \n"
            "     /  /____|  | \n"
            "    /  /_____|  | \n"
            "   /  /      |  | \n"
            "  /__/       |__| \n"
            "                       \n"
            "   ________    ______  \n"
            "  |   __   |  /  /|  | \n"
            "  |  |  |  | /  / |  | \n"
            "  |  |  |  |/  /  |  | \n"
            "  |  |  |__/__/   |  | \n"
            "  |  |            |  | \n"
            "  |__|            |__| \n"
            "                 \n"
            "         (())  \n"
            "          __   \n"
            "         |  |  \n"
            "         |  |  \n"
            "         |  |  \n"
            "         |  |  \n"
            "         |  |  \n"
            "         |__|  \n"
            "                    \n"
            "   _____________    \n"
            "  |  | _______  |   \n"
            "  |  | ______|__|   \n"
            "  |  | |  |         \n"
            "  |  |   |  |       \n"
            "  |  |     |  |     \n"
            "  |__|       |__|   \n"
    );
    print(
        "                                        (())                    \n"
            "         _______   ________    ______    __    _____________    \n"
            "       /   __   | |   __   |  /  /|  |  |  |  |  | _______  |   \n"
            "      /  /   |  | |  |  |  | /  / |  |  |  |  |  | ______|__|   \n"
            "     /  /____|  | |  |  |  |/  /  |  |  |  |  |  | |  |         \n"
            "    /  /_____|  | |  |  |__/__/   |  |  |  |  |  |   |  |       \n"
            "   /  /      |  | |  |            |  |  |  |  |  |     |  |     \n"
            "  /__/       |__| |__|            |__|  |__|  |__|       |__|   \n"
    );
    get();
  }

  get() async{
    page();
  }



  page()
  async{
    Timer(
        Duration(seconds: 5),
            () =>
            pageRoute()
    );
  }



  var user;

  pageRoute() async{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return Dashboard();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.lightThemeColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(217, 217, 217, 1),
          body: Container(
            decoration: BoxDecoration(
              color: AppColor.lightThemeColor,
                // image: new DecorationImage(
                //   image: new AssetImage("assets/background.png"),
                //   fit: BoxFit.cover,
                // )
            ),
            child: Center(
              child: Column(

                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 150,
                            child: Image(image: AssetImage('assets/logo.png'),)),
                        SizedBox(height: 10,),
                        SizedBox(height: 10,),
                        Center(
                          child: JumpingText(
                            'Loading...',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 60,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
