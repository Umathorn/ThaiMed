import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class EditDrug extends StatefulWidget {
  const EditDrug({Key? key, required this.data}) : super(key: key);

  final QueryDocumentSnapshot data;

  @override
  _EditDrugState createState() => _EditDrugState();
}

class _EditDrugState extends State<EditDrug> {
  var item = [
    'ยาหอม',
    'ยาแก้ไข้',
    'ยาแก้ไอ',
    'ยาถ่าย',
    'ยาแก้ท้องเสีย',
    'ยาแก้ท้องขึ้น',
    'ยาขับน้ำคาวปลา',
    'ยาถอนพิษ',
    'ยาแก้ตัวร้อน',
    'ยาแก้กษัย',
    'อื่น ๆ'
  ];
  String type = 'ยาหอม';

  @override
  void initState() {
    super.initState();
    setState(() {
      name.text = widget.data['name'];
      image = widget.data['image'];
      type = widget.data['type'];
      number.text = widget.data['number'];
      propertie.text = widget.data['propertie'];
      recipe.text = widget.data['recipe'];
      howto.text = widget.data['howto'];
      caution.text = widget.data['caution'];
    });
  }

  String image = '';
  TextEditingController number = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController propertie = TextEditingController();
  TextEditingController recipe = TextEditingController();
  TextEditingController howto = TextEditingController();
  TextEditingController caution = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('แก้ไขข้อมูลขนานยา'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
          child: Column(
            children: [
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  var res = await getImage();
                  if (res != null) {
                    setState(() {
                      image = res;
                    });
                  }
                },
                child: Container(
                  height: 300,
                  width: 300,
                  color: image == '' ? Colors.grey : Colors.transparent,
                  child: Center(
                    child: image == ''
                        ? const Text(
                            'กรุณาเลือกรูปภาพขนานยา',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        : Image.memory(
                            base64Decode(image),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: number,
                decoration: InputDecoration(
                  labelText: "กรุณาใส่ ลำดับยา ที่ต้องการ",
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
              const SizedBox(height: 20),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "กรุณาใส่ ชื่อขนานยา ที่ต้องการ",
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
              const SizedBox(height: 20),
              DropdownButtonFormField(
                value: type,
                items: item
                    .map((label) => DropdownMenuItem(
                          child: Text(label.toString()),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  type = value.toString();
                },
                decoration: InputDecoration(
                  labelText: "กรุณาเลือกหมวดหมู่ของกลุ่มยา",
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
              const SizedBox(height: 20),
              TextFormField(
                controller: propertie,
                decoration: InputDecoration(
                  labelText: "กรุณาใส่สรรพคุณ",
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
              const SizedBox(height: 12),
              TextFormField(
                controller: recipe,
                decoration: InputDecoration(
                  labelText: "กรุณาใส่สูตรตำรับการทำยา",
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
              const SizedBox(height: 12),
              TextFormField(
                controller: howto,
                decoration: InputDecoration(
                  labelText: "กรุณาใส่ขนาดและวิธีใช้",
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
              const SizedBox(height: 12),
              TextFormField(
                controller: caution,
                decoration: InputDecoration(
                  labelText: "กรุณาใส่ข้อควรระวัง",
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
              const SizedBox(height: 20),
              loading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                'ยืนยันการแก้ไขข้อมูลตัวยา',
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red),
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: const Text('ยกเลิก'),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green),
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: const Text('ยืนยัน'),
                                ),
                              ],
                            );
                          },
                        ).then((value) async {
                          if (value) {
                            setState(() {
                              loading = true;
                            });
                            await FirebaseFirestore.instance
                                .collection('drugs')
                                .doc(widget.data.id)
                                .update({
                              'image': image,
                              'number': number.text,
                              'name': name.text,
                              'propertie': propertie.text,
                              'recipe': recipe.text,
                              'howto': howto.text,
                              'caution': caution.text,
                              'type': type,
                            });
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                              webBgColor:
                                  "linear-gradient(to right, #66bb6a, #66bb6a)",
                              msg: 'แก้ไขเรียบร้อยแล้ว',
                              webPosition: "center",
                              timeInSecForIosWeb: 3,
                            );
                          }
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'แก้ไขข้อมูลขนานยา',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  getImage() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxWidth: 500);
    if (image != null) {
      List<int> imageBytes = await image.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      return base64Image;
    } else {
      return null;
    }
  }
}
