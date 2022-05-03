import 'package:flutter/material.dart';
import 'package:thaimed/src/data/store_data.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class AllStores extends StatelessWidget {
  const AllStores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              StoreData().data.length,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/asset/stores/${StoreData().data[index]['name'].toString()}.png',
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Text(
                    '${StoreData().data[index]['name']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'ที่อยู่ : ${StoreData().data[index]['address']}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    'เบอร์ติดต่อ : ${StoreData().data[index]['phone']}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    'เวลาทำการ : ${StoreData().data[index]['open']}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'แผนที่ : ',
                        style: TextStyle(fontSize: 24),
                      ),
                      GestureDetector(
                        onTap: () {
                          js.context.callMethod(
                            'open',
                            [StoreData().data[index]['location']],
                          );
                        },
                        child: Text(
                          StoreData().data[index]['location'].toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
