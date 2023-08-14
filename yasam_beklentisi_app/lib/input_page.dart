import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi_app/Result_Page.dart';
import 'package:yasam_beklentisi_app/constants.dart';
import 'package:yasam_beklentisi_app/user_data.dart';
import 'Result_Page.dart';

import 'icon_widget.dart';
import 'my_container.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = '';
  double icilenSigara = 15;
  double gunSayisi = 3.5;
  int boy = 170;
  int kilo = 50;

  void incrementCounter() {
    setState(() {
      boy++;
    });
  }

  void decrementCounter() {
    setState(() {
      boy--;
    });
  }

  void incrementCounter2() {
    setState(() {
      kilo++;
    });
  }

  void decrementCounter2() {
    setState(() {
      kilo--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutLinedButton(),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: Row(
                      children: [
                        RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              'KİLO',
                              style: kMetinStili,
                            )),
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            kilo.toString(),
                            style: kDegiskenStili,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: OutlinedButton(
                                  onPressed: () {
                                    incrementCounter2();
                                  },
                                  style: kButonStili,
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.lightBlue),
                                  )),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                            ),
                            Flexible(
                              flex: 1,
                              child: OutlinedButton(
                                  onPressed: () {
                                    decrementCounter2();
                                  },
                                  style: kButonStili,
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.lightBlue),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                children: [
                  Text(
                      textAlign: TextAlign.center,
                      'HAFTADA KAÇ GÜN SPOR YAPIYORSUNUZ?',
                      style: kMetinStili),
                  Text('${gunSayisi.round()}', style: kDegiskenStili),
                  Slider(
                      divisions: 7,
                      min: 0,
                      max: 7,
                      value: gunSayisi,
                      onChanged: (newValue) {
                        setState(() {
                          gunSayisi = newValue;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Günde kaç sigara içiyorsunuz?', style: kMetinStili),
                  Text('${icilenSigara.round()}', style: kDegiskenStili),
                  Slider(
                      divisions: 30,
                      min: 0,
                      max: 30,
                      value: icilenSigara,
                      onChanged: (newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      }),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            seciliCinsiyet = 'ERKEK';
                          });
                          ;
                        },
                        child: MyContainer(
                          renk: seciliCinsiyet == 'ERKEK'
                              ? Colors.lightBlue[100] ?? Colors.white
                              : Colors.white,
                          child: IconWidget(
                            icon: FontAwesomeIcons.mars,
                            text: 'ERKEK',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            seciliCinsiyet = 'KADIN';
                          });
                        },
                        child: MyContainer(
                          renk: seciliCinsiyet == 'KADIN'
                              ? Colors.lightBlue[100] ?? Colors.white
                              : Colors.white,
                          child: IconWidget(
                            icon: FontAwesomeIcons.venus,
                            text: 'KADIN',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      userData: UserData(
                          kilo: kilo,
                          boy: boy,
                          seciliCinsiyet: seciliCinsiyet,
                          gunSayisi: gunSayisi,
                          icilenSigara: icilenSigara),
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size.fromHeight(50)),
              child: Text(
                'HESAPLA',
                style: kMetinStili,
              )),
        ],
      ),
    );
  }

  Row buildRowOutLinedButton() {
    return Row(
      children: [
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              'BOY',
              style: kMetinStili,
            )),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            boy.toString(),
            style: kDegiskenStili,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: OutlinedButton(
                  onPressed: () {
                    incrementCounter();
                  },
                  style: kButonStili,
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                  )),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Flexible(
              flex: 1,
              child: OutlinedButton(
                  onPressed: () {
                    decrementCounter();
                  },
                  style: kButonStili,
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
