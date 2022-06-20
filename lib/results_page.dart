import 'package:bmi_calculator/custom_widgets.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key, required this.bmi}) : super(key: key);
  final double bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
        leading: const Icon(Icons.menu_outlined),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Your Result",
              style: TextStyle(fontSize: 40),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomCard(
              Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'NORMAL',
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Text(
                      "Normal BMI range:",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xff8e8f9b),
                      ),
                    ),
                    const Text(
                      "18,5 - 25kg/m2",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const Text(
                      "You have a normal body weight. Good job!",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      color: const Color(0xff0a0d22),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Save Result",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InputPage(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xffea1556),
              child: Text(
                "Recalculate Your BMI".toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
