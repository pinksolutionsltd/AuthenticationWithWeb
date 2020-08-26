import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:authwebview/splash_screen.dart';
import 'package:authwebview/status.dart';


class CheckNetworkPage extends StatefulWidget {
  @override
  _CheckNetworkPageState createState() => _CheckNetworkPageState();
}

class _CheckNetworkPageState extends State<CheckNetworkPage> {

  StreamSubscription<DataConnectionStatus> listener;

  var Internetstatus = "Your Internet connection is poor...";
  bool getNet = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _updateConnectionStatus();
    CheckInternet();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    listener.cancel();
    super.dispose();
  }

  CheckInternet() async {
    // Simple check to see if we have internet
    print("The statement 'this machine is connected to the Internet' is: ");
    getNet = await DataConnectionChecker().hasConnection;
    print(getNet.toString());
    // returns a bool

    // We can also get an enum instead of a bool
    print("Current status: ${await DataConnectionChecker().connectionStatus}");
    // prints either DataConnectionStatus.connected
    // or DataConnectionStatus.disconnected

    // This returns the last results from the last call
    // to either hasConnection or connectionStatus
    print("Last results: ${DataConnectionChecker().lastTryResults}");

    // actively listen for status updates
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          Internetstatus="Connectd TO THe Internet";
          print('Data connection is available.');
          setState(() {

          });
          break;
        case DataConnectionStatus.disconnected:
          Internetstatus="Your data connectivity lost.\n Please Try Again!";
          print('You are disconnected from the internet.');
          setState(() {

          });
          break;
      }
    });

    // close listener after 30 seconds, so the program doesn't run forever
//    await Future.delayed(Duration(seconds: 30));
//    await listener.cancel();
    return await await DataConnectionChecker().connectionStatus;
  }



  @override
  Widget build(BuildContext context) {
    if(getNet)
      return SplashScreen();
    return Status(internetStatus: Internetstatus);
  }
}



//Scaffold(
//appBar: AppBar(
//title: Text("Data Connection Checker"),
//),
//body: Container(
//child: Center(
//child: Text("$Internetstatus"),
//),
//),
//);