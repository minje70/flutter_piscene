import 'package:flutter/material.dart';
import 'bmi_output_page.dart';

class InputPage extends StatelessWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: false,
      ),
      body: InputData(),
    );
  }
}

class InputData extends StatefulWidget {
  InputData({Key? key}) : super(key: key);

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  bool isWeightObscure = false;

  final _focusNode = FocusScopeNode();
  String? _heightErrorMessege;
  String? _weightErrorMessege;

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            setState(() {
              _heightErrorMessege = null;
              _weightErrorMessege = null;
            });
            if (_heightController.value.text.isEmpty) {
              setState(() {
                _heightErrorMessege = 'Input Height.';
              });
            }
            if (_weightController.value.text.isEmpty) {
              setState(() {
                _weightErrorMessege = 'Input Weight.';
              });
            }
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _heightController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Input Height(cm)',
                    errorText: _heightErrorMessege,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _weightController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Input Weight(kg)',
                    errorText: _weightErrorMessege,
                  ),
                  obscureText: isWeightObscure,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
              ),
              Switch(
                  value: isWeightObscure,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      isWeightObscure = !isWeightObscure;
                    });
                  }),
              Text('Weight : ${isWeightObscure ? '****' : 'digit'}'),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    padding: EdgeInsets.all(16)),
                onPressed: () {
                  if (!_heightController.value.text.isEmpty &&
                      !_weightController.value.text.isEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OutputPage(
                          height: double.parse(_heightController.value.text),
                          weight: double.parse(_weightController.value.text),
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  'Calculation',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
