import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_application_3/pages/history.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Kalkulator extends StatefulWidget {
  @override
  _KalkulatorState createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  String hasil = "belum ada hasil";
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  String jsonblm;
  bool cekKosong = true;
  List<String> asep = [];
  double txtfield1, txtfiled2, hasildouble;

  Future<String> saveData(hasil) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    asep.add(hasil);
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
  }

  Future<String> getData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      jsonblm = pref.getString("jsonvalue");
      var jsonjadi = jsonDecode(jsonblm);
      asep.clear();
      for (int i = 0; i < jsonjadi.length; i++) {
        asep.add(jsonjadi[(i + 1).toString()]);
      }
    } catch (exception) {
      cekKosong = !cekKosong;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("KALKULATOR"),
        ),
        body: ListView(
          children: [
            Container(
              height: 20,
            ),
            Center(
              child: Text(
                "FAIZ DHIYAUL HAQ - A11.2019.12031",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                onSubmitted: (value) {
                  try {
                    txtfield1 = double.parse(value);
                  } catch (exception) {
                    txtfield1 = null;
                  }
                },
                onChanged: (value) {
                  try {
                    txtfield1 = double.parse(value);
                  } catch (exception) {
                    txtfield1 = null;
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukan Angka Ke-1"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Checkbox(
                      value: check1,
                      onChanged: (value) {
                        setState(() {
                          check1 = !check1;
                          if (check1 == true) {
                            check2 = false;
                            check3 = false;
                            check4 = false;
                          }
                        });
                      }),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          check1 = !check1;
                          if (check1 == true) {
                            check2 = false;
                            check3 = false;
                            check4 = false;
                          }
                        });
                      },
                      child: Text("TAMBAH", style: TextStyle(fontSize: 20))),
                ),
                Spacer(
                  flex: 1,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Checkbox(
                      value: check2,
                      onChanged: (value) {
                        setState(() {
                          check2 = !check2;
                          if (check2 == true) {
                            check1 = false;
                            check3 = false;
                            check4 = false;
                          }
                        });
                      }),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          check2 = !check2;
                          if (check2 == true) {
                            check1 = false;
                            check3 = false;
                            check4 = false;
                          }
                        });
                      },
                      child: Text("KURANG", style: TextStyle(fontSize: 20))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Checkbox(
                      value: check3,
                      onChanged: (value) {
                        setState(() {
                          check3 = !check3;
                          if (check3 == true) {
                            check1 = false;
                            check2 = false;
                            check4 = false;
                          }
                        });
                      }),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          check3 = !check3;
                          if (check3 == true) {
                            check1 = false;
                            check2 = false;
                            check4 = false;
                          }
                        });
                      },
                      child: Text(
                        "KALI",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                Spacer(
                  flex: 1,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Checkbox(
                      value: check4,
                      onChanged: (value) {
                        setState(() {
                          check4 = !check4;
                          if (check4 == true) {
                            check1 = false;
                            check2 = false;
                            check3 = false;
                          }
                        });
                      }),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          check4 = !check4;
                          if (check4 == true) {
                            check1 = false;
                            check2 = false;
                            check3 = false;
                          }
                        });
                      },
                      child: Text("BAGI", style: TextStyle(fontSize: 20))),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                onSubmitted: (value) {
                  try {
                    txtfiled2 = double.parse(value);
                  } catch (exception) {
                    txtfiled2 = null;
                  }
                },
                onChanged: (value) {
                  try {
                    txtfiled2 = double.parse(value);
                  } catch (exception) {
                    txtfiled2 = null;
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukan Angka Ke-2"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (check1 == true) {
                    if (txtfield1 == null) {
                      hasil = "MASUKAN ANGKA KE-1";
                    } else if (txtfiled2 == null) {
                      hasil = "MASUKAN ANGKA KE-2";
                    } else if (txtfield1 == null && txtfiled2 == null) {
                      hasil = "MASUKAN ANGKA KE 1 DAN 2";
                    } else {
                      hasildouble = txtfield1 + txtfiled2;
                      hasil = hasildouble.toString();
                      getData();
                      saveData(hasil);
                    }
                  } else if (check2 == true) {
                    if (txtfield1 == null) {
                      hasil = "MASUKAN ANGKA KE-1";
                    } else if (txtfiled2 == null) {
                      hasil = "MASUKAN ANGKA KE-2";
                    } else if (txtfield1 == null && txtfiled2 == null) {
                      hasil = "MASUKAN ANGKA KE 1 DAN 2";
                    } else {
                      hasildouble = txtfield1 - txtfiled2;
                      hasil = hasildouble.toString();
                      getData();
                      saveData(hasil);
                    }
                  } else if (check3 == true) {
                    if (txtfield1 == null) {
                      hasil = "MASUKAN ANGKA KE-1";
                    } else if (txtfiled2 == null) {
                      hasil = "MASUKAN ANGKA KE-2";
                    } else if (txtfield1 == null && txtfiled2 == null) {
                      hasil = "MASUKAN ANGKA KE 1 DAN 2";
                    } else {
                      hasildouble = txtfield1 * txtfiled2;
                      hasil = hasildouble.toString();
                      getData();
                      saveData(hasil);
                    }
                  } else if (check4 == true) {
                    if (txtfield1 == null) {
                      hasil = "MASUKAN ANGKA KE-1";
                    } else if (txtfiled2 == null) {
                      hasil = "MASUKAN ANGKA KE-2";
                    } else if (txtfield1 == null && txtfiled2 == null) {
                      hasil = "MASUKAN ANGKA KE 1 DAN 2";
                    } else {
                      hasildouble = txtfield1 / txtfiled2;
                      hasil = hasildouble.toString();
                      getData();
                      saveData(hasil);
                    }
                  } else {
                    hasil = "PILIH CHECKBOX TERLEBIH DAHULU";
                  }
                });
              },
              child: Text(
                "HITUNG",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 30,
            ),
            Center(
              child: Text(
                hasil,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(height: 40),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: RaisedButton(
                color: Colors.red.withOpacity(0.8),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return History();
                  }));
                },
                child: Text("HISTORY PERHITUNGAN"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
