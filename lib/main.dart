import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  void buttonClicked(String text) {
    if (text == "CLEAR") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (text == ".") {
      if (_output.contains(".")) {
        print("Already contains dot");
      } else {
        _output = _output + ".";
      }
    } else if (text == '+' || text == '-' || text == '*' || text == '/') {
      num1 = double.parse(_output);
      operand = text;
      _output = "0";
    } else if (text == "=") {
      num2 = double.parse(_output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + text;
    }
    setState(() {
      output = _output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerRight,
                  padding:
                      EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                  child: Text(
                    output,
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
              Expanded(child: Divider()),
              Column(
                children: [
                  Row(
                    children: [
                      textButton(
                        text: "7",
                      ),
                      textButton(
                        text: "8",
                      ),
                      textButton(
                        text: "9",
                      ),
                      textButton(
                        text: "/",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      textButton(
                        text: "4",
                      ),
                      textButton(
                        text: "5",
                      ),
                      textButton(
                        text: "6",
                      ),
                      textButton(
                        text: "*",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      textButton(
                        text: "1",
                      ),
                      textButton(
                        text: "2",
                      ),
                      textButton(
                        text: "3",
                      ),
                      textButton(
                        text: "-",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      textButton(
                        text: ".",
                      ),
                      textButton(
                        text: "0",
                      ),
                      textButton(
                        text: "00",
                      ),
                      textButton(
                        text: "+",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      textButton(
                        text: "CLEAR",
                      ),
                      textButton(
                        text: "=",
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textButton({String text}) {
    return Expanded(
      child: OutlinedButton(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () {
          buttonClicked(text);
        },
      ),
    );
  }
}
