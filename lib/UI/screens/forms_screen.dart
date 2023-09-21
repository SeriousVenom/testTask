import 'package:flutter/material.dart';
import 'package:test_task/UI/data.dart';
import 'package:test_task/UI/screens/calculator_screen.dart';
import 'package:test_task/UI/widgets/app_button.dart';
import 'package:test_task/UI/widgets/form_widget.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({super.key});

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Forms Screen'),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 12.0).copyWith(top: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => FormWidget(
                        hintTitle: hintTitles[index],
                        inputType: inputTypes[index],
                        controller: controllers[index],
                        formType: formTypes[index],
                        validate: validate,
                      ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12.0),
                  itemCount: hintTitles.length),
              const Spacer(),
              AppButton(
                title: 'Next',
                onTap: () => _checkFieldsRoute(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _checkFieldsRoute() {
    bool allFormsFill = false;
    setState(() {
      validate = true;
    });

    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        allFormsFill = false;
        break;
      } else {
        allFormsFill = true;
      }
    }

    if (allFormsFill) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CalculatorScreen()));
    }
  }
}
