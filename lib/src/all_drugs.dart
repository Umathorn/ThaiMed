import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thaimed/src/add_data.dart';
import 'package:thaimed/src/detail_sick.dart';
import '../app_color.dart';
import 'detail_drug.dart';

class AllDrugs extends StatefulWidget {
  const AllDrugs({Key? key}) : super(key: key);

  @override
  State<AllDrugs> createState() => _AllDrugsState();
}

class _AllDrugsState extends State<AllDrugs> {
  String searchText = '';
  String type = 'ยาทั้งหมด';
  bool canEdit = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 200),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        type == 'ยาทั้งหมด' ? APPColor.primary : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      type = 'ยาทั้งหมด';
                    });
                  },
                  child: const Text(
                    'ยาทั้งหมด',
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: type == 'ยาหอม' ? APPColor.primary : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      type = 'ยาหอม';
                    });
                  },
                  child: const Text(
                    'ยาหอม',
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        type == 'ยาแก้ไข้' ? APPColor.primary : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      type = 'ยาแก้ไข้';
                    });
                  },
                  child: const Text(
                    'ยาแก้ไข้',
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: type == 'ยาแก้ไอ' ? APPColor.primary : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      type = 'ยาแก้ไอ';
                    });
                  },
                  child: const Text(
                    'ยาแก้ไอ',
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: type == 'ยาแก้ท้องเสีย'
                        ? APPColor.primary
                        : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      type = 'ยาแก้ท้องเสีย';
                    });
                  },
                  child: const Text(
                    'ยาแก้ท้องเสีย',
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: type == 'ยาแก้ท้องขึ้น'
                        ? APPColor.primary
                        : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      type = 'ยาแก้ท้องขึ้น';
                    });
                  },
                  child: const Text(
                    'ยาแก้ท้องขึ้น',
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: type == 'ยาขับน้ำคาวปลา'
                        ? APPColor.primary
                        : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      type = 'ยาขับน้ำคาวปลา';
                    });
                  },
                  child: const Text(
                    'ยาขับน้ำคาวปลา',
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        type == 'ยาถอนพิษ' ? APPColor.primary : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      type = 'ยาถอนพิษ';
                    });
                  },
                  child: const Text(
                    'ยาถอนพิษ',
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:
                      type == 'ยาแก้ตัวร้อน' ? APPColor.primary : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    type = 'ยาแก้ตัวร้อน';
                  });
                },
                child: const Text(
                  'ยาแก้ตัวร้อน',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: type == 'ยาถ่าย' ? APPColor.primary : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    type = 'ยาถ่าย';
                  });
                },
                child: const Text(
                  'ยาถ่าย',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: type == 'ยาแก้กษัย' ? APPColor.primary : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    type = 'ยาแก้กษัย';
                  });
                },
                child: const Text(
                  'ยาแก้กษัย',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Visibility(
                visible: canEdit,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddData(),
                      ),
                    );
                  },
                  child: const Text(
                    'เพิ่มข้อมูลตัวยา',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (type == 'ยาทั้งหมด')
                  SizedBox(
                    width: size.width,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              searchText = '';
                            });
                          } else {
                            if (value == 'switchtoadmin') {
                              setState(() {
                                canEdit = true;
                                searchText = '';
                              });
                            } else {
                              setState(() {
                                searchText = value;
                              });
                            }
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "ค้นหาขนานยา/ค้นหาอาการป่วย",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (type != 'ยาทั้งหมด') const SizedBox(height: 100),
                StreamBuilder<QuerySnapshot>(
                  stream: type == 'ยาทั้งหมด'
                      ? searchText == ''
                          ? FirebaseFirestore.instance
                              .collection('drugs')
                              .orderBy('createAt', descending: false)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection('drugs')
                              .where('name', isGreaterThanOrEqualTo: searchText)
                              .where('name',
                                  isLessThanOrEqualTo: searchText + '\uf7ff')
                              .snapshots()
                      : FirebaseFirestore.instance
                          .collection('drugs')
                          .where('type', isEqualTo: type)
                          .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data!.docs;
                      return data.isEmpty
                          ? const SizedBox.shrink()
                          : data.isEmpty
                              ? Text('ไม่พบตัวยาในกลุ่ม$type')
                              : Column(
                                  children: [
                                    Text(
                                      'ตำรา$type',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 32),
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
                                                builder: (context) =>
                                                    DetailDrug(
                                                        data: data[index]),
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Image.memory(
                                                    base64Decode(
                                                        data[index]['image']),
                                                    gaplessPlayback: true,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Text(
                                                      data[index]['number'] +
                                                          '. ' +
                                                          data[index]['name'],
                                                      style: const TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
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
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                Visibility(
                  visible: searchText != '',
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('sicks')
                        .where(
                          'sickname',
                          isGreaterThanOrEqualTo: searchText,
                        )
                        .where('sickname',
                            isLessThanOrEqualTo: searchText + '\uf7ff')
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32),
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
                                                  builder: (context) =>
                                                      DetailSicks(
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
