import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double firstNumber = 0;
  double secondNumber = 0;
  String operator = '';
  double total = 0;
  double resultFinal = 0;

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
                resultFinal.toStringAsFixed(2),
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
                operationButtons('/', Colors.orangeAccent,
                    function: calc(firstNumber, secondNumber))
              ],
            ),
            Row(
              children: [
                buttons('4'),
                buttons('5'),
                buttons('6'),
                operationButtons('*', Colors.orangeAccent,
                    function: calc(firstNumber, secondNumber))
              ],
            ),
            Row(
              children: [
                buttons('1'),
                buttons('2'),
                buttons('3'),
                operationButtons('-', Colors.orangeAccent,
                    function: calc(firstNumber, secondNumber))
              ],
            ),
            Row(
              children: [
                buttons('0'),
                operationButtons('c', Colors.white),
                operationButtons('+', Colors.orangeAccent,
                    function: calc(firstNumber, secondNumber))
              ],
            ),
            Row(
              children: [
                operationButtons('=', Colors.orangeAccent, function: result()),
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
            if (operator == '') {
              setState(() {
                firstNumber = double.parse(text);
                resultFinal = firstNumber;
              });
            } else {
              setState(() {
                secondNumber = double.parse(text);
                resultFinal = secondNumber;
              });
            }
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

  calc(double number1, double number2) {
    if (operator == '=') {
      result();
    } else if (operator == 'c') {
      firstNumber = 0;
      secondNumber = 0;
      operator = '';
      total = 0;
      resultFinal = 0;
    } else if (operator == '+') {
      setState(() {
        total = (number1 + number2);
      });
    } else if (operator == '-') {
      setState(() {
        total = (number1 - number2);
      });
    } else if (operator == '*') {
      setState(() {
        total = (number1 * number2);
      });
    } else if (operator == '/') {
      setState(() {
        total = (number1 / number2);
      });
    }
  }

  result() {
    setState(() {
      resultFinal = total;
    });
  }
}