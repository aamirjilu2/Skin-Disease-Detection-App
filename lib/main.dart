// ignore_for_file: unused_import, unused_local_variable, unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:tflite_web/tflite_web.dart';
import 'package:skin25/bilgi.dart';
import 'package:skin25/tarama.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
    ),
    home: Anasayfa(),
  ));
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _aktifSayfaNo = 0;
  late PageController sayfaKumandasi;
  @override
  void initState() {
    super.initState();
    sayfaKumandasi = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final double genislik = MediaQuery.of(context).size.width;
    final double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: new AppBar(
        title: new Text('Skin Disease Detection'),
      ),
      body: Stack(children: [
        Container(),
        PageView(
          onPageChanged: (acilanSayfaNo) {
            setState(() {
              _aktifSayfaNo = acilanSayfaNo;
            });
          },
          controller: sayfaKumandasi,
          children: [MyApp(), Bilgi()],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _aktifSayfaNo,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt), label: "Skin Scanning"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_sharp), label: "Diseases")
        ],
        onTap: (secilenSayfaNo) {
          setState(() {
            sayfaKumandasi.jumpToPage(secilenSayfaNo);
          });
        },
      ),
    );
  }
}
