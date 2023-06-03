import 'package:authentify/fake.dart';
import 'package:authentify/main.dart';
import 'package:authentify/unique.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scanner extends StatefulWidget {
  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  MobileScannerController cameraController = new MobileScannerController();
  bool _screenOpened = true;

  void _screenClosed() {
    _screenOpened = true;
  }

  void _foundQRcode(Barcode barcode, MobileScannerArguments? args) {
    if (_screenOpened) {
      final String code = barcode.rawValue.toString();
      _screenOpened = false;
      (code.contains('hash'))
          ? Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Congo(code),
            ))
          : Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Fake(code),
            ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentify"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'Authentify'))),
        ),
        // actions: [
        // IconButton(
        //   onPressed: () => cameraController.switchCamera(),
        //   icon: ValueListenableBuilder(
        //     valueListenable: cameraController.cameraFacingState,
        //     builder: (context, state, child) {
        //       switch (state as CameraFacing) {
        //         case CameraFacing.front:
        //           return Icon(
        //             Icons.camera_front,
        //             color: Colors.white,
        //           );

        //         case CameraFacing.back:
        //           return Icon(
        //             Icons.camera_rear,
        //             color: Colors.white,
        //           );
        //       }
        //     },
        //   ),
        // ),
        // ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: constraints.maxWidth * 0.1,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.8,
                  width: constraints.maxWidth * 0.8,
                  child: MobileScanner(
                    allowDuplicates: true,
                    controller: cameraController,
                    onDetect: _foundQRcode,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.1,
                ),
              ],
            ),
            CircleAvatar(
              radius: 25,
              child: IconButton(
                onPressed: () => cameraController.toggleTorch(),
                icon: ValueListenableBuilder(
                  valueListenable: cameraController.torchState,
                  builder: (context, state, child) {
                    switch (state as TorchState) {
                      case TorchState.off:
                        return Icon(
                          Icons.flash_off,
                          color: Colors.white,
                        );

                      case TorchState.on:
                        return Icon(
                          Icons.flash_on,
                          color: Colors.yellow,
                        );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
