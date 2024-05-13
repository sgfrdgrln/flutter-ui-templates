import 'package:flutter/material.dart';
import 'package:flutter_ui_templates/forms.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({super.key});

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int _current_step = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stepper Widget')),
      body: Center(
        child: Stepper(
          steps: [
            Step(
              title: Text("Step 1"),
              content: Text("Information for Step 1"),
            ),
            Step(
              title: Text("Step 2"),
              content: Text("Information for Step 2"),
            ),
            Step(
              title: Text("Step 3"),
              content: Text("Information for Step 3"),
            ),
          ],
          onStepTapped: (int newIndex) {
            setState(() {
              _current_step = newIndex;
            });
          },
          currentStep: _current_step,
          onStepContinue: () {
            if(_current_step != 2) {

              setState(() {
                _current_step += 1;
                print(_current_step);
              });

            }
            else if(_current_step == 2) {
              Navigator.push
                (
                  context,
                  MaterialPageRoute(builder: (context) => SampleForm())
              );
            }
          },
          onStepCancel: () {
            if(_current_step != 0) {

              setState(() {
                _current_step -= 1;
              });

            }
          },
        ),
      )
    );
  }
}
