import 'package:flutter/material.dart';

void main() => runApp(PassbaseFlutterDemoApp());

class PassbaseFlutterDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // PassbaseSDK.initialize(
    //     publishableApiKey:
    //         "N45LCEcSc2DYazpaoU921VHB960pEdM7qqDhdT0OqIJU4gm6AzNfdlDWc9CW0EGC");

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VeriffDemoHomePage(),
    );
  }
}

class VeriffDemoHomePage extends StatefulWidget {
  VeriffDemoHomePage({Key? key}) : super(key: key);
  @override
  _VeriffDemoHomePageState createState() {
    // PassbaseSDK.prefillUserEmail = "testuser@yourproject.com"; //optional
    return _VeriffDemoHomePageState();
  }
}

class _VeriffDemoHomePageState extends State<VeriffDemoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('HELLO'),
//             PassbaseButton(
//               onFinish: (identityAccessKey) {
// // do stuff in case of success
//                 print(identityAccessKey);
//               },
//               onSubmitted: (identityAccessKey) {
// // do stuff in case of success
//                 print(identityAccessKey);
//               },
//               onError: (errorCode) {
// // do stuff in case of cancel
//                 print(errorCode);
//               },
//               onStart: () {
// // do stuff in case of start
//                 print("start");
//               },
//               width: 300,
//               height: 70,
//             ),
          ],
        ),
      ),
    );
  }
}
