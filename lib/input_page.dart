import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/custom_widgets.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double iconSize = 100;
  Color maleIconColor = Colors.white;
  Color femaleIconColor = Colors.white;
  bool male = false;
  bool female = false;
  TextStyle textStyle = const TextStyle(fontSize: 20);
  double _weight = 74;
  double _age = 19;
  double _height = 120;
  late double bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_outlined),
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        male = !male;
                        female = false;
                      });
                    },
                    child: CustomCard(
                      Content(
                        Icon(
                          Icons.male_outlined,
                          size: iconSize,
                          color: male ? Colors.redAccent : Colors.white,
                        ),
                        Container(),
                        Text(
                          "Male",
                          style: textStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        female = !female;
                        male = false;
                      });
                    },
                    child: CustomCard(
                      Content(
                        Icon(
                          Icons.female_outlined,
                          size: iconSize,
                          color: female ? Colors.redAccent : Colors.white,
                        ),
                        Container(),
                        Text(
                          "Female",
                          style: textStyle,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
            Expanded(
              child: CustomCard(Content(
                Text(
                  "Height",
                  style: textStyle,
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      _height.toStringAsFixed(2),
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      "cm",
                      style: textStyle.copyWith(fontSize: 20),
                    )
                  ],
                ),
                Slider(
                    inactiveColor: const Color(0xff8d8e98),
                    activeColor: const Color(0xffeb1555),
                    value: _height,
                    min: 0,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        _height = newValue;
                      });
                    }),
                // Container(
                //   height: 5,
                //   width: MediaQuery.of(context).size.width * 0.7,
                //   color: Colors.red,
                // ),
              )),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      Content(
                        const Text("Weight"),
                        Text(
                          _weight.toString(),
                          style: textStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buttons(
                              () {
                                if (_weight > 0) {
                                  setState(() {
                                    _weight--;
                                  });
                                }
                              },
                              Icons.remove_outlined,
                            ),
                            buttons(
                              () {
                                setState(() {
                                  _weight++;
                                });
                              },
                              Icons.add_outlined,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(Content(
                      const Text("AGE"),
                      Text(
                        _age.toString(),
                        style: textStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buttons(
                            () {
                              if (_age > 1) {
                                setState(() {
                                  _age--;
                                });
                              }
                            },
                            Icons.remove_outlined,
                          ),
                          buttons(
                            () {
                              setState(() {
                                _age++;
                              });
                            },
                            Icons.add_outlined,
                          )
                        ],
                      ),
                    )),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                bmi = _weight / ((_height / 100) * 2);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(bmi: bmi),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                color: const Color(0xffeb1555),
                child: Text(
                  "CALCULATE YOUR BMI",
                  style: textStyle.copyWith(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
