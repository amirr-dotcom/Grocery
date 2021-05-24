

import 'package:grocery/AppManager/appUtils.dart';

class DashboardModal{

  App app=App();



  getBanner(context) async{
    print('ffffffffff');

    var data= await app.getApi('banners', context,);
    // print(data);
    if(data!=null)
    {
      // if(data['status']=='success' )
      // {
      //
      // }
      // else{
      //  // app.showDialogue(context, 'Alert', data['msg']);
      // }
    }

    return data;
  }



  getCategory(context) async{
    print('ffffffffff');

    var data= await app.getApi('categories/featured', context,);
    // print(data);
    if(data!=null)
    {
      // if(data['status']=='success' )
      // {
      //
      // }
      // else{
      //  // app.showDialogue(context, 'Alert', data['msg']);
      // }
    }

    return data;
  }



  getTrendingData(context) async{
    print('ffffffffff');
    var data= await app.getApi('products/featured', context,);
    // print(data);
    if(data!=null)
    {
      // if(data['status']=='success' )
      // {
      //
      // }
      // else{
      //  // app.showDialogue(context, 'Alert', data['msg']);
      // }
    }

    return data;
  }


  getDeals(context) async{
    print('ffffffffff');

    var data= await app.getApi('deals', context,);
    // print(data);
    if(data!=null)
    {
      // if(data['status']=='success' )
      // {
      //
      // }
      // else{
      //  // app.showDialogue(context, 'Alert', data['msg']);
      // }
    }

    return data;
  }

}