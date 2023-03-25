import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectation/resualt_page.dart';
import 'package:life_expectation/user_data.dart';

import 'my_card_widget.dart';
import 'my_container.dart';

class IputPage extends StatefulWidget {
  const IputPage({Key? key}) : super(key: key);

  @override
  State<IputPage> createState() => _IputPageState();
}

class _IputPageState extends State<IputPage> {
 UserData user = UserData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "YAŞAM BEKLENTİSİ",
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton("KİLO"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Haftada kaç gün spor yapıyorsunuz",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          user.curentValueSpor.round().toString(),
                          style: TextStyle(fontSize: 40, color: Colors.blue),
                        ),
                        Slider(
                          value: user.curentValueSpor,
                          min: 0,
                          max: 7,
                          onChanged: (double value) {
                            setState(() {
                              user.curentValueSpor = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Günde Kaç Sigara İçiyorsunuz?",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          user.curentValueSigra.round().toString(),
                          style: TextStyle(fontSize: 40, color: Colors.blue),
                        ),
                        Slider(
                          value: user.curentValueSigra,
                          min: 0,
                          max: 30,
                          onChanged: (double value) {
                            setState(() {
                              user.curentValueSigra = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                      onTap: () {
                        setState(() {
                          user.selectedCinsiyet = "KADIN";
                        });
                      },
                      color: user.selectedCinsiyet=="KADIN"
                          ? Colors.lightBlue.shade200
                          : Colors.white,
                      child: MyCardWidget(
                        icon: FontAwesomeIcons.venus,
                        text: "KADIN",
                      )),
                ),
                Expanded(
                  child: MyContainer(
                      onTap: () {
                        setState(() {
                          user.selectedCinsiyet = "ERKEK";
                        });
                      },
                      color: user.selectedCinsiyet=="ERKEK"
                          ? Colors.lightBlue.shade200
                          : Colors.white,
                      child: MyCardWidget(
                        icon: FontAwesomeIcons.mars,
                        text: "ERKEK",
                      )),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResaultPage(userData: user),),);
              },
              child: const Text(
                "HESAPLA",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            )),
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              label == "BOY" ? user.boy.toString() : user.kilo.toString(),
              style: const TextStyle(
                  fontSize: 40,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(40, 40),
                  side: const BorderSide(color: Colors.black38)),
              onPressed: () {
                setState(() {
                  label == "BOY" ? user.boy++ : user.kilo++;
                });
              },
              child: const Icon(
                FontAwesomeIcons.plus,
                size: 20,
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(36, 40),
                  side: const BorderSide(color: Colors.black38)),
              onPressed: () {
                setState(() {
                  label == "BOY" ? user.boy-- : user.kilo--;
                });
              },
              child: const Icon(
                FontAwesomeIcons.minus,
                color: Colors.blue,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
