import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class Refer extends StatelessWidget {
  const Refer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'อ้างอิง',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const Text(
            'สำนักงานคณะกรรมการอาหารและยา กระทรวงสาธารณสุข. (2510).',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const Text(
            'พระราชบัญญัติยา พ.ศ.2510 และฉบับแก้ไขเพิ่มเติม.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          const Text(
            'เข้าถึงได้จาก',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: GestureDetector(
              onTap: () {
                js.context.callMethod(
                  'open',
                  [
                    'https://www.fda.moph.go.th/sites/drug/SitePages/AD-Rule01.aspx'
                  ],
                );
              },
              child: const Text(
                'https://www.fda.moph.go.th/sites/drug/SitePages/AD-Rule01.aspx',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
