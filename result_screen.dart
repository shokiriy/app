import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResultScreen extends StatelessWidget {
  final String code;
  //final Function() closeScreen;

  const ResultScreen({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //  closeScreen();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text("QR result"),
            QrImageView.new(
              data: code,
              size: 150,
              version: QrVersions.auto,
            ),
            Text("$code"),
          ],
        ),
      ),
    );
  }
}
