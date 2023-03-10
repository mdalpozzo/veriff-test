import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veriff_flutter/veriff_flutter.dart';

import 'package:http/http.dart' as http;

void main() => runApp(VeriffFlutterDemoApp());

class VeriffFlutterDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            ElevatedButton(
                onPressed: () async {
                  // fetch session token
                  http.Response response = await http.post(
                    Uri.parse('https://stationapi.veriff.com/v1/sessions'),
                    headers: <String, String>{
                      'X-AUTH-CLIENT': '2522be5e-9c64-4457-b6a7-88183b084595'
                    },
                    body: jsonEncode({
                      "verification": {
                        "callback": "https://veriff.me",
                        "person": {
                          "firstName": "Marlin",
                          "lastName": "Dalpozzo",
                          "dateOfBirth": "1988-06-21",
                          "gender": "M"
                        },
                        "document": {
                          "type": "DRIVERS_LICENSE",
                          "country": "US"
                        },
                        "vendorData": "123456789"
                      }
                    }),
                  );

                  Map<String, dynamic> bodyDecoded = json.decode(response.body);

                  String sessionUrl = bodyDecoded['verification']['url'];

                  // https://developers.veriff.com/images/Veriff-SDK-Customization.pdf
                  Branding branding = Branding(
                    logo: AssetImage('assets/images/app_icon.png'),
                    background: '#00ff00',
                    onBackground: '#ff00ff',
                    // onBackgroundSecondary: "#00ff00",
                    // onBackgroundTertiary: "#ff00ff",
                    primary: '#ff7700',
                    onPrimary: '#ffffff',
                    // secondary: '#${Values.COLOR_FOREST.value.toRadixString(16)}',
                    // onSecondary: "#ff7700",
                    // outline: "#ff00ff",
                    error: '#ff0000',
                    success: "#00ff00",
                    buttonRadius: 32,
                    // fonts: fonts,
                  );

                  Configuration config = Configuration(sessionUrl, branding: branding);

                  Veriff veriff = Veriff();

                  try {
                    Result result = await veriff.start(config);
                    print(result.status);
                    print(result.error);
                  } on PlatformException catch (err) {
                    // handle exception
                    print('PlatformException: ${err.toString()}');
                  }
                },
                child: const Text('Start Veriff Process'))
          ],
        ),
      ),
    );
  }
}
