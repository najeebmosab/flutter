import 'package:bmi_calculator/widget/Gender_widget.dart';
import 'package:flutter/material.dart';
import "../widget/Data_widget.dart";

enum Gender { Male, Female }

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _height = 180.00;
  var _weight = 80;
  var _age = 20;
  var gender = Gender.Male;
  void ShowSheet(int weight,double height,int age) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Weight Is: ${weight}"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Height Is: ${height.round()}"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Age Is: ${age}"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0d0b20),
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Color(0xff130f60),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = Gender.Male;
                      print(gender);
                    });
                  },
                  child: GenderWidget(
                      "Male",
                      Icons.male,
                      gender == Gender.Male
                          ? Color(0xff130f60)
                          : Color(0xff1e152f)),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = Gender.Female;
                      print(gender);
                    });
                  },
                  child: GenderWidget(
                      "Female",
                      Icons.female,
                      gender != Gender.Male
                          ? Color(0xff130f60)
                          : Color(0xff1e152f)),
                )),
              ]),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Color(0xff1e152f),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${_height.round()}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "CM",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  Slider(
                    value: _height,
                    onChanged: (val) {
                      setState(() {
                        _height = val.toDouble();
                      });
                    },
                    min: 80,
                    max: 220,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                        child: DataWidget(_weight, "Weight", () {
                      setState(() {
                        _weight--;
                        print(_weight);
                      });
                    }, () {
                      setState(() {
                        _weight++;
                        print(_weight);
                      });
                    })),
                    SizedBox(width: 20),
                    Expanded(
                      child: DataWidget(_age, "Age", () {
                        setState(() {
                          _age--;
                          print(_age);
                        });
                      }, () {
                        setState(() {
                          print(_age);
                          _age++;
                        });
                      }),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: MaterialButton(
              height: 50,
              onPressed: () {
                ShowSheet(_weight, _height, _age);
              },
              child: Text(
                "Calculate",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
              color: Color(0xff130f60),
            ),
          )
        ],
      ),
    );
  }
}
