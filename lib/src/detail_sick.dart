import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thaimed/app_color.dart';
import 'package:thaimed/src/detail_drug.dart';

class DetailSicks extends StatelessWidget {
  const DetailSicks({
    Key? key,
    required this.data,
  }) : super(key: key);

  final QueryDocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var data = this.data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลอาการป่วย'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        data['sickname'],
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 24, 24),
                        child: Image.asset(
                          'lib/asset/allsick/${data['sickname']}.png',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.6,
                    child: RichText(
                      text: TextSpan(
                        text: 'เกิดจาก ',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: data['cause'],
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  if (data['sickname'] != 'ปวดประจำเดือน')
                    Image.asset(
                      'lib/asset/sicks/${data['sickname']}.png',
                      width: size.width * 0.4,
                    ),
                  const SizedBox(width: 24),
                  SizedBox(
                    width: size.width * 0.4,
                    child: Column(
                      children: [
                        const Text(
                          'รักษาได้โดยใช้ยา',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: List.generate(
                            data['drugs'].length,
                            (index) => StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('drugs')
                                  .where('name',
                                      isEqualTo: data['drugs'][index])
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return snapshot.data!.docs.isEmpty
                                      ? Text(
                                          data['drugs'][index],
                                          style: const TextStyle(fontSize: 32),
                                        )
                                      : InkWell(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailDrug(
                                                data: snapshot.data!.docs[0],
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            data['drugs'][index],
                                            style: const TextStyle(
                                              fontSize: 32,
                                              color: APPColor.primary,
                                            ),
                                          ),
                                        );
                                }
                                return Text(
                                  data['drugs'][index],
                                  style: const TextStyle(fontSize: 32),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
