import 'package:flutter/material.dart';
import 'package:test_task/UI/data.dart';
import 'package:test_task/UI/screens/weather_screen.dart';
import 'package:test_task/UI/widgets/app_button.dart';
import 'package:test_task/UI/widgets/form_widget.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController firstNumController = TextEditingController();
  TextEditingController secondNumController = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          title: const Text('Calculator Screen'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade800,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormWidget(
                hintTitle: 'First number',
                inputType: TextInputType.number,
                controller: firstNumController,
                color: Colors.white,
              ),
              const SizedBox(
                height: 24,
              ),
              FormWidget(
                hintTitle: 'Second number',
                inputType: TextInputType.number,
                controller: secondNumController,
                color: Colors.white,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                'Operations:',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  _operationButton(
                      operation: '+', operationType: CalcOperation.addition),
                  _operationButton(
                      operation: '-', operationType: CalcOperation.subtraction),
                  _operationButton(
                      operation: '*',
                      operationType: CalcOperation.multiplication),
                  _operationButton(
                      operation: '/', operationType: CalcOperation.division),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                'Result: ${result.toDouble()}',
                style: const TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              const Spacer(),
              AppButton(
                  title: 'Next',
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WeatherScreen())))
            ],
          ),
        ),
      ),
    );
  }

  _operationButton(
      {required String operation, required CalcOperation operationType}) {
    CalcOperation currentOperation = operationType;

    return InkWell(
      onTap: () {
        switch (currentOperation) {
          case CalcOperation.addition:
            {
              setState(() {
                double firstNum = double.parse(firstNumController.text);
                double secondNum = double.parse(secondNumController.text);
                result = firstNum + secondNum;
              });
            }
          case CalcOperation.subtraction:
            {
              {
                setState(() {
                  double firstNum = double.parse(firstNumController.text);
                  double secondNum = double.parse(secondNumController.text);
                  result = firstNum - secondNum;
                });
              }
            }
          case CalcOperation.multiplication:
            {
              {
                setState(() {
                  double firstNum = double.parse(firstNumController.text);
                  double secondNum = double.parse(secondNumController.text);
                  result = firstNum * secondNum;
                });
              }
            }
          case CalcOperation.division:
            {
              {
                setState(() {
                  double firstNum = double.parse(firstNumController.text);
                  double secondNum = double.parse(secondNumController.text);
                  result = firstNum / secondNum;
                });
              }
            }
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        height: 64,
        width: 64,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
        child: Center(
          child: Text(
            operation,
            style: TextStyle(
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                fontSize: 26.0),
          ),
        ),
      ),
    );
  }
}
