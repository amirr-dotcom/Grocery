
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/AppManager/appColors.dart';
import 'package:grocery/AppManager/widgets/MyAppBar.dart';
import 'package:grocery/AppManager/widgets/textField2.dart';
import 'package:grocery/CommonWidget.dart';
import 'package:grocery/pages/DashboardModal.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  List bannerDetails=[];
  List categoryData=[];
  List trendingData=[];
  List dealsData=[];
  var _current=0;

  DashboardModal modal=DashboardModal();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get() async{
    cleaAll();
   await getBanner();
   await getCategory();
   await getTrendingData();
   await getDeals();
  }

  cleaAll(){
    bannerDetails.clear();
    categoryData.clear();
    trendingData.clear();
    dealsData.clear();
    setState(() {

    });
  }

  getBanner() async{
    var data= await modal.getBanner(context);
    // print(data);
    if(data!=null){
      bannerDetails=data;
    }
    setState(() {

    });
  }

  getCategory() async{
    var data= await modal.getCategory(context);
   // print(data);
    if(data!=null){
      categoryData=data;
    }
    setState(() {

    });
  }

  getTrendingData() async{
    var data= await modal.getTrendingData(context);
    print(data);
    if(data!=null){
      trendingData=data;
    }
    setState(() {

    });
  }

  getDeals() async{
    var data= await modal.getDeals(context);
   // print(data);
    if(data!=null){
      dealsData=data;
    }
    setState(() {

    });
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.lightThemeColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.greyWhite,
          appBar: MyWidget().myAppBar(
            context: context,
            leadingIcon: IconButton(icon: Icon(Icons.list,
            color: Colors.white,), onPressed: (){

            }),
            title: MyTextField2(
              hintText: 'Search Product',
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0,1,1,1),
                child: Container(
                  color: AppColor.greyWhite,
                  child: Icon(Icons.search,
                  color: Colors.grey,),
                ),
              ),
            ),
            action: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    IconButton(icon: Icon(Icons.shopping_cart,
                      color: Colors.white,), onPressed: (){

                    }),
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 8,
                        child: Text('0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ),
          body: RefreshIndicator(
            onRefresh: ()async{
              await get();

            },
            child: ListView(
              children: [
                SizedBox(height: 10,),
                carousel(),
                SizedBox(height: 20,),
                dataField(
                  title: 'SHOP BY CATEGORY',
                  child:  listData(categoryData),),
                SizedBox(height: 30,),
                dataField(
                  title: 'Trending Product',
                  child:     trendingListData(trendingData),),
                SizedBox(height: 30,),
                dataField(
                  title: 'DEALS',
                  child:     dealsList(dealsData),),
                SizedBox(height: 30,),
                storeInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }



  dataField({String title,
  Widget child}){
    return      Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,10,0,10),
            child: Text(title.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                height: 5,
                width: 20,
              ),
              SizedBox(width: 5,),
              Container(
                color: Colors.blue,
                height: 5,
                width: 50,
              ),
              SizedBox(width: 5,),
              Container(
                color: Colors.blue,
                height: 5,
                width: 20,
              ),
            ],
          ),
          SizedBox(height: 10,),
          child,
          SizedBox(height: 20,),
        ],
      ),
    );
  }


  carousel(){
    return Column(
      children: [
        CommonWidget().shimmerEffect(
            child: CarouselSlider(
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    viewportFraction: 1.0,
                    height: 150.0,
                    autoPlay: true),
                items: List.generate(bannerDetails.isEmpty? 5:bannerDetails.length, (i){
                  var image=bannerDetails.isEmpty? '':bannerDetails[i]['image'];
                  return  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            border: Border.all(color: Colors.grey[200],
                                width: 2),
                            image: DecorationImage(
                                image: bannerDetails.isEmpty? AssetImage('assets/logo.png'):NetworkImage(image),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(bannerDetails.isEmpty? 'Title':bannerDetails[i]['title'],
                            style: TextStyle(
                              color: Colors.black,
                            ),),
                          ),
                          Visibility(
                            visible: i==1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(onPressed: (){},
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.blue),
                                    child: Text('SHOP NOW',style: TextStyle(
                                  color: Colors.white
                                ),)),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  );
                })
            ),
            shimmer: bannerDetails.isEmpty
        ),

        CommonWidget().shimmerEffect(
          shimmer: bannerDetails.isEmpty,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(bannerDetails.isEmpty? 2:bannerDetails.length, (index) {

                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Colors.grey[800]
                        : Colors.grey[400],
                  ),
                );
              })
          ),
        ),
      ],
    );
  }

  listData(List list){
    return ListView.builder(
        itemCount: list.isEmpty? 5:list.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context,index){
      return    Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [new BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),]
          ),
          child: CommonWidget().shimmerEffect(
            shimmer: list.isEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      border: Border.all(color: Colors.grey[200],
                          width: 2),
                      image: DecorationImage(
                          image: list.isEmpty? AssetImage('assets/logo.png'):NetworkImage(list[index]['image']),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8,8,8,20),
                  child: Text(list.isEmpty? 'Grocery':list[index]['title'].toString(),
                  style: TextStyle(
                    color: Colors.grey[600]
                  ),),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  trendingListData(List list){
    return ListView.builder(
        itemCount: list.isEmpty? 5:list.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context,index){
          return    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),]
              ),
              child: CommonWidget().shimmerEffect(
                shimmer: list.isEmpty,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0,),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            border: Border.all(color: Colors.grey[200],
                                width: 2),
                            image: DecorationImage(
                                image: list.isEmpty? AssetImage('assets/logo.png'):NetworkImage(list[index]['thumbnail']),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8,20,8,20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Column(
                              children: [
                                Text(list.isEmpty? 'Grocery':list[index]['title'].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),),
                                SizedBox(height: 10,),
                                Text(list.isEmpty? '00':list[index]['capacity'].toString(),
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                  ),),
                                SizedBox(height: 10,),
                                Text(list.isEmpty? '0.00':list[index]['originalPrice'].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),),
                              ],
                            ),
                            TextButton(onPressed: (){},
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue),
                                child: Text('ADD TO CART',style: TextStyle(
                                    color: Colors.white
                                ),)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }


  dealsList(List list){
    return ListView.builder(
        itemCount: list.isEmpty? 5:list.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context,index){
          return    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),]
              ),
              child: CommonWidget().shimmerEffect(
                shimmer: list.isEmpty,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          border: Border.all(color: Colors.grey[200],
                              width: 2),
                          image: DecorationImage(
                              image: list.isEmpty? AssetImage('assets/logo.png'):NetworkImage(list[index]['image']),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,8,8,20),
                      child: Column(
                        children: [
                          Text(list.isEmpty? 'Grocery':list[index]['title'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),),
                          SizedBox(height: 10,),
                          Text(list.isEmpty? 'Grocery':list[index]['category']['title'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey[600],
                              fontSize: 12
                            ),),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          );
        });
  }



  storeInfo(){
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('STORE INFORMATION',
            style: TextStyle(
              color: Colors.grey[800]
            ),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.location_on_sharp),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Text('VoyCode Grocery',
                      style: TextStyle(
                      ),),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.call),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Text('Call: +49 774246273',
                      style: TextStyle(
                      ),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Text('Email: info@voyocode.com',
                      style: TextStyle(
                      ),),
                  ),
                ],
              ),
            ),
            Text('USEFUL LINKS',
              style: TextStyle(
                  color: Colors.grey[800]
              ),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('About Us',
                style: TextStyle(
                ),),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Privacy Policy',
                style: TextStyle(
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Terms & Conditions',
                style: TextStyle(
                ),),
            ),
          ],
        ),
      ),
    );
  }



}
