import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle kMetinStili =
    TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold);

TextStyle kDegiskenStili = TextStyle(
    fontSize: 35, color: Colors.lightBlue, fontWeight: FontWeight.bold);

ButtonStyle kButonStili = OutlinedButton.styleFrom(
  primary: Colors.black, // Butonun metin rengi
  side: BorderSide(color: Colors.lightBlue), // Kenar çizgisi rengi
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5)), // Kenar yuvarlatma
);
