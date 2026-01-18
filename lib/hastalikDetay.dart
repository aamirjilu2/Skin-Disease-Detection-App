// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:tflite_web/tflite_web.dart';

class HastalikDetay extends StatelessWidget {
  final String isim;
  final String resimYolu;

  final String treatment;
  final String symptoms;

  const HastalikDetay(
      {super.key,
      required this.isim,
      required this.resimYolu,
      required this.treatment,
      required this.symptoms});

  @override
  Widget build(BuildContext context) {
    final double genislik = MediaQuery.of(context).size.width;
    final double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListView(children: [
      Stack(children: [
        Center(
          child: Image.asset(
            resimYolu,
            fit: BoxFit.scaleDown,
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
              size: 40,
            )),
      ]),
      const SizedBox(
        height: 20,
      ),
      Center(
        child: Text(
          isim,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
          padding: const EdgeInsets.only(top: 3),
          child: Padding(
            padding:
                EdgeInsets.only(left: genislik * 0.05, right: genislik * 0.08),
            child: Container(
              child: (Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Text("Symptoms",
                              style: TextStyle(
                                  fontSize: genislik * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor)),
                          title: Text(
                            symptoms,
                            style: TextStyle(
                              fontSize: genislik * 0.04,
                            ),
                          ),
                        ),
                        const Divider(color: Colors.black87),
                        const Divider(color: Colors.transparent),
                        ListTile(
                          leading: Text("Treatment & \n Prevention",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: genislik * 0.04,
                                  fontWeight: FontWeight.bold)),
                          title: Text(
                            treatment,
                            style: TextStyle(
                              fontSize: genislik * 0.04,
                            ),
                          ),
                        ),
                        const Divider(color: Colors.grey),
                        SizedBox(
                          height: genislik * 0.05,
                        )
                      ],
                    ),
                  )
                ],
              )),
            ),
          ))
    ]));
  }
}
