import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hesap Makinesi',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _currenValue = "0";
  String _operator = "";
  double _firstValue = 0;
  double _secondValue = 0;

  void _buttonPressed(String value) {
    setState(() {
      if  (value == "C") {
        _output = "0";
        _currenValue = "0";
        _operator = "" ;
        _firstValue = 0;
        _secondValue = 0;
       } else if (value == "+" || value == "-" || value == "*" || value == "/") {
        _firstValue = double.parse(_currenValue);
        _operator = value;
        _currenValue = "0";
       } else if (value == "=") {
        _secondValue = double.parse(_currenValue);
        switch (_operator) {
          case "+":
          _output = (_firstValue + _secondValue).toString();
          break;
          case "-":
          _output = (_firstValue - _secondValue).toString();
          break;
          case "*":
          _output = (_firstValue * _secondValue).toString();
          break;
          case "/":
          _output = (_firstValue / _secondValue).toString();
          break;
        }
        _currenValue = _output;
       } else {
        if (_currenValue == "0") {
        _currenValue = value;
        }else {
          _currenValue += value;
        }
        _output = _currenValue;
       }
    });
  }

  Widget _buildButton(String value) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesap Makinesi'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Container(
            alignment:Alignment.bottomRight,
            padding: EdgeInsets.all(24),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Column(
            children: [
              Row(
                children: <Widget>[
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("/"),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("*"),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("0"),
                  _buildButton("C"),
                  _buildButton("="),
                  _buildButton("+"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
