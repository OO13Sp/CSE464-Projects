import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'buttons.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String number1 = "";
  String operand = "";
  String number2 = "";
  @override
  Widget build(BuildContext context) {
    final screenSize= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(title: Text('Calculator',
      style: TextStyle(
        color: Colors.white,

      ),
      ),
          backgroundColor: Colors.black,
      ),
      body: SafeArea(

          bottom: false,

         child: Column(
             children: [
             //output
             Expanded(
               child: SingleChildScrollView(

                 child: Container(
                   alignment: Alignment.bottomRight,
                   padding: EdgeInsets.all(16),
                   child: Text("$number1$operand$number2".isEmpty?"0": "$number1$operand$number2", // this multiplies, adds or subtracts//

                     style: TextStyle(
                     fontSize: 48,
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                   ),
                   textAlign: TextAlign.end,
                   ),
                 ),
               ),
             ),

               Wrap(
                 children:  Btn.buttonValues
                   .map(
                     (value) => SizedBox(
                         width: value == Btn.n0?screenSize.width/2: (screenSize.width/4),
                         height:screenSize.width/5 ,
                         child: buildButton(value)),

                 )
                     .toList(),
               )




               //buttons
             ],
         ),
        ),


          //buttons


    );
  }
  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: getBtnColor(value),
        clipBehavior: Clip.hardEdge,
        shape: value == Btn.n0 ? RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white24, // Outline border color for "0"
            width: 2.0, // Outline border width for "0"
          ),
          borderRadius: BorderRadius.circular(50.0), // Adjust border radius for "0"
        ) : const CircleBorder(
          side: BorderSide(
            color: Colors.white24, // Default border color for circular buttons
            width: 2.0, // Default border width for circular buttons
          ),
        ),
        child: InkWell(
          onTap: () => onBtnTap(value),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 40, // Font size for circular buttons
              ),
            ),
          ),
        ),
      ),
    );
  }
  // making a function which stores the button tap//

  void onBtnTap(String value) {
    if (value == Btn.del) {
      delete();
      return;
    }

    if (value == Btn.calculate) {
      calculate();
      return;
    }

    appendValue(value);
  }

  void calculate() {
    if (number1.isEmpty) return;
    if (operand.isEmpty) return;
    if (number2.isEmpty) return;

    final double num1 = double.parse(number1);
    final double num2 = double.parse(number2);

    var result = 0.0;
    switch (operand) {
      case Btn.add:
        result = num1 + num2;
        break;
      case Btn.subtract:
        result = num1 - num2;
        break;
      case Btn.multiply:
        result = num1 * num2;
        break;
      case Btn.divide:
        result = num1 / num2;
        break;
      default:
    }

    setState(() {
      number1 = result.toStringAsPrecision(3);

      if (number1.endsWith(".0")) {
        number1 = number1.substring(0, number1.length - 2);
      }

      operand = "";
      number2 = "";
    });
  }



  void delete(){
    if(number2.isNotEmpty){
      ///this deletes one number
      number2= number2.substring(0, number2.length-1);
    }
    else if(operand.isNotEmpty){
      operand= "";

    }
    else if(number1.isNotEmpty){
      number1= number1.substring(0, number1.length-1);
    }

    setState(() {

    });
  }

/// appends value///
void appendValue(String value){
  if(
  value!=Btn.dot&&int.tryParse(value)==null
  ){
    if(operand.isNotEmpty&&number2.isNotEmpty){
      //making it calculate everything

    }
    operand = value;
  }
  else if (number1.isEmpty || operand.isEmpty){
    if (value== Btn.dot && number1.contains(Btn.dot))return;
    if (value== Btn.dot && (number1.isEmpty || number1==Btn.dot)){
      value = "0.";
    }
    number1 +=value;
  }
  else if (number2.isEmpty || operand.isNotEmpty){
    if (value== Btn.dot && number2.contains(Btn.dot))return;
    if (value== Btn.dot && (number2.isEmpty || number2==Btn.dot)){
      value = "0.";
    }
    number2 +=value;
  }

  setState(() {
  });
}

  ///colors for buttons//

  Color getBtnColor(value) {
    return [Btn.del, Btn.clr, Btn.per,].contains(value)
        ? Colors.blueGrey : [
      Btn.multiply,
      Btn.add,
      Btn.subtract,
      Btn.divide,
      Btn.calculate,
    ].contains(value) ? Colors.orange :
    Colors.black87;
  }
}
