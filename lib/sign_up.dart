import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup_login/reusable_code/constants.dart';
import 'package:signup_login/reusable_code/custom_button.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({Key? key}) : super(key: key);

  @override
  State<SignUpPageWidget> createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Color(0xff7339ac)),
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          // title: const Text("Sign Up Page"),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Stack(
                    children: const [
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                          radius: 50),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Color(0xff7339ac),
                          child: Icon(
                            Icons.edit,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  const Text(
                    "Create Account",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff7339ac),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LibreBarnesville'),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      // contentPadding: EdgeInsets.only(top:10),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xff7339ac),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff7339ac),
                        ),
                      ),
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Color(0xff7339ac)),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Username";
                      } else if (!RegExp(r'^[a-zA-z]+$').hasMatch(value)) {
                        return "Not Valid Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Color(0xff7339ac)),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color(0xff7339ac)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff7339ac),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Email";
                      } else {
                        if (value.length < 6) {
                          return "Minimum 6 length is Required";
                        } else {
                          return null;
                        }
                      }
                    },
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                    // ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone, color: Color(0xff7339ac)),
                      labelText: 'Phone',
                      labelStyle: TextStyle(color: Color(0xff7339ac)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff7339ac),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter password";
                      } else {
                        if (value.length < 6) {
                          return "Minimum 6 length is Required";
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon:
                          Icon(Icons.password, color: Color(0xff7339ac)),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Color(0xff7339ac)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff7339ac),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter password";
                      } else {
                        if (value.length < 6) {
                          return "Minimum 6 length is Required";
                        } else {
                          return null;
                        }
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        return;
                      }
                    },
                    name: 'Create Account',
                    style: elevatedButtonStyle.copyWith(
                      minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
