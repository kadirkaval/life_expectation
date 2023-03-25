import 'package:flutter/material.dart';
import 'package:life_expectation/hesap.dart';
import 'package:life_expectation/user_data.dart';

class ResaultPage extends StatelessWidget {
  final UserData userData;
  const ResaultPage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                'Bekelenen Yaşam Süresi:',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Center(
              child: Text('${Hesap(userData: userData).hesap().round()} YIL',
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: TextButton(
                onPressed: () {},
                child: const Center(
                  child: Text(
                    "GERİ DÖN",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
