import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Calulator'),
    );

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String outpot = "0";

  String _outpot = "0";
  double value1 = 0.0;
  double value2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "Clear") {
      _outpot = "0";
      value1 = 0.0;
      value2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "/" ||
        buttonText == "-" ||
        buttonText == "*") {
      value1 = double.parse(outpot);
      operand = buttonText;
      _outpot = "0";
    } else if (buttonText == ".") {
      if (_outpot.contains(".")) {
        print("Allredy contain");
        return;
      } else {
        _outpot = _outpot + buttonText;
      }
    } else if (buttonText == "=") {
      value2 = double.parse(outpot);
      if (operand == "+") {
        _outpot = (value1 + value2).toString();
      }
      if (operand == "-") {
        _outpot = (value1 - value2).toString();
      }
      if (operand == "*") {
        _outpot = (value1 * value2).toString();
      }
      if (operand == "/") {
        _outpot = (value1 / value2).toString();
      }
      value1 = 0.0;
      value2 = 0.0;
      operand = "";
    } else {
      _outpot = _outpot + buttonText;
    }
    print(_outpot);

    setState(() {
      outpot = double.parse(_outpot).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: EdgeInsets.all(24.5),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Column(children: <Widget>[
          new Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: new Text(
                outpot,
                style:
                    new TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              )),
          new Expanded(
            child: new Divider(),
          ),
          new Column(
            children: [
              new Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ]),
              new Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("*"),
              ]),
              new Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
              ]),
              new Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+"),
              ]),
              new Row(children: [
                buildButton("Clear"),
                buildButton("="),
              ])
            ],
          ),
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
