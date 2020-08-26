import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'helper.dart';
import 'home_page.dart';


class Asad extends StatefulWidget {
  @override
  _AsadState createState() => _AsadState();
}

class _AsadState extends State<Asad> {

  @override
  Widget build(BuildContext context) {

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

    setState(() {
      _checkNetwork();
    });

    return SafeArea(
      child: WebviewScaffold(


        url: "http://beautyshopbd.info/",

        withZoom: true,
        withLocalStorage: true,
        hidden: true,
        initialChild: Container(
          color: Color(Helper.getHexToInt("#58EAF8")),
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

              new IconButton(icon: Icon(FontAwesomeIcons.home, color: Color(Helper.getHexToInt("#E9003D")),),
                  onPressed:()async{

                  var value = await _checkNetwork();

                    if(value){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Asad()),);
                    }
                    else{
                      _showToast();
                    }

                  }),
              FlatButton(
                child: Text('Exit', style: TextStyle(color: Color(Helper.getHexToInt("#E9003D"))),),
                onPressed: (){
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),





//      body: Column(
//        children: <Widget>[
//
//          Center(child: Text('Net Status:',
//          style: TextStyle(fontSize: 28.0),
//          )),
//
//          Image.network('https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg'),
//
//        ],
//      ),
      ),
    );
  }
}
