import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/background.dart';
import '../login/login.dart';


class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobilenumberController = TextEditingController();

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
                "REGISTER",
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
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: "Name"
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _mobilenumberController,
                decoration: InputDecoration(
                    labelText: "Mobile Number"
                ),
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

            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: (){
                  _register();
                  // Get.to(const Home());
                },
                child: Text(
                  'Register',
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

            // Container(
            //   alignment: Alignment.centerRight,
            //   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       _register();
            //     },
            //     // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
            //     // textColor: Colors.white,
            //     // padding: const EdgeInsets.all(0),
            //     child: Container(
            //       alignment: Alignment.center,
            //       height: 50.0,
            //       width: size.width * 0.5,
            //       decoration: new BoxDecoration(
            //           borderRadius: BorderRadius.circular(80.0),
            //           gradient: new LinearGradient(
            //               colors: [
            //                 Color.fromARGB(255, 255, 136, 34),
            //                 Color.fromARGB(255, 255, 177, 41)
            //               ]
            //           )
            //       ),
            //       padding: const EdgeInsets.all(0),
            //       child: Text(
            //         "SIGN UP",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                },
                child: Text(
                  "Already Have an Account? Sign in",
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
  void _register() async {

    String enteredName = _nameController.text;
    String enteredMobile = _mobilenumberController.text;

    String enteredUsername = _usernameController.text;
    String enteredPassword = _passwordController.text;

    if (enteredUsername.isNotEmpty && enteredPassword.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('name', enteredName);
      prefs.setString('mobile_number', enteredMobile);

      prefs.setString('username', enteredUsername);
      prefs.setString('password', enteredPassword);

      _showDialog(context,'Registration Successful', 'You can now log in.');
      _usernameController.text="";
      _passwordController.text="";
      _nameController.text="";
      _mobilenumberController.text="";
    } else {
      _showDialog(context,'Registration Failed', 'Please enter both username and password.');
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