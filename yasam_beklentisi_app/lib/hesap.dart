import 'package:yasam_beklentisi_app/user_data.dart';

class Hesap {
  UserData userData;

  Hesap(this.userData);
  double hesaplama() {
    double sonuc;
    sonuc = 90 + userData.gunSayisi - userData.icilenSigara;
    sonuc = sonuc + (userData.boy / userData.kilo);

    if (userData.seciliCinsiyet == 'KADIN') {
      return sonuc + 3;
    } else {
      return sonuc;
    }
  }
}
