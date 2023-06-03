import 'package:authentify/main.dart';
import 'package:authentify/scan.dart';
import 'package:flutter/material.dart';

class Congo extends StatefulWidget {
  String code;
  Congo(this.code);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CongoState();
  }
}

class CongoState extends State<Congo> {
  void goToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (_) => MyHomePage(
                title: 'Authentify',
              )),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Authentify"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => MyHomePage(title: 'Authentify'))),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(50),
              child: Center(
                child: Image.asset('images/congratulations.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Congratulations !!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => AlertDialog(
                          title: Text('QR Info'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                Text(widget.code),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.info,
                      color: Colors.blue,
                    ),
                  ),
                ],
              )),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text('You have chosen a genuine product'),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.qr_code_scanner),
            onPressed: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Scanner(),
                ))),
      ),
    );
  }
}
