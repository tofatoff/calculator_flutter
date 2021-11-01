import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String result = "0";
  String _result = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  operation(String btnText){
    if (btnText == "C"){
      _result = "0";
      num2 = 0.0;
      num1 = 0.0;
      operand = "";
    }
    else if (btnText == "+" || btnText == "-" || btnText == "*" || btnText == "/"){
      num1 = double.parse(result);
      operand = btnText;
      _result = "0";
    }
    else if(btnText == "="){
      num2 = double.parse(result);

      if (operand == "+"){
        _result = (num1+num2).toString();
      }
      if (operand == "-"){
        _result = (num1-num2).toString();
      }
      if (operand == "*"){
        _result = (num1*num2).toString();
      }
      if (operand == "/"){
        _result = (num1/num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    }
    else{
      _result = _result + btnText;
    }

    setState(() {
      result = double.parse(_result).toStringAsFixed(2);
    });
  }
  
  Widget button(String btnText){
    return Expanded(
            child: RawMaterialButton(
              onPressed: (){
                operation(btnText);
              },
              fillColor: Colors.blueGrey,
              padding: EdgeInsets.all(20),
              shape: Border.all(
                color: Colors.blue,
                width: 2
              ),
              child: Text(btnText,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),)
              )
                  );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom:8),
                  child:Text(
                    "$result",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                    ),),
                )
              ),
              Row(
                children: [
                    button("C"),
                    button("?"),
                    button("?"),
                    button("/"),
                  ],
              ),
              Row(
                children: [
                    button("7"),
                    button("8"),
                    button("9"),
                    button("*"),
                  ],
              ),
              Row(
                children: [
                    button("4"),
                    button("5"),
                    button("6"),
                    button("-"),
                  ],
              ),
              Row(
                children: [
                    button("1"),
                    button("2"),
                    button("3"),
                    button("+"),
                  ],
              ),
              Row(
                children: [
                    button("+/-"),
                    button("0"),
                    button("."),
                    button("="),
                  ],
              )
            ],
          ),
        ),
      ),
    );
  }
}