import 'package:finbox_bureau_plugin/finbox_bureau_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bureau Connect Flutter Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bureau Connect Flutter Sample Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _startBureauConnect() {

    var apiKey = "YOUR_API_KEY";
    var environment = "UAT";
    var customerID = "owsngo93u9gb";
    var firstName = "Test";
    var middleName = "";
    var lastName = "User";
    var phoneNumber = "0000000000";

    FinBoxBureauPlugin.initSdk(
        environment,
        apiKey,
        customerID,
        firstName,
        middleName,
        lastName,
        phoneNumber
    );

    FinBoxBureauPlugin.startBureauJourney();
  }

  static Future<void> _handleBureauResult(MethodCall call) async {
    if (call.method != 'getBureauJourneyResult') {
      return;
    }

    print("FinBox Bureau Result: ${call.arguments}");
  }

  @override
  Widget build(BuildContext context) {

    // Setting Result Handler
    FinBoxBureauPlugin.platform.setMethodCallHandler(_handleBureauResult);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
              ),
              onPressed: _startBureauConnect,
              child: Text('Start'),
            )
          ],
        ),
      ),
    );
  }
}
