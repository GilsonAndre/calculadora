import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
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

            ),
            Row(
              children: [
                botoes('7'),
                botoes('8'),
                botoes('9'),
              ],
            ),
            Row(
              children: [
                botoes('4'),
                botoes('5'),
                botoes('6'),
              ],
            ),
            Row(
              children: [
                botoes('1'),
                botoes('2'),
                botoes('3'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Função que cria todos os botões
  botoes(
    String number,
  ) {
    return Flexible(
      flex: 3,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 100,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
            top: Radius.circular(25),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            print(number);
          },
          child: Text(number),
        ),
      ),
    );
  }
}

// botoes(String number, String number1, String number2) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Flexible(
//           flex: 3,
//           child: Container(
//             width: MediaQuery.sizeOf(context).width,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.vertical(
//                 bottom: Radius.circular(25),
//                 top: Radius.circular(25),
//               ),
//             ),
//             child: ElevatedButton(
//               onPressed: () {
//                 print(number);
//               },
//               child: Text(number),
//             ),
//           ),
//         ),
//         Flexible(
//           flex: 3,
//           child: Container(
//             width: MediaQuery.sizeOf(context).width,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.vertical(
//                 bottom: Radius.circular(25),
//                 top: Radius.circular(25),
//               ),
//             ),
//             child: ElevatedButton(
//               onPressed: () {
//                 print(number1);
//               },
//               child: Text(number1),
//             ),
//           ),
//         ),
//         Flexible(
//           flex: 3,
//           child: Container(
//             width: MediaQuery.sizeOf(context).width,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.vertical(
//                 bottom: Radius.circular(25),
//                 top: Radius.circular(25),
//               ),
//             ),
//             child: ElevatedButton(
//               onPressed: () {
//                 print(number2);
//               },
//               child: Text(number2),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
