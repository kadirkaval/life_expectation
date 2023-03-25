import 'package:life_expectation/user_data.dart';

class Hesap {
  UserData userData;

  Hesap({required this.userData});

  double hesap(){
    double sonuc;
    sonuc = 90 + userData.curentValueSpor-userData.curentValueSigra;
    sonuc = sonuc+(userData.boy/userData.kilo);

    userData.selectedCinsiyet=="KADIN" ? sonuc+3 : sonuc;

    return sonuc;
  }
}