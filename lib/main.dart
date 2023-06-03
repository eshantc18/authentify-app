import 'package:authentify/scan.dart';
import 'package:authentify/unique.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:gif_view/gif_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Authentify'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Padding(
                padding: EdgeInsets.all(constraints.maxHeight * 0.05),
                child: Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.all(constraints.maxHeight * 0.025),
                    child: Text(
                      'We value you and value your money',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  elevation: 7,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.03,
              ),
              Text(
                'Scan QR code',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.07,
              ),
              Center(
                child: GifView.asset(
                  'images/qr-code.gif',
                  height: constraints.maxHeight * 0.3,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.07,
              ),
              Text('Check uniqueness of your chosen product'),
            ]);
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.qr_code_scanner),
          onPressed: () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Scanner(),
              ))),
    );
  }
}
