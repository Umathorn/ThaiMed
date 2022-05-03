import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailDrug extends StatelessWidget {
  const DetailDrug({
    Key? key,
    required this.data,
  }) : super(key: key);

  final QueryDocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var data = this.data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลยา'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: width * 0.15),
        child: Column(
          children: [
            Text(
              data['number'] + ' ' + data['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Image.memory(base64Decode(data['image'])),
            const Divider(
              thickness: 2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.2,
                  child: const Text(
                    'สรรพคุณ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: width * 0.5,
                  child: Text(
                    data['propertie'].replaceAll("\\n", "\n"),
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.2,
                  child: const Text(
                    'สูตรตำรับการทำยา',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: width * 0.5,
                  child: Text(
                    data['recipe'].replaceAll("\\n", "\n"),
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.2,
                  child: const Text(
                    'ขนาดและวิธีใช้',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: width * 0.5,
                  child: Text(
                    data['howto'].replaceAll("\\n", "\n"),
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.2,
                  child: const Text(
                    'ข้อควรระวัง',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: width * 0.5,
                  child: Text(
                    data['caution'].replaceAll("\\n", "\n"),
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
