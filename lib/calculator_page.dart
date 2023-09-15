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

  //total do valor e quem mostra para o usuario
  double total = 0;
  // responsavel por mostrar valor que vai para o firstnumber
  String results = '';
  // responsavel por mostrar valor que vai para o secondnumber
  String results2 = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(vertical: 80),
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  total.toString(),
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                buttons('7'),
                buttons('8'),
                buttons('9'),
                operationButtons(
                  '/',
                  Colors.orangeAccent,
                )
              ],
            ),
            Row(
              children: [
                buttons('4'),
                buttons('5'),
                buttons('6'),
                operationButtons(
                  '*',
                  Colors.orangeAccent,
                )
              ],
            ),
            Row(
              children: [
                buttons('1'),
                buttons('2'),
                buttons('3'),
                operationButtons(
                  '-',
                  Colors.orangeAccent,
                )
              ],
            ),
            Row(
              children: [
                buttons('0'),
                buttons('.'),
                operationButtons(
                  'C',
                  Colors.white,
                ),
                operationButtons('+', Colors.orangeAccent, function: calcula())
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

  //Função que cria todos os Numeros
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
            function;
            if (operator != '' && firstNumber == 0) {
              clear();
            } else {}
            if (operator == '') {
              setState(() {
                results += text;
                total = double.parse(results);
                firstNumber = double.parse(results);
              });
            } else {
              setState(() {
                results2 += text;
                total = double.parse(results2);
                secondNumber = double.parse(results2);
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

  //Função que cria as operações
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
            operator = operatorButton;
            comandos(operatorButton);
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

  clear() {
    setState(() {
      firstNumber = 0;
      secondNumber = 0;
      operator = '';
      total = 0;
      results = '0';
      results2 = '0';
    });
  }

  comandos(String operator) {
    if (operator == 'C') {
      clear();
    } else if (operator == '=') {
      result();
    } else if (operator == "+" ||
        operator == "-" ||
        operator == "*" ||
        operator == "/") {
      calcula();
    }
  }

  result() {
    setState(() {
      total;
      results = '';
      results2 = '';
      operator = '';
      firstNumber = 0;
      secondNumber = 0;
    });
    //clear();
  }

  calcula() {
    switch (operator) {
      case '+':
        return sum(firstNumber, secondNumber);
      case '-':
        return minus(firstNumber, secondNumber);
      case '*':
        return multiply(firstNumber, secondNumber);
      case '/':
        return divide(firstNumber, secondNumber);
      case '=':
        result();
      case 'C':
        clear();
    }
  }

  sum(double number1, double number2) {
    setState(() {
      total = (number1 + number2);
    });
  }

  minus(double number1, double number2) {
    setState(() {
      total = (number1 - number2);
    });
  }

  multiply(double number1, double number2) {
    setState(() {
      total = (number1 * number2);
    });
  }

  divide(double number1, double number2) {
    setState(() {
      total = (number1 / number2);
    });
  }
}
//fazer o firstNumber receber o total para proxima conta