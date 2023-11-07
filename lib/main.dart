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
    if (call.method != 'getJourneyResult') "";

    print("FinBox Bureau Result: ${call.arguments}");
  }

  @override
  Widget build(BuildContext context) {

    // Setting Result Handler
    FinBoxBureauPlugin.platform.setMethodCallHandler(_handleBureauResult);

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
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
