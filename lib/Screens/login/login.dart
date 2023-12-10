import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/background.dart';
import '../register/register.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36
                ),
                textAlign: TextAlign.left,
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: "Username"
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Row(
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 10, 0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText:
                      !showPassword, // Toggle password visibility
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be 6";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Icon(
                      showPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),

            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                "Forgot your password?",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0XFF2661FA)
                ),
              ),
            ),

            SizedBox(height: size.height * 0.05),

            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
               child: ElevatedButton(
                onPressed: (){
                  _login();
      // Get.to(const Home());
      },
        child: Text(
          'Login',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22
          ),
        ),
        style: ElevatedButton.styleFrom(

            primary: Color(0xfffa5582),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
                // gradient: new LinearGradient(
                  //             colors: [
                  //               Color.fromARGB(255, 255, 136, 34),
                  //               Color.fromARGB(255, 255, 177, 41)
                  //             ]
                  //         )
            )
        ),
      ),
              // child: RaisedButton(
              //
              //   onPressed: () {
              //     _login();
              //   },
              //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
              //   textColor: Colors.white,
              //   padding: const EdgeInsets.all(0),
              //   child: Container(
              //     alignment: Alignment.center,
              //     height: 50.0,
              //     width: size.width * 0.5,
              //     decoration: new BoxDecoration(
              //         borderRadius: BorderRadius.circular(80.0),
              //         gradient: new LinearGradient(
              //             colors: [
              //               Color.fromARGB(255, 255, 136, 34),
              //               Color.fromARGB(255, 255, 177, 41)
              //             ]
              //         )
              //     ),
              //     padding: const EdgeInsets.all(0),
              //     child: Text(
              //       "LOGIN",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //           fontWeight: FontWeight.bold
              //       ),
              //     ),
              //   ),
              // ),
            ),

            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()))
                },
                child: Text(
                  "Don't Have an Account? Sign up",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  // void _register() async {
  //
  //   // String enteredName = _nameController.text;
  //   // String enteredMobile = _mobilenumberController.text;
  //
  //   String enteredUsername = _usernameController.text;
  //   String enteredPassword = _passwordController.text;
  //
  //   if (enteredUsername.isNotEmpty && enteredPassword.isNotEmpty) {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //     // prefs.setString('name', enteredName);
  //     // prefs.setString('mobile_number', enteredMobile);
  //
  //     prefs.setString('username', enteredUsername);
  //     prefs.setString('password', enteredPassword);
  //
  //     _showDialog(context,'Registration Successful', 'You can now log in.');
  //     _usernameController.text="";
  //     _passwordController.text="";
  //     // _nameController.text="";
  //     // _mobilenumberController.text="";
  //   } else {
  //     _showDialog(context,'Registration Failed', 'Please enter both username and password.');
  //   }
  // }
  void _login() async {
    print('login');
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');

    String enteredUsername = _usernameController.text;
    String enteredPassword = _passwordController.text;

    if (enteredUsername == storedUsername && enteredPassword == storedPassword) {
      print('loginsuccess');
      _showDialog(context,'Login Successful', 'Welcome, $enteredUsername!');
    } else {
      _showDialog(context,'Login Failed', 'Invalid username or password.');
    }
  }
  void _showDialog(context,String title, String content) {
    showDialog(
      context:  context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}