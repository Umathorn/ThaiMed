import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thaimed/src/add_data.dart';
import 'package:thaimed/src/edit_drug.dart';
import '../app_color.dart';
import 'detail_drug.dart';

class Admin extends StatefulWidget {
  static const String route = '/admin';
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String searchText = '';
  String type = 'ยาทั้งหมด';
  bool canEdit = true;
  bool isAdmin = false;
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: isAdmin
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  isAdmin = false;
                });
              },
              child: const Icon(Icons.logout),
            )
          : null,
      body: isAdmin
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: type == 'ยาทั้งหมด'
                                ? APPColor.primary
                                : Colors.grey,
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
                            primary: type == 'ยาหอม'
                                ? APPColor.primary
                                : Colors.grey,
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
                            primary: type == 'ยาแก้ไข้'
                                ? APPColor.primary
                                : Colors.grey,
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
                            primary: type == 'ยาแก้ไอ'
                                ? APPColor.primary
                                : Colors.grey,
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
                            primary: type == 'ยาถอนพิษ'
                                ? APPColor.primary
                                : Colors.grey,
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
                          primary: type == 'ยาแก้ตัวร้อน'
                              ? APPColor.primary
                              : Colors.grey,
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
                          primary:
                              type == 'ยาถ่าย' ? APPColor.primary : Colors.grey,
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
                          primary: type == 'ยาแก้กษัย'
                              ? APPColor.primary
                              : Colors.grey,
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
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (type == 'ยาทั้งหมด')
                            SizedBox(
                              width: size.width,
                              height: 100,
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
                                  labelText: "ค้นหาขนานยา",
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
                                        .where('name',
                                            isGreaterThanOrEqualTo: searchText)
                                        .where('name',
                                            isLessThanOrEqualTo:
                                                searchText + '\uf7ff')
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
                                                      onTap: () =>
                                                          Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              DetailDrug(
                                                                  data: data[
                                                                      index]),
                                                        ),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Center(
                                                            child: Image.memory(
                                                              base64Decode(data[
                                                                      index]
                                                                  ['image']),
                                                              gaplessPlayback:
                                                                  true,
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                data[index][
                                                                        'number'] +
                                                                    '. ' +
                                                                    data[index][
                                                                        'name'],
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  IconButton(
                                                                    color: Colors
                                                                        .orange,
                                                                    onPressed:
                                                                        () {
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              EditDrug(
                                                                            data:
                                                                                data[index],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .edit,
                                                                    ),
                                                                  ),
                                                                  IconButton(
                                                                    color: Colors
                                                                        .red,
                                                                    onPressed:
                                                                        () async {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                const Text(
                                                                              'ยืนยันการลบข้อมูลตัวยา',
                                                                            ),
                                                                            actions: <Widget>[
                                                                              ElevatedButton(
                                                                                style: ElevatedButton.styleFrom(primary: Colors.red),
                                                                                onPressed: () {
                                                                                  Navigator.pop(context, false);
                                                                                },
                                                                                child: const Text('ยกเลิก'),
                                                                              ),
                                                                              ElevatedButton(
                                                                                style: ElevatedButton.styleFrom(primary: Colors.green),
                                                                                onPressed: () {
                                                                                  Navigator.pop(context, true);
                                                                                },
                                                                                child: const Text('ยืนยัน'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ).then(
                                                                          (value) async {
                                                                        if (value) {
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection('drugs')
                                                                              .doc(data[index].id)
                                                                              .delete();
                                                                          Fluttertoast
                                                                              .showToast(
                                                                            webBgColor:
                                                                                "linear-gradient(to right, #66bb6a, #66bb6a)",
                                                                            msg:
                                                                                'ลบข้อมูลตัวยาเรียบร้อยแล้ว',
                                                                            webPosition:
                                                                                "center",
                                                                            timeInSecForIosWeb:
                                                                                3,
                                                                          );
                                                                        }
                                                                      });
                                                                    },
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .delete),
                                                                  )
                                                                ],
                                                              )
                                                            ],
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
                                  child: CircularProgressIndicator());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(
              width: size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
                child: Column(
                  children: [
                    Image.asset(
                      'lib/asset/logo.jpg',
                      width: size.width * 0.2,
                    ),
                    TextFormField(
                      controller: username,
                      decoration: InputDecoration(
                        labelText: "กรุณาระบุชื่อผู้ดูแลระบบ",
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
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: password,
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        labelText: "กรุณาระบุรหัสผ่าน",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(hidePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
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
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: APPColor.primary),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'กลับสู่หน้าเว็บไซต์',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        const SizedBox(width: 24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: APPColor.primary),
                          onPressed: () {
                            if (username.text == 'admin' &&
                                password.text == 'admin') {
                              setState(() {
                                isAdmin = true;
                              });
                              username.clear();
                              password.clear();
                            } else {
                              setState(() {
                                isAdmin = false;
                              });
                              password.clear();
                              Fluttertoast.showToast(
                                webBgColor:
                                    "linear-gradient(to right, #66bb6a, #66bb6a)",
                                msg: 'กรุณาตรวจสอบรหัสผ่านอีกครั้ง',
                                webPosition: "center",
                                timeInSecForIosWeb: 3,
                              );
                            }
                          },
                          child: const Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
