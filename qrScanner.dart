import 'package:flutter/material.dart';
import 'package:flutter_application_1/result_screen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _pageOneState();
}

class _pageOneState extends State<PageOne> {
  bool isScanCompleted = false;

  void closScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 1"),
      ),
      // bottomNavigationBar: navigationBar(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Place QR code"),
                  Text("Scanning will be automatic"),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: MobileScanner(
                onDetect: (barcodes) {
                  if (!isScanCompleted) {
                    String code = barcodes.rawValue ?? '...';
                    isScanCompleted = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          //   closeScreen: closeScreen,
                          code: code,
                        ),
                      ),
                    );
                  }
                },
                // allowDuplicates: true,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return ResultScreen();
            //         },
            //       ),
            //     );
            //   },
            //   child: Text("Scan QR-code"),
            // ),
          ],
        ),
      ),
    );
  }
}

extension on BarcodeCapture {
  get rawValue => null;
}

// class navigationBar extends StatelessWidget {
//   const navigationBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Asosiy',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.add_box),
//           label: 'Qo`shish',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Kabinet',
//         ),
//       ],
//     );
//   }
// }
