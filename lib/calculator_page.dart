import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int total = 0;
  int firstNumber = 0;
  int secondNumber = 0;
  String operator = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
        ),
        body: Column(
          children: [
            Container(
              height: 150,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                '$firstNumber $operator $secondNumber',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                ),
              ),
            ),
            Row(
              children: [
                buttons('7'),
                buttons('8'),
                buttons('9'),
                operationButtons('/', Colors.orangeAccent)
              ],
            ),
            Row(
              children: [
                buttons('4'),
                buttons('5'),
                buttons('6'),
                operationButtons('*', Colors.orangeAccent)
              ],
            ),
            Row(
              children: [
                buttons('1'),
                buttons('2'),
                buttons('3'),
                operationButtons('-', Colors.orangeAccent)
              ],
            ),
            Row(
              children: [
                buttons(
                  '0',
                ),
                operationButtons('.', Colors.white),
                operationButtons('C', Colors.white),
                operationButtons('+', Colors.orangeAccent)
              ],
            ),
            Row(
              children: [
                operationButtons('=', Colors.orangeAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Função que cria todos os botões
  buttons(String text, {Function? function}) {
    return Flexible(
      flex: 3,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.black, width: 0.5),
          ),
          onPressed: () {
            setState(() {
              if (operator == '') {
                setState(() {
                  firstNumber = int.parse(text);
                  print(firstNumber);
                });
              } else {
                setState(() {
                  secondNumber = int.parse(text);
                  print(firstNumber);
                });
              }
            });
          },
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  operationButtons(String operatorButton, Color cor, {Function? function}) {
    return Flexible(
      flex: 3,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            side: const BorderSide(color: Colors.black, width: 0.5),
          ),
          onPressed: () {
            setState(() {
              operator = operatorButton;
              print(operator);
            });
          },
          child: Text(
            operatorButton,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
