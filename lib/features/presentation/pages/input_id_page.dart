import 'package:flutter/material.dart';
import 'package:iot_water_meter/features/presentation/widgets/custom_button.dart';
import 'package:iot_water_meter/features/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_text_field.dart';

class InputIDPage extends StatefulWidget {
  const InputIDPage({super.key});

  @override
  State<InputIDPage> createState() => _InputIDPageState();
}

class _InputIDPageState extends State<InputIDPage> {
  final inputIdController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CustomOutlineTextField(
                label: "DevID",
                hintText: "DevID",
                controller: inputIdController,
                prefixIcon: const Icon(Icons.person_rounded),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: "Lanjut",
              onPressed: () {
                _saveInput();
              },
            )
          ],
        ),
      ),
    );
  }

  void _saveInput() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('devID', inputIdController.text);
    inputIdController.text = '';
    router.pushNamed('home');
  }
}
