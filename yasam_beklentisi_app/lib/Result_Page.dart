import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yasam_beklentisi_app/constants.dart';
import 'package:yasam_beklentisi_app/hesap.dart';
import 'package:yasam_beklentisi_app/user_data.dart';
import 'package:yasam_beklentisi_app/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData userData;
  ResultPage({
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SONUÇ SAYFASI',
          style: kMetinStili,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 8,
              child: Center(
                child: Text(
                  Hesap(userData).hesaplama().round().toString(),
                  style: kMetinStili,
                ),
              )),
          Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  'Geri Dön',
                  style: kMetinStili,
                ),
              ))
        ],
      ),
    );
  }
}
