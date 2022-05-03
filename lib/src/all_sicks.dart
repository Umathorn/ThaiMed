import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thaimed/src/detail_sick.dart';

class AllSicks extends StatefulWidget {
  const AllSicks({Key? key}) : super(key: key);

  @override
  State<AllSicks> createState() => _AllSicksState();
}

class _AllSicksState extends State<AllSicks> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: searchText == ''
                    ? FirebaseFirestore.instance.collection('sicks').snapshots()
                    : FirebaseFirestore.instance
                        .collection('sicks')
                        .where(
                          'sickname',
                          isGreaterThanOrEqualTo: searchText,
                        )
                        .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!.docs;
                    return data.isEmpty
                        ? const SizedBox.shrink()
                        : Column(
                            children: [
                              const Text(
                                'อาการป่วย',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 32),
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                ),
                                padding: EdgeInsets.zero,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailSicks(
                                                  data: data[index]))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'lib/asset/allsick/${data[index]['sickname']}.png',
                                          ),
                                          Text(
                                            data[index]['sickname'],
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
