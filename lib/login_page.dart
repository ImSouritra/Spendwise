import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'TransactionPage.dart';
import 'constants.dart';
import 'input_page.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';



Map<String, dynamic> userData = {
  'userId': 1,
  'userFirstName': 'Souritra',
  'userLastName' : 'Samajdar',
  'userEmail': 'abhiraajsamajdar@gmail.com',
  'userPassword': '12345678',
  'userPhoto': 'images/man.png',
  'accNumber':'45689292',
};


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Colors.transparent, // Set the background color to transparent
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "images/loginpage_background.png"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                SizedBox(
                  height: constraints.maxHeight * .3 + 50,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.92),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello,",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Please login to your account",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_sharp)
                        ],
                      ),
                      SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                          color: grayColor.withOpacity(0.3),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: _emailController,
                          decoration:
                          InputDecoration.collapsed(hintText: 'Email'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                          color: grayColor.withOpacity(0.3),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          decoration:
                          InputDecoration.collapsed(hintText: 'Password'),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Spacer(),
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: smallFontSize.toDouble(),
                                fontWeight: mediumFontWeight,
                                color: grayColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (userData["userEmail"] == _emailController.text && userData["userPassword"] == _passwordController.text) {
                              print("Successfully signed in");
                              setState(() {
                                isLoggedIn=true;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InputPage(userData:userData)),
                              );
                            } else{
                              print("Wrong credientials");
                            }
                            // Add your sign-in logic here
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: mediumFontSize.toDouble(),
                                fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(secondaryColor),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Or",
                            style: TextStyle(
                                fontSize: smallFontSize.toDouble(),
                                fontWeight: mediumFontWeight,
                                color: grayColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFF4267B2), // Facebook color
                                shape: BoxShape.circle,
                              ),
                              child: Icon(FontAwesomeIcons.facebookF,
                                  color: Colors.white),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFFDB4437), // Google color
                                shape: BoxShape.circle,
                              ),
                              child: Icon(FontAwesomeIcons.google,
                                  color: Colors.white),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFF1DA1F2), // Twitter color
                                shape: BoxShape.circle,
                              ),
                              child: Icon(FontAwesomeIcons.twitter,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont have an account? Sign Up",
                            style: TextStyle(
                                fontSize: smallFontSize.toDouble(),
                                fontWeight: heavyFontWeight,
                                color: grayColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
  }

