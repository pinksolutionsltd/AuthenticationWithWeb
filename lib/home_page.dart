import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:io';
import 'helper.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<bool> _checkNetwork()async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }


  _showToast() {
    Fluttertoast.showToast(
        msg: "Please Check Internet Connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(Helper.getHexToInt("#56E8F7")),
        textColor: Color(Helper.getHexToInt("#1565AB")),
        fontSize: 16.0,
    );
  }

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {

    setState((){
      _checkNetwork();
    });

      return SafeArea(
          child:WebviewScaffold(

            url: "http://texwearfashion.com/",

            withZoom: true,
            withLocalStorage: true,
            hidden: true,
            withJavascript: true,
            clearCache: false,
            clearCookies: false,
            initialChild: Container(
              color: Color(Helper.getHexToInt("#006A4E")),
              child: const Center(
                child: Text('Please Wait.....',
                  style: TextStyle(
                    fontSize: 28.0,
                      color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
              ),),


            bottomNavigationBar: new BottomAppBar(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[

                  FlatButton(
                    child: Icon(MdiIcons.arrowLeftBox ,
                      color: Color(Helper.getHexToInt("#006A4E")),
                      size: 30.0,),
                    onPressed: ()async{
                      await  flutterWebviewPlugin.goBack();
                    },
                  ),


                  FlatButton(
                    child: Icon(MdiIcons.closeBox,
                      color: Color(Helper.getHexToInt("#006A4E")),
                      size: 30.0,),

                    onPressed: (){
                      SystemNavigator.pop();
                    },
                  ),



                  FlatButton(
                    child: Icon(MdiIcons.arrowRightBox,
                      color: Color(Helper.getHexToInt("#006A4E")),
                      size: 30.0,),
                    onPressed: ()async{
                      await  flutterWebviewPlugin.goForward();
                    },
                  ),


                  FlatButton(
                    child: Icon(MdiIcons.phone,
                      color: Color(Helper.getHexToInt("#006A4E")),
                      size: 30.0,),
                    onPressed: (){

                    },
                  ),


                ],
              ),
            ),
          ),
        );


  }
}


//SystemNavigator.pop();