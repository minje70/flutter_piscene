import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  InputText({Key? key}) : super(key: key);

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final _controller = TextEditingController();
  final _focusNode = FocusScopeNode();
  String? _errorMessege;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '카드 번호를 입력하세요.',
                errorText: _errorMessege,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50), padding: EdgeInsets.all(16)),
            onPressed: () {
              setState(() {
                _errorMessege = null;
              });
              if (_controller.value.text == '42') {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('check in Success'),
                  duration: Duration(milliseconds: 500),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('check in Fail'),
                  duration: Duration(milliseconds: 500),
                ));
              }
              if (_controller.value.text.isEmpty) {
                setState(() {
                  _errorMessege = '입력이 올바르지 않습니다.';
                });
              }
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Text(
              'CHECK IN',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check In'),
        centerTitle: false,
      ),
      body: InputText(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FirstPage(),
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
  ));
}
