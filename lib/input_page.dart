import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'my_card_widget.dart';
import 'my_container.dart';

class IputPage extends StatefulWidget {
  const IputPage({Key? key}) : super(key: key);

  @override
  State<IputPage> createState() => _IputPageState();
}

class _IputPageState extends State<IputPage> {
  bool selectedCinsiyet = false;
  double _curentValueSigra = 15;
  double _curentValueSpor = 1;
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(),
                ),
                Expanded(
                  child: MyContainer(),
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
                          _curentValueSpor.round().toString(),
                          style: TextStyle(fontSize: 40, color: Colors.blue),
                        ),
                        Slider(
                          value: _curentValueSpor,
                          min: 0,
                          max: 7,
                          onChanged: (double value) {
                            setState(() {
                              _curentValueSpor = value;
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
                          _curentValueSigra.round().toString(),
                          style: TextStyle(fontSize: 40, color: Colors.blue),
                        ),
                        Slider(
                          value: _curentValueSigra,
                          min: 0,
                          max: 30,
                          onChanged: (double value) {
                            setState(() {
                              _curentValueSigra = value;
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
                          selectedCinsiyet = true;
                        });
                      },
                      color: selectedCinsiyet ? Colors.lightBlue : Colors.white,
                      child: MyCardWidget(
                        icon: FontAwesomeIcons.venus,
                        text: "KADIN",
                      )),
                ),
                Expanded(
                  child: MyContainer(
                      onTap: () {
                        setState(() {
                          selectedCinsiyet = false;
                        });
                      },
                      color:
                          !selectedCinsiyet ? Colors.lightBlue : Colors.white,
                      child: MyCardWidget(
                        icon: FontAwesomeIcons.mars,
                        text: "ERKEK",
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
