import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> asep = [];
  String jsonobject, jsonblm;
  bool cekKosong = true;

  Future<String> getData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      jsonblm = pref.getString("jsonvalue");
      var jsonjadi = jsonDecode(jsonblm);
      asep.clear();
      for (int i = 0; i < jsonjadi.length; i++) {
        asep.add(jsonjadi[(i + 1).toString()]);
      }
      setState(() {});
    } catch (exception) {
      cekKosong = !cekKosong;
    }
  }

  Future<String> deleteData(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    asep.removeAt(data);
    String wadah = "";
    String apaa;
    for (int i = 0; i < asep.length; i++) {
      if (i + 1 == asep.length) {
        String h = asep[i];
        String cont = wadah;
        apaa = '"${i + 1}" : "$h"';
        wadah = "$wadah$apaa";

        break;
      }
      String h = asep[i];
      String cont = wadah;
      apaa = '"${i + 1}" : "$h"';
      wadah = "$wadah$apaa,";
    }
    String jsoncoba = "{$wadah}";
    pref.setString("jsonvalue", jsoncoba);
    setState(() {});
  }

  _HistoryState() {
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("HISTORY PERHITUNGAN"),
        ),
        body: ListView.builder(
          itemCount: asep.length,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("HISTORY ${index + 1}"),
              subtitle: Text(
                "${asep[index]}",
                style: TextStyle(fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: () {
                  deleteData(index);
                },
                icon: Icon(Icons.delete),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
