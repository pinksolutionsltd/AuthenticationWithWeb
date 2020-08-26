import 'package:flutter/material.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';




class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: Colors.lightBlue,
              child: Text('Rotated Dailog'),
              onPressed: () async {
                await animated_dialog_box.showRotatedAlert(
                    title: Center(child: Text("Hello")), // IF YOU WANT TO ADD
                    context: context,
                    firstButton: MaterialButton(
                      // FIRST BUTTON IS REQUIRED
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      color: Colors.white,
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    secondButton: MaterialButton(
                      // OPTIONAL BUTTON
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      color: Colors.white,
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    icon: Icon(Icons.info_outline,color: Colors.red,), // IF YOU WANT TO ADD ICON
                    yourWidget: Container(
                      child: Text('This is my first package'),
                    ));
              },
            ),

          ],
        ),
      ),
    );
  }
}
