import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thaimed/app_color.dart';
import 'package:thaimed/src/all_drugs.dart';
import 'package:thaimed/src/all_sicks.dart';
import 'package:thaimed/src/all_stores.dart';
import 'package:thaimed/src/detail_drug.dart';
import 'package:thaimed/src/refer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CarouselController _controller = CarouselController();
  String currentState = 'หน้าแรก';
  @override
  Widget build(BuildContext context) {
    var listImage = [
      Image.asset(
        'lib/asset/allsick/Picture1.JPG',
        width: 800,
      ),
      _banner(
        'lib/asset/allsick/ไข้ .png',
        ' ภาวะที่ร่างกายกำลังต่อสู้กับการติดเชื้อ โดยการทำให้สภาวะแวดล้อมไม่เหมาะกับการเจริญของเชื้อไวรัสและแบคทีเรีย สารเคมีที่ถูกหลั่งออกมาในกระแสเลือดขณะที่เกิดการติดเชื้อจะส่งสัญญาณไปยัง "ศูนย์ควบคุมอุณหภูมิ" (ไฮโปทาลามัส) ในสมอง ทำให้เกิดความร้อนขึ้น',
        '๑.ยาเขียวหอม\n๒. ยาจันทน์ลีลา\n๓. ยาประสะจันทน์แดง\n๔. ยามหานิลแท่งทอง\n๕. ยาแสงหมึก \n๖. ยาตรีหอม (ใช้ในเด็ก)**\n๗. ยาประสะเปราะใหญ่ (ใช้ในเด็ก)**',
      ),
      _banner(
        'lib/asset/allsick/เด็กเป็นไข้ .png',
        ' ภาวะที่ร่างกายกำลังต่อสู้กับการติดเชื้อ โดยการทำให้สภาวะแวดล้อมไม่เหมาะกับการเจริญของเชื้อไวรัสและแบคทีเรีย สารเคมีที่ถูกหลั่งออกมาในกระแสเลือดขณะที่เกิดการติดเชื้อจะส่งสัญญาณไปยัง "ศูนย์ควบคุมอุณหภูมิ" (ไฮโปทาลามัส) ในสมอง ทำให้เกิดความร้อนขึ้น',
        '๑.ยาตรีหอม (ใช้ในเด็ก)\n๒. ยาประสะเปราะใหญ่ (ใช้ในเด็ก) ',
      ),
      _banner(
        'lib/asset/allsick/ท้องผูก.png',
        ' การปฏิบัติตัวที่ไม่ถูกต้อง เช่น รับประทานอาหารที่มีกากใยน้อย ดื่มน้ำน้อย ไม่ออกกำลังกายหรือไม่ค่อยเคลื่อนไหวร่างกาย กลั้นอุจจาระบ่อยๆ',
        '๑.ยาถ่าย\n๒. ยาธรณีสันฑะฆาต\n๓. ยาตรีหอม (ใช้ในเด็ก) ',
      ),
      _banner(
        'lib/asset/allsick/ท้องเสีย.png',
        ' การติดเชื้อไวรัสรองลงมาคือการติดเชื้อแบคทีเรีย และเชื้ออื่น ๆ เช่น เชื้อปรสิตอาหารเป็นพิษจากสารพิษในสิ่งแวดล้อมที่ปนเปื้อนในอาหารหรือสารพิษที่สร้างขึ้นจากเชื้อแบคทีเรีย',
        '๑.ยาธาตุบรรจบ\n๒. ยาเหลืองปิดสมุทร \n',
      ),
      _banner(
        'lib/asset/allsick/ท้องอืด.png',
        ' การอาหารเช่น ถั่ว บรอกโคลี เครื่องดื่มอัดแก๊ส เบียร์ หรืออาหารที่ย่อยยาก จะทำให้เกิดการสะสมแก๊สในกระเพาะอาหารจนกลายเป็นอาการท้องอืด ท้องเฟ้อ จุกเสียด',
        '๑.ยาธาตุบรรจบ\n๒. ยาประสะกะเพราะ (ใช้ในเด็ก) \n๓. ยาประสะกานพลู\n๔. ยาประสะเจตพังคี\n๕. ยามันทธาตุ\n๖. ยามหาจักรใหญ่\n๗. ยาวิสัมพยาใหญ่',
      ),
      _banner(
        'lib/asset/allsick/ปวดประจำเดือน.png',
        ' การสารที่ออกฤทธิ์คล้ายฮอร์โมน ชื่อว่า โพรสตาแกลนดิน (prostaglandin) ซึ่งก่อตัวขึ้นที่เยื่อบุโพรงมดลูกระหว่างมีประจำเดือน โพรสตาแกลนดินทำให้กล้ามเนื้อบีบตัวและหดเกร็งคล้ายกับอาการเจ็บปวดขณะคลอดบุตร',
        '๑.ยาประสะไพล',
      ),
      _banner(
        'lib/asset/allsick/หน้ามืด.png',
        ' แรงดันเลือดและปริมาณเลือดที่ส่งไปหล่อเลี้ยงสมองไม่เพียงพอ พบในผู้สูงอายุหรือมีภาวะโรคประจำตัวที่มีผลต่อระบบไหลเวียนโลหิต',
        '๑. ยาหอมทิพโอสถ\n๒. ยาหอมเทพจิตร\n๓. ยาหอมนวโกฐ\n๔. ยาหอมอินทจักร์ \n',
      ),
      _banner(
        'lib/asset/allsick/อาเจียน.png',
        ' การรับประทานอาหารที่ไม่สะอาดหรือปนเปื้อนเชื้อโรค การรับประทานอาหารหรือดื่มแอลกอฮอล์ในปริมาณที่มากเกินไป การตั้งครรภ์ การเมารถหรือเมาเรือ',
        '๑. ยาหอมอินทจักร์ \n๒. ยาหอมนวโกฐ ',
      ),
      _banner(
        'lib/asset/allsick/อีสุกอีใส.png',
        ' เชื้อไวรัสที่มีชื่อว่า ไวรัสวาริเซลลา (varicella virus) หรือ human herpes virus type ๓ เป็นเชื้อไวรัสชนิดเดียวกับที่ทำให้เกิดงูสวัด',
        '๑. ยาเขียวหอม\n๒. ยามหานิลแท่งทอง',
      ),
      _banner(
        'lib/asset/allsick/ไอ.png',
        ' การรับสารที่ทำให้เกิดการระคายเคืองภายในลำคอ หรือสารก่อภูมิแพ้เข้าสู่ร่างกาย หรือเกิดจากโรคที่เกี่ยวข้องกับการติดเชื้อในระบบทางเดินหายใจ เช่น หวัด ไข้หวัดใหญ่ ปอดบวม ',
        '๑. ยาประสะมะแว้ง\n๒. ยาอำมฤควาที',
      ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentState = 'หน้าแรก';
                });
              },
              child: Image.asset(
                'lib/asset/logo.jpg',
                height: 200,
                width: 200,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    height: 150,
                    child: Row(
                      children: [
                        Container(),
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: currentState == 'หน้าแรก'
                                ? APPColor.primary
                                : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              currentState = 'หน้าแรก';
                            });
                          },
                          child: const Text(
                            'หน้าแรก',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: currentState == '๒๔ ตำรับยา'
                                  ? APPColor.primary
                                  : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                currentState = '๒๔ ตำรับยา';
                              });
                            },
                            child: const Text(
                              '๒๔ ตำรับยา',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: currentState == 'อาการป่วย'
                                ? APPColor.primary
                                : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              currentState = 'อาการป่วย';
                            });
                          },
                          child: const Text(
                            'อาการป่วย',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: currentState == 'ร้านค้า'
                                ? APPColor.primary
                                : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              currentState = 'ร้านค้า';
                            });
                          },
                          child: const Text(
                            'ร้านค้า',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: currentState == 'อ้างอิง'
                                ? APPColor.primary
                                : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              currentState = 'อ้างอิง';
                            });
                          },
                          child: const Text(
                            'อ้างอิง',
                            style: TextStyle(fontSize: 24),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: currentState == 'หน้าแรก',
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => _controller.previousPage(),
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 32,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: SizedBox(
                                height: 350,
                                width: 1000,
                                child: CarouselSlider(
                                  carouselController: _controller,
                                  options: CarouselOptions(
                                    viewportFraction: 1,
                                    enlargeCenterPage: true,
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 10),
                                  ),
                                  items: listImage,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => _controller.nextPage(),
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 325,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('drugs')
                              .orderBy('createAt', descending: false)
                              .limit(3)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var data = snapshot.data!.docs;
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Card(
                                    child: InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailDrug(
                                            data: data[0],
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 275,
                                            child: Image.memory(
                                              base64Decode(data[0]['image']),
                                            ),
                                          ),
                                          Text(
                                            data[0]['number'] +
                                                '. ' +
                                                data[0]['name'],
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailDrug(
                                            data: data[1],
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 275,
                                            child: Image.memory(
                                              base64Decode(data[1]['image']),
                                            ),
                                          ),
                                          Text(
                                            data[1]['number'] +
                                                '. ' +
                                                data[1]['name'],
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailDrug(
                                            data: data[2],
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 275,
                                            child: Image.memory(
                                              base64Decode(data[2]['image']),
                                            ),
                                          ),
                                          Text(
                                            data[2]['number'] +
                                                '. ' +
                                                data[2]['name'],
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: APPColor.primary),
                          onPressed: () {
                            setState(() {
                              currentState = '๒๔ ตำรับยา';
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'ดูข้อมูลเพิ่มเติม',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: currentState == '๒๔ ตำรับยา',
                  child: const AllDrugs(),
                ),
                Visibility(
                  visible: currentState == 'อาการป่วย',
                  child: const AllSicks(),
                ),
                Visibility(
                  visible: currentState == 'ร้านค้า',
                  child: const AllStores(),
                ),
                Visibility(
                  visible: currentState == 'อ้างอิง',
                  child: const Refer(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _banner(String image, String caurse, String treat) {
    return Container(
      color: const Color(0xFF92c1c7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'เกิดจาก',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: caurse,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    text: 'รักษาได้โดยใช้ยา\n',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: treat,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
