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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
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
                operationButtons('/', Colors.orangeAccent,
                    function: calcula(firstNumber, secondNumber))
              ],
            ),
            Row(
              children: [
                buttons('4'),
                buttons('5'),
                buttons('6'),
                operationButtons('*', Colors.orangeAccent,
                    function: calcula(firstNumber, secondNumber))
              ],
            ),
            Row(
              children: [
                buttons('1'),
                buttons('2'),
                buttons('3'),
                operationButtons('-', Colors.orangeAccent,
                    function: calcula(firstNumber, secondNumber))
              ],
            ),
            Row(
              children: [
                buttons('0'),
                buttons('.'),
                buttons(
                  'C',
                  
                ),
                operationButtons('+', Colors.orangeAccent,
                    function: calcula(firstNumber, secondNumber))
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
            setState(() {
              function;
              if (operatorButton != '') {
                operator = operatorButton;
              }
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

  //Faz os calculos e apaga
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

  result() {
    setState(() {
      total = total;
    });
  }

  calcula(double number1, double number2) {
    switch (operator) {
      case '+':
        return sum(number1, number2);
      case '-':
        return minus(number1, number2);
      case '*':
        return multiply(number1, number2);
      case '/':
        return divide(number1, number2);
      case '=':
        result();
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
//Fazer o c funcionar 
//o C TA RECEBENDO O = E DEPOIS O C POR ISSO PRECISA DE DOIS CLICKS

