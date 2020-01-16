import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  void testPasscode(num pass) {
    print(pass);

    if (pass == 5555) {
      Navigator.pushReplacementNamed(context, '/navigation');
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(70.0),
          child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Passcode",
              ),
              onChanged: (pass) {
                testPasscode(int.parse(pass));
              },
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
              ])),
    );
  }
}
